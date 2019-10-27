package com.logistics.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Attendance;
import com.logistics.po.Custom;
import com.logistics.po.User;
import com.logistics.service.IAttendanceService;
import com.logistics.service.ICustomService;
import com.logistics.service.IFundrecordService;
import com.logistics.service.IOrderformService;
import com.logistics.service.IPowerService;
import com.logistics.service.IUserService;
import com.logistics.util.ChangeUtil;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.MD5Util;
import com.logistics.util.RMessage;
import com.logistics.util.ReadFileUtil;
import com.logistics.util.Tools;
import com.logistics.util.ValidateIDCardPhotoUtil;
import com.logistics.vo.FundRecordVo;
import com.logistics.vo.OrderformVo;
import com.logistics.vo.PowerVo;

@Controller
@RequestMapping("/MainController")
public class MainController {
	@Autowired
	IUserService iUserService;
	@Autowired
	IPowerService iPowerService;
	@Autowired
	ICustomService iCustomService;
	@Autowired
	IAttendanceService iattendaceService;
	@Autowired
	IFundrecordService iFundrecordService;
	@Autowired
	IOrderformService iOrderformService;
	User user = null;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/main")
	public ModelAndView main(HttpSession session, Map map) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("Main");

			mv.addObject("user", user);
			if (user.getInstitutionalorganizationid() == 2) {
				map.put("audit", "false");
				map.put("IsIndeedUpload", 1);
				map.put("startIndex", 0);
				map.put("pageSize", 10000);

				List<OrderformVo> list = iOrderformService.findPageOrder(map);
				mv.addObject("orderFormlist", list.size());
				map.clear();
				map.put("startIndex", 0);
				map.put("pageSize", 10000);
				map.put("statusid", 17);
				List<OrderformVo> list1 = iOrderformService.findPageOrder(map);
				mv.addObject("NeworderFormlist", list1.size());
			} else {
				map.clear();
				map.put("audit", true);
				map.put("iscancel", true);
				map.put("isfinish", false);
				map.put("userid", user.getUserid());
				map.put("IsIndeedUpload", 1);
				map.put("startIndex", 0);
				map.put("pageSize", 10000);
				map.put("IsIndeedUpload", 1);
				List<OrderformVo> canclelist = iOrderformService
						.findPageOrder(map);
				mv.addObject("canclelist", canclelist.size());
			}
		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	/**
	 * 查询权限
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/selectPower")
	protected void selectPower(PrintWriter pw,
			@SuppressWarnings("rawtypes") Map map) {
		map.put("userid", user.getUserid());
		List<PowerVo> list = iPowerService.findPower(map);

		RMessage.returnMessage(pw, null, list, null);

	}

	/**
	 * 客户注册
	 * 
	 * @param request
	 * @param response
	 * @throws FileNotFoundException
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/register")
	protected void register(
			HttpServletRequest request,
			Custom custom,
			@RequestParam(value = "picture", required = true) MultipartFile myFile,
			String PhoneYanZhengMa, String confirmloginpassword, PrintWriter pw)
			throws FileNotFoundException, IOException {
		JsonReturn jsonReturn = new JsonReturn();
		int k = 0;
		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp";
		File uploadDir = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir.exists()) {
			uploadDir.mkdir();

		}
		String uploadFileName = ReadFileUtil.readWriteFile(
				myFile.getInputStream(), myFile.getOriginalFilename(),
				uploadPath);

		String IDPhotoUrl = uploadPath + "\\" + uploadFileName;
		if (custom != null && Tools.isNotNull(custom.getCustompassword())
				&& Tools.isNotNull(custom.getCustomidnumber())
				&& Tools.isNotNull(custom.getCustomname())
				&& Tools.isNotNull(custom.getCustomphonenumber())) {

			if (confirmloginpassword.equals(custom.getCustompassword())) {
				if (PhoneYanZhengMa.equals(ChangeUtil.sessionpotting(
						"PHCODECODE", null, false, 0, request.getSession()))) {
					if (ValidateIDCardPhotoUtil.ValidateIDPoto(IDPhotoUrl,
							"front", custom.getCustomidnumber())) {
						custom.setCustomidphoto(uploadFileName);

						custom.setCustompassword(MD5Util.getMD5(custom
								.getCustompassword()));
						int r = iCustomService.insert(custom);
						if (r > 0) {
							jsonReturn.setMsg("新增成功！！！！");
							jsonReturn.setState(true);
						} else {
							jsonReturn.setMsg("新增失败！！！！");
							jsonReturn.setState(false);
							k = 1;
						}
					} else {
						jsonReturn.setMsg("身份证号码与身份证照片上的号码不一致！！！！");
						jsonReturn.setState(false);
						k = 1;
					}

				} else {
					jsonReturn.setMsg("验证码错误！！！！");
					jsonReturn.setState(false);
					k = 1;
				}
			} else {
				jsonReturn.setMsg("两次密码不一致！！");
				jsonReturn.setState(false);
				k = 1;
			}
		} else {
			jsonReturn.setMsg("请填写完整数据！！");
			jsonReturn.setState(false);
			k = 1;
		}

		if (k > 0) {
			File oldFile = new File(IDPhotoUrl);
			if (oldFile.exists() && oldFile.isFile()) {
				oldFile.delete();
			}
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);

	}

	/**
	 * 查询用户是否在线
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/checkLogin")
	protected void checkLogin(PrintWriter pw,
			@SuppressWarnings("rawtypes") Map map, HttpSession session,
			HttpServletResponse response) throws IOException {

		JsonReturn jsonReturn = new JsonReturn();
		try {

			User newuser = iUserService.selectByPrimaryKey(user.getUserid());
			if (newuser != null) {
				if (newuser.getOnlinetime() != null) {

					newuser.setOnlinetime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));
					int b = iUserService.updateByPrimaryKey(newuser);
					if (b > 0) {
						String json = "";
						String Approval = null;
						List<Attendance> list = new ArrayList<Attendance>();
						List<FundRecordVo> listFun = new ArrayList<FundRecordVo>();
						List<OrderformVo> list1 = null;
						List<OrderformVo> list2 = null;
						if (newuser.getInstitutionalorganizationid() == 4) {
							map.put("isaudit", 0);
							map.put("Reason", "''");
							map.put("startWorkTime", GetTimeUtil.getNowTime()
									.substring(0, 10));
							list = iattendaceService.findAttendance(map);
							if (list.size() > 0) {
								Approval = "true";
							}
							map.clear();
							map.put("IsAudit", 0);
							map.put("startIndex", 0);
							map.put("pageSize", 10);

							listFun = iFundrecordService.findPage(map);

						} else {
							map.put("userid", user.getUserid());
							map.put("Reverse", user.getUserid());
							map.put("empty", user.getUserid());
							map.put("IsRatification", 0);
							map.put("isaudit", 1);
							map.put("startWorkTime", GetTimeUtil.getNowTime()
									.substring(0, 10));
							list = iattendaceService.findAttendance(map);
							if (list.size() > 0) {
								Approval = "false";
							} else {
								map.put("IsRatification", 1);
								list = iattendaceService.findAttendance(map);
								if (list.size() > 0) {
									Approval = "true";
								} else {
									Approval = null;
								}
							}

						}

						if (newuser.getInstitutionalorganizationid() == 2) {
							map.put("audit", "false");
							map.put("IsIndeedUpload", 1);
							map.put("startIndex", 0);
							map.put("pageSize", 10000);

							list1 = iOrderformService.findPageOrder(map);

							map.clear();
							map.put("startIndex", 0);
							map.put("pageSize", 10000);
							map.put("statusid", 17);
							list2 = iOrderformService.findPageOrder(map);

						}

						json = "{"
								+ ChangeUtil.changeJson("Approval", Approval)
								+ ","
								+ ChangeUtil.changeJson("listFun",
										listFun.size())
								+ ","
								+ ChangeUtil.changeJson("auditlist",
										list1.size())
								+ ","
								+ ChangeUtil.changeJson("Appointmentlist",
										list2.size()) + "}";
						jsonReturn.setMsg(json);
						jsonReturn.setState(true);

					} else {
						jsonReturn.setMsg("fail");
						jsonReturn.setState(false);
						ChangeUtil.destroySession(session, "USERINFO");
					}
				} else {

					ChangeUtil.destroySession(session, "USERINFO");
					jsonReturn.setMsg("fail");
					jsonReturn.setState(false);

				}
			} else {
				ChangeUtil.destroySession(session, "USERINFO");
				jsonReturn.setMsg("fail");
				jsonReturn.setState(false);

			}
		} catch (Exception e) {
			e.printStackTrace();

			jsonReturn.setMsg("fail");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);

	}
}
