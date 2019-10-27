package com.logistics.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Attendance;
import com.logistics.po.Car;
import com.logistics.po.User;
import com.logistics.service.IAttendanceService;
import com.logistics.service.ICarService;
import com.logistics.service.IUserService;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.RMessage;
import com.logistics.util.Tools;
import com.logistics.vo.AttendanceVo;

@Controller
@RequestMapping("/SignController")
public class SignController {

	@Autowired
	IAttendanceService attendaceService;
	@Autowired
	IUserService iUserService;
	@Autowired
	ICarService iCarService;

	private User user;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/signIn")
	public ModelAndView signIn(HttpSession session, Map map) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("Sign");
			mv.addObject("user", user);
			String bol = "请签到";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			map.put("userid", user.getUserid());

			List<AttendanceVo> attendancesList = attendaceService
					.findBySQL(map);
			if (attendancesList.size() > 0) {

				if ("上班已签到".equals(attendancesList.get(
						attendancesList.size() - 1).getMark())) {
					bol = "上班已签到";
				} else if ("下班已签到".equals(attendancesList.get(
						attendancesList.size() - 1).getMark())) {
					bol = "下班已签到";
				}
			}
			mv.addObject("bol", bol);
			map.clear();
			map.put("userid", user.getUserid());
			List<AttendanceVo> list1 = attendaceService.findBySQL(map);
			List<String> strList = new ArrayList<String>();
			if (list1.size() > 0) {

				for (int i = 0; i < list1.size(); i++) {

					String Time = sdf.format(new Date(list1.get(i)
							.getStartworktime().getTime()));
					String endTime = "";
					if (list1.get(i).getOffwork() != null) {
						endTime = sdf.format(new Date(list1.get(i).getOffwork()
								.getTime()));
						endTime = endTime.replace("-", "");
						endTime = endTime.substring(0, 8);
						strList.add(endTime);
					}

					Time = Time.replace("-", "");

					Time = Time.substring(0, 8);

					strList.add(Time);

				}
			}

			mv.addObject("strList", strList);

			mv.addObject("InstitutionalOrganizationID",
					user.getInstitutionalorganizationid());

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	/**
	 * 查询出勤
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	@ResponseBody
	protected DatatablesViewPage<AttendanceVo> getList(Integer length,
			Integer start, @SuppressWarnings("rawtypes") Map map) {
		map.clear();
		map.put("userid", user.getUserid());
		map.put("startIndex", start);
		map.put("pageSize", length);

		DatatablesViewPage<AttendanceVo> view = new DatatablesViewPage<AttendanceVo>();
		List<AttendanceVo> list = attendaceService.findPage(map);
		int totalRows = attendaceService.getTotalRow(map);
		view.setiTotalDisplayRecords(totalRows);
		view.setiTotalRecords(totalRows);

		view.setAaData(list);
		return view;

	}

	/***
	 * 上下班签到
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/insert")
	protected void insert(PrintWriter pw, String oilmass, String mileage,
			String location, Map map) {
		JsonReturn jsonReturn = new JsonReturn();
		if (user != null) {

			Attendance attendance = new Attendance();
			map.put("userid", user.getUserid());
			List<AttendanceVo> list = attendaceService.findBySQL(map);
			if (list.size() > 0) {
				if (list.get(list.size() - 1).getOffwork() == null
						|| (GetTimeUtil.changeStrToTime(
								GetTimeUtil.getNowTime()).getTime() - list
								.get(list.size() - 1).getOffwork().getTime())
								/ (1000 * 60 * 60) >= 8) {

					if (list.get(list.size() - 1).getStartworktime() != null
							&& list.get(list.size() - 1).getOffwork() != null) {
						attendance.setStartworktime(GetTimeUtil
								.changeStrToTime(GetTimeUtil.getNowTime()));

						attendance.setUserid(user.getUserid());
						attendance.setMark("上班已签到");

						attendance.setOffwork(null);

						User newuser = iUserService.selectByPrimaryKey(user
								.getUserid());
						Car car = iCarService.findByUserID(user.getUserid());
						if (newuser.getInstitutionalorganizationid() == 3) {

							if (car != null) {
								if (car.getStatusid() != 11) {
									car.setStatusid(1);
								}

							}
							if (Tools.isNotNull(location)
									&& Tools.isNotNull(mileage)
									&& Tools.isNotNull(oilmass)) {
								iCarService.updateByPrimaryKey(car);
								attendance.setStartlocation(location);
								attendance.setStartmileage(Float
										.valueOf(mileage));
								attendance.setStartoilmass(Float
										.valueOf(oilmass));
								attendance.setCarid(car.getCarid());
							} else {
								jsonReturn.setMsg("请填写完整数据！！");
								jsonReturn.setState(false);
								RMessage.returnMessage(pw, jsonReturn, null,
										null);
								return;
							}
						}
						newuser.setStatusid(2);
						int b = iUserService.updateByPrimaryKey(newuser);
						if (b > 0) {
							int bol = attendaceService.insert(attendance);
							if (bol > 0) {

								jsonReturn.setMsg("签到成功！！");
								jsonReturn.setState(true);
							} else {
								jsonReturn.setMsg("签到失败");
								jsonReturn.setState(false);
							}
						} else {
							jsonReturn.setMsg("签到失败");
							jsonReturn.setState(false);
						}
					} else {
						if (((GetTimeUtil.changeStrToTime(
								GetTimeUtil.getNowTime()).getTime() - list
								.get(list.size() - 1).getStartworktime()
								.getTime())
								/ (1000 * 60 * 60) >= 8)
								|| (list.get(list.size() - 1)
										.getIsratification() != null && list
										.get(list.size() - 1)
										.getIsratification() == true)) {

							attendance = attendaceService
									.selectByPrimaryKey(list.get(
											list.size() - 1).getAttendanceid());

							attendance.setOffwork(GetTimeUtil
									.changeStrToTime(GetTimeUtil.getNowTime()));
							attendance.setMark("下班已签到");
							Car car = iCarService
									.findByUserID(user.getUserid());
							User newuser = iUserService.selectByPrimaryKey(user
									.getUserid());
							newuser.setStatusid(2);
							if (newuser.getInstitutionalorganizationid() == 3) {

								if (Tools.isNotNull(location)
										&& Tools.isNotNull(mileage)
										&& Tools.isNotNull(oilmass)) {

									attendance.setOfflocation(location);
									attendance.setOffmileage(Float
											.valueOf(mileage));
									attendance.setOffoilmass(Float
											.valueOf(oilmass));
									attendance.setCarid(car.getCarid());
								} else {
									jsonReturn.setMsg("请填写完整数据！！");
									jsonReturn.setState(false);
									RMessage.returnMessage(pw, jsonReturn,
											null, null);
									return;
								}
							}
							int r = iUserService.updateByPrimaryKey(newuser);
							int bol = attendaceService
									.updateByPrimaryKey(attendance);

							if (bol > 0 && r > 0) {

								jsonReturn.setMsg("签到成功！！");
								jsonReturn.setState(true);
							} else {
								jsonReturn.setMsg("签到失败");
								jsonReturn.setState(false);
							}

						} else {
							jsonReturn.setMsg("下班时间还没有到，不可以签到！！");
							jsonReturn.setState(false);
						}
					}
				} else {
					jsonReturn.setMsg("您下班已经签到成功 ，不需要再次签到！！");
					jsonReturn.setState(false);
				}
			} else {
				attendance.setUserid(user.getUserid());
				attendance.setMark("上班已签到");
				attendance.setOffwork(null);
				attendance.setStartworktime(GetTimeUtil
						.changeStrToTime(GetTimeUtil.getNowTime()));
				User newuser = iUserService
						.selectByPrimaryKey(user.getUserid());
				Car car = iCarService.findByUserID(user.getUserid());
				if (newuser.getInstitutionalorganizationid() == 3) {

					if (car != null) {

						if (car.getStatusid() != 11) {
							car.setStatusid(1);
						}

						iCarService.updateByPrimaryKey(car);

					}

					if (Tools.isNotNull(location) && Tools.isNotNull(mileage)
							&& Tools.isNotNull(oilmass)) {
						attendance.setStartlocation(location);
						attendance.setStartmileage(Float.valueOf(mileage));
						attendance.setStartoilmass(Float.valueOf(oilmass));
						attendance.setCarid(car.getCarid());
					} else {
						jsonReturn.setMsg("请填写完整数据！！");
						jsonReturn.setState(false);
						RMessage.returnMessage(pw, jsonReturn, null, null);
						return;
					}
				}
				newuser.setStatusid(2);
				int b = iUserService.updateByPrimaryKey(newuser);
				if (b > 0) {
					int bol = attendaceService.insert(attendance);
					if (bol > 0) {

						jsonReturn.setMsg("签到成功！！");
						jsonReturn.setState(true);
					} else {
						jsonReturn.setMsg("签到失败");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("签到失败");
					jsonReturn.setState(false);
				}
			}

		} else {
			jsonReturn.setMsg("请重新登录！！！");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);

	}

	/**
	 * 查询改用操作员是否有车辆
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/selectCar")
	protected void selectCar(PrintWriter pw) {
		JsonReturn jsonReturn = new JsonReturn();
		Car car = iCarService.findByUserID(user.getUserid());
		if (car != null) {
			jsonReturn.setMsg("有");
			jsonReturn.setState(true);

		} else {
			jsonReturn.setMsg("无");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 突发情况
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/updateQingJia")
	protected void updateQingJia(PrintWriter pw, String AttendanceID,
			String Reason, String LeaveDay) {
		JsonReturn jsonReturn = new JsonReturn();

		Attendance attendance = new Attendance();
		if (Tools.isNotNull(AttendanceID) && Tools.isNotNull(Reason)
				&& Tools.isNotNull(LeaveDay)) {

			attendance = attendaceService.selectByPrimaryKey(Integer
					.valueOf(AttendanceID));

			if (attendance != null) {

				if (attendance.getReason() == null) {

					attendance.setReason(Reason);
					attendance.setLeaveday(LeaveDay);
					attendance.setIsratification(false);
					attendance.setApplicationtime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));
					attendance.setIsaudit(false);
					int bol = attendaceService.updateByPrimaryKey(attendance);
					if (bol > 0) {
						jsonReturn.setMsg("提交成功，请等待审核！！！");
						jsonReturn.setState(true);
					} else {
						jsonReturn.setMsg("提交失败！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("您已经请假了，请等待审核！！！");
					jsonReturn.setState(false);

				}
			} else {
				jsonReturn.setMsg("沒有此數據！！！");
				jsonReturn.setState(false);
			}

		} else {
			jsonReturn.setMsg("请填写完整数据！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 查询详细信息
	 * 
	 * @param pw
	 * @param map
	 * @param AttendanceID
	 */
	@RequestMapping("/selectInfor")
	public void selectInfor(PrintWriter pw,
			@SuppressWarnings("rawtypes") Map map, Integer AttendanceID) {
		Attendance attendance = null;
		if (AttendanceID > 0) {
			attendance = attendaceService.selectByPrimaryKey(AttendanceID);

		}
		pw.write(JSONObject.fromObject(attendance).toString());
		pw.close();
	}
}
