package com.logistics.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Attendance;
import com.logistics.po.Car;
import com.logistics.po.Fundrecord;
import com.logistics.po.User;
import com.logistics.service.IAttendanceService;
import com.logistics.service.ICarService;
import com.logistics.service.IFundrecordService;
import com.logistics.service.IUserService;
import com.logistics.util.ChangeUtil;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.RMessage;
import com.logistics.util.Tools;
import com.logistics.vo.AttendanceVo;
import com.logistics.vo.FundRecordVo;

@Controller
@RequestMapping("/AdministratorsController")
public class AdministratorsController {
	@Autowired
	IFundrecordService iFundrecordService;
	@Autowired
	IUserService iUserService;
	@Autowired
	IAttendanceService iattendanceService;
	@Autowired
	ICarService iCarService;
	User user;

	@SuppressWarnings({ "rawtypes" })
	@RequestMapping("/auditApproval")
	public ModelAndView auditApproval(HttpSession session, Map map) {
		ModelAndView mv = null;

		user = (User) ChangeUtil.sessionpotting("USERINFO", null, false, -1,
				session);
		if (user != null) {

			List<User> list = iUserService.findAll(map);
			mv = new ModelAndView("AuditApproval");
			mv.addObject("list", list);

		} else {
			mv = new ModelAndView("Login");
		}
		return mv;
	}

	@SuppressWarnings({ "rawtypes" })
	@RequestMapping("/auditLeave")
	public ModelAndView auditLeave(HttpSession session, Map map) {
		ModelAndView mv = null;

		user = (User) ChangeUtil.sessionpotting("USERINFO", null, false, -1,
				session);
		if (user != null) {

			List<User> list = iUserService.findAll(map);
			mv = new ModelAndView("AuditLeave");
			mv.addObject("list", list);

		} else {
			mv = new ModelAndView("Login");
		}
		return mv;
	}

	/**
	 * 查询审批数据
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	@ResponseBody
	protected DatatablesViewPage<FundRecordVo> getList(Map map, Integer length,
			Integer start, String Auditing, Integer UserID, String startTime,
			String endTime) {
		if (Tools.isNotNull(Auditing)) {
			map.put("IsAudit", Auditing);
		}
		if (Tools.isNotNull(String.valueOf(UserID))) {
			map.put("userid", UserID);

		}

		if (Tools.isNotNull(startTime)) {
			map.put("startTime", startTime);
		}
		if (Tools.isNotNull(endTime)) {
			map.put("endTime", endTime);
		}

		DatatablesViewPage<FundRecordVo> view = new DatatablesViewPage<FundRecordVo>();
		if (length >= 0 && start >= 0) {

			map.put("startIndex", start);
			map.put("pageSize", length);

			List<FundRecordVo> list = iFundrecordService.findPage(map);

			int totalRows = iFundrecordService.getTotalRows(map);

			view.setiTotalDisplayRecords(totalRows);
			view.setiTotalRecords(totalRows);

			view.setAaData(list);
			return view;
		}

		return null;
	}

	/**
	 * 审核数据
	 * 
	 * @param fundRecordID
	 * @param pw
	 */
	@RequestMapping("/auditMenoy")
	protected void auditMenoy(Integer fundRecordID, PrintWriter pw) {
		JsonReturn jsonReturn = new JsonReturn();

		if (fundRecordID > 0) {

			Fundrecord fundRecord = iFundrecordService
					.selectByPrimaryKey(fundRecordID);
			if (fundRecord != null) {
				if (fundRecord.getIsaudit() == false) {

					fundRecord.setIsaudit(true);
					fundRecord.setRemark("申请已批准，稍后会转账到您的账户！！");
					fundRecord.setAuditorid(user.getUserid());
					fundRecord.setAudittime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));
					User newuser = iUserService.selectByPrimaryKey(fundRecord
							.getUserid());

					if (newuser != null) {
						newuser.setRemainingsum(newuser.getRemainingsum()
								- fundRecord.getExtractmoney());
						int bol = iUserService.updateByPrimaryKey(newuser);

						if (bol > 0) {

							int b = iFundrecordService
									.updateByPrimaryKey(fundRecord);
							if (b > 0) {
								jsonReturn.setMsg("审批成功！！");
								jsonReturn.setState(true);
							} else {
								jsonReturn.setMsg("审批失败！！");
								jsonReturn.setState(false);
							}
						} else {
							jsonReturn.setMsg("审批失败！！");
							jsonReturn.setState(false);
						}
					} else {
						jsonReturn.setMsg("没有此记录！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("已审批，不用再次审批！！");
					jsonReturn.setState(false);
				}
			} else {

			}

		} else {
			jsonReturn.setMsg("请选择数据！！");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 查询请假数据
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/getListleave", method = RequestMethod.GET)
	@ResponseBody
	protected DatatablesViewPage<AttendanceVo> getListleave(Integer length,
			Integer start, String Auditing, Integer UserID, String startTime,
			String endTime, Map map) {

		if (Tools.isNotNull(Auditing)) {
			map.put("isaudit", Auditing);
		}
		if (Tools.isNotNull(String.valueOf(UserID))) {
			map.put("userid", UserID);
		}

		if (Tools.isNotNull(startTime)) {
			map.put("startTime", startTime);
		}
		if (Tools.isNotNull(endTime)) {
			map.put("endTime", endTime);

		}
		map.put("Reason", "");
		DatatablesViewPage<AttendanceVo> view = new DatatablesViewPage<AttendanceVo>();
		if (length > 0 && start >= 0) {
			map.put("startIndex", start);
			map.put("pageSize", length);
			List<AttendanceVo> list = iattendanceService.findPage(map);
			int totalRows = iattendanceService.getTotalRow(map);

			view.setiTotalDisplayRecords(totalRows);
			view.setiTotalRecords(totalRows);

			view.setAaData(list);
			return view;
		}

		return null;

	}

	/**
	 * 批准请假
	 * 
	 * @param pw
	 * @param attendanceID
	 */
	@RequestMapping("/Approval")
	protected void Approval(PrintWriter pw, Integer attendanceID) {
		JsonReturn jsonReturn = new JsonReturn();

		if (attendanceID > 0) {

			Attendance attendance = iattendanceService
					.selectByPrimaryKey((attendanceID));
			if (attendance != null) {

				if (attendance.getIsaudit() == false) {
					attendance.setRemark("已批准，可以下班了！");
					attendance.setIsratification(true);
					attendance.setAuditorid(user.getUserid());
					attendance.setAudittime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));
					attendance.setIsaudit(true);
					User user = iUserService.selectByPrimaryKey(attendance
							.getUserid());
					if (user != null) {

						user.setStatusid(16);
						Car car = iCarService.findByUserID(attendance
								.getUserid());

						if (car != null) {
							car.setStatusid(14);
							iCarService.updateByPrimaryKey(car);
						}

						int b = iUserService.updateByPrimaryKey(user);

						if (b > 0) {
							int bol = iattendanceService
									.updateByPrimaryKey(attendance);
							if (bol > 0) {
								jsonReturn.setMsg("已批准");
								jsonReturn.setState(true);

							} else {
								jsonReturn.setMsg("审批失败！！");
								jsonReturn.setState(false);
							}

						} else {
							jsonReturn.setMsg("审批失败！！");
							jsonReturn.setState(false);
						}

					} else {
						jsonReturn.setMsg("没有此记录！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("已审批，不用再次审核了！！");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("没有此记录！！");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("请选择数据！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 批准请假
	 * 
	 * @param pw
	 * @param attendanceID
	 */
	@RequestMapping("/refuse")
	protected void refuse(PrintWriter pw, Integer attendanceID, String remark) {
		JsonReturn jsonReturn = new JsonReturn();
		if (attendanceID > 0 && Tools.isNotNull(remark)) {

			Attendance attendance = iattendanceService
					.selectByPrimaryKey((attendanceID));
			if (attendance != null) {
				System.err.println(attendance.getIsaudit());
				if (attendance.getIsaudit() == false) {
					attendance.setRemark(remark);
					attendance.setIsratification(false);
					attendance.setAuditorid(user.getUserid());
					attendance.setAudittime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));
					attendance.setIsaudit(true);

					int bol = iattendanceService.updateByPrimaryKey(attendance);
					if (bol > 0) {
						jsonReturn.setMsg("已拒绝！！");
						jsonReturn.setState(true);

					} else {
						jsonReturn.setMsg("拒绝失败！！");
						jsonReturn.setState(false);
					}

				} else {
					jsonReturn.setMsg("已审核，不用再次审核了！！");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("没有此记录！！");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("请输入拒绝的理由！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

}
