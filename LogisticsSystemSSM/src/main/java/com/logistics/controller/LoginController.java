package com.logistics.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.User;
import com.logistics.service.IPowerService;
import com.logistics.service.IUserService;
import com.logistics.util.ChangeUtil;
import com.logistics.util.CookieUtil;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.MD5Util;
import com.logistics.util.RMessage;
import com.logistics.util.SendMessage;
import com.logistics.util.Tools;
import com.logistics.util.UserChat;
import com.logistics.util.ValidateImage.GifCaptcha;

@Controller
@RequestMapping("/LoginController")
public class LoginController implements Serializable {
	@Autowired
	IUserService userService;
	@Autowired
	IPowerService iPowerService;
	/**
	 * 
	 */
	private static final long serialVersionUID = -4763206044323711927L;

	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("Login");
		mv.addObject("PhoneNumber",
				CookieUtil.getCookie("COOKIEUSERPHONE", request));
		mv.addObject("Password",
				CookieUtil.getCookie("COOKIEUSERPASSWORD", request));
		if (Tools.isNotNull(CookieUtil.getCookie("COOKIEUSERTRUE", request))) {
			mv.addObject("ISTrue", true);
		} else {

			mv.addObject("ISTrue", false);
		}

		return mv;
	}

	@RequestMapping("/forget")
	public ModelAndView forget() {
		ModelAndView mv = new ModelAndView("ForgetPassword");

		return mv;
	}

	/**
	 * 验证码
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */

	@SuppressWarnings("unused")
	@RequestMapping("/Identity")
	private void Identity(HttpServletResponse response, HttpSession session)
			throws IOException {
		GifCaptcha captcha = new GifCaptcha(100, 40, 2);

		ServletOutputStream out = response.getOutputStream();
		String identity = captcha.out(out);
		ChangeUtil.destroySession(session, "identity");
		ChangeUtil.sessionpotting("identity", identity, true, 10 * 60, session);
		// ValiPhoto.ValidateBandCardNumber("6225365271562822");

		out.flush();
		out.close();

	}

	/**
	 * 登录
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/userLogin")
	protected void userLogin(HttpSession session, String PhoneNumber,
			String Password, String YanZhengMa, String IsTrue, PrintWriter pw,
			HttpServletRequest request, HttpServletResponse response,
			@SuppressWarnings("rawtypes") Map map) throws ServletException,
			IOException {
		JsonReturn jsonReturn = new JsonReturn();
		Object value = session.getAttribute("USERINFO");
		User olduser = null;
		String Phone = null;
		if (value != null) {
			olduser = (User) value;
			Phone = olduser.getPhonenumber();
		} else {
			Phone = PhoneNumber;
		}
		if (value == null || PhoneNumber.equals(Phone)) {
			try {
				String identity = (String) ChangeUtil.sessionpotting(
						"identity", null, false, 0, session);
				if (Tools.isNotNull(YanZhengMa)
						&& identity.equalsIgnoreCase(YanZhengMa)) {

					User user = userService.login(PhoneNumber, Password);
					if (user != null) {
						long loginTime = 0;
						if (user.getOnlinetime() != null) {
							loginTime = user.getOnlinetime().getTime();
						}
						long nowTime = GetTimeUtil.changeStrToTime(
								GetTimeUtil.getNowTime()).getTime();

						long time = (nowTime - loginTime) / 1000;

						if (time >= 60) {

							User newuser = userService.selectByPrimaryKey(user
									.getUserid());
							newuser.setOnlinetime(GetTimeUtil
									.changeStrToTime(GetTimeUtil.getNowTime()));
							int b = userService.updateByPrimaryKey(newuser);
							if (b > 0) {

								ChangeUtil.sessionpotting("USERINFO", user,
										true, -1, session);

								jsonReturn.setState(true);

								jsonReturn.setMsg("登陆成功");
								if (Tools.isNotNull(IsTrue)
										&& "true".equals(IsTrue)) {

									CookieUtil.setCookie("COOKIEUSERPHONE",
											PhoneNumber, request, response,
											24 * 60 * 60);
									CookieUtil.setCookie("COOKIEUSERPASSWORD",
											Password, request, response,
											24 * 60 * 60);
									CookieUtil.setCookie("COOKIEUSERTRUE",
											IsTrue, request, response,
											24 * 60 * 60);

								} else {
									CookieUtil.destroyCookie("COOKIEUSERPHONE",
											request, response);
									CookieUtil.destroyCookie(
											"COOKIEUSERPASSWORD", request,
											response);
									CookieUtil.destroyCookie("COOKIEUSERTRUE",
											request, response);

								}

							} else {
								jsonReturn.setState(false);
								jsonReturn.setMsg("登录失败！！！");
							}
							// VoiceBroadcast.say("welcome to"+
							// user.getUserName()+"来此",100,4);

							// request.getRequestDispatcher("/jsp/Main.jsp").forward(request,
							// response);
							// response.sendRedirect("jsp/Main.jsp");
						} else {
							jsonReturn.setState(false);
							jsonReturn.setMsg("已经登录，不能再次登录！！！");
						}
					} else {
						jsonReturn.setState(false);
						jsonReturn.setMsg("密码或者用户名称错误");

					}
				} else {
					jsonReturn.setState(false);
					jsonReturn.setMsg("验证码不正确");

				}

			} catch (Exception e) {
				e.printStackTrace();
				jsonReturn.setState(false);
				jsonReturn.setMsg("参数不正确");
			}
		} else {
			jsonReturn.setState(false);
			jsonReturn.setMsg("您已经在此浏览器登录了一个用户，不可以再次其他用户登录！！！，您可以进行清除痕迹！！");
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);

	}

	/**
	 * 用户下线
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/outline")
	protected String outline(HttpSession session, String UserID)
			throws ServletException, IOException {
		if (Tools.isNotNull(UserID)) {
			User user = userService.selectByPrimaryKey(Integer.valueOf(UserID));
			if (user != null) {
				UserChat.user.remove(user.getUsername());
				UserChat.userPhoto.remove(user.getUsername());
				user.setOnlinetime(null);
				userService.updateByPrimaryKey(user);
				ChangeUtil.destroySession(session, "USERINFO");

			}

		}

		return "redirect:/LoginController/login.do";
	}

	/**
	 * 发送手机验证码
	 * 
	 * 
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/faSongYanZhengMa")
	protected void faSongYanZhengMa(String ShouJiNumber, HttpSession session,
			PrintWriter pw, Map map) {
		JsonReturn jsonReturn = new JsonReturn();

		if (Tools.isNotNull(ShouJiNumber)) {
			map.put("phonenumber", ShouJiNumber);
			List<User> list = userService.findAll(map);
			if (list.size() > 0) {

				String ShouJiYanZhengMa = SendMessage.smsg(ShouJiNumber);
				if (Tools.isNotNull(ShouJiYanZhengMa)) {

					ChangeUtil.sessionpotting("PHCODE", ShouJiYanZhengMa, true,
							2 * 60, session);
					jsonReturn.setMsg("发送成功！！");
					jsonReturn.setState(true);

				} else {
					jsonReturn.setMsg("发送失败！！");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("没有此用户！！");
				jsonReturn.setState(false);
			}

		} else {
			jsonReturn.setMsg("请输入您的手机号码！！");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	@RequestMapping("/cleanOut")
	public void cleanOut(HttpSession session, PrintWriter pw) {
		JsonReturn jsonReturn = new JsonReturn();
		ChangeUtil.destroySession(session, "USERINFO");
		jsonReturn.setState(true);
		jsonReturn.setMsg("清除成功！！可以登录了！！");
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 修改密码
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/updateLoginPassword")
	protected void updateLoginPassword(HttpSession session,
			String ShouJiNumber, String PhoneCode, String NewPassword,
			String ConfirmNewPassword, PrintWriter pw, Map map) {
		JsonReturn jsonReturn = new JsonReturn();

		if (Tools.isNotNull(ShouJiNumber) && Tools.isNotNull(PhoneCode)
				&& Tools.isNotNull(NewPassword)
				&& Tools.isNotNull(ConfirmNewPassword)) {
			map.put("phonenumber", ShouJiNumber);
			List<User> list = userService.findAll(map);
			if (list.size() > 0 && list.size() == 1) {
				if (NewPassword.equals(ConfirmNewPassword)) {
					try {

						String ShouJiYanZhengMa = (String) ChangeUtil
								.sessionpotting("PHCODE", null, false, 0,
										session);

						if (PhoneCode.equals(ShouJiYanZhengMa)
								&& Tools.isNotNull(ShouJiYanZhengMa)) {

							User user = list.get(0);
							user.setLoginpassword(MD5Util.getMD5(NewPassword));
							int bool = userService.updateByPrimaryKey(user);
							if (bool > 0) {
								jsonReturn.setMsg("修改成功！！");
								jsonReturn.setState(true);
							} else {
								jsonReturn.setMsg("修改失败！！");
								jsonReturn.setState(false);
							}
						} else {
							jsonReturn.setMsg("验证码不对！！");
							jsonReturn.setState(false);
						}
					} catch (Exception e) {
						jsonReturn.setMsg("验证码已过期，请重新接收！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("两次密码不一样！！");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("没有此用户！！");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("请填写完整信息！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 清除登录的用户
	 * 
	 * @param pw
	 * @param session
	 */
	@RequestMapping("/cleanLogin")
	public void cleanLogin(PrintWriter pw, HttpSession session) {
		JsonReturn jsonReturn = new JsonReturn();
		User user = (User) session.getAttribute("USERINFO");
		if (user != null) {

			Calendar beforeTime = Calendar.getInstance();
			beforeTime.add(Calendar.MINUTE, -3);// 5分钟之前的时间

			user.setOnlinetime(beforeTime.getTime());
			userService.updateByPrimaryKey(user);

			ChangeUtil.destroySession(session, "USERINFO");
			jsonReturn.setState(true);
			jsonReturn.setMsg("清除成功！！可以登录了！！");
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 检查手机号码
	 * 
	 * @param pw
	 * @param phone
	 * @param code
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/checkPhoneNumber")
	public void checkPhoneNumber(PrintWriter pw, String phone, String code,
			HttpSession session, Map map) {
		JsonReturn jsonReturn = new JsonReturn();
		if (Tools.isNotNull(phone) && Tools.isNotNull(code)) {
			map.put("phonenumber", phone);
			List<User> list = userService.findAll(map);
			if (list.size() > 0) {

				if (code.equalsIgnoreCase((String) ChangeUtil.sessionpotting(
						"identity", null, false, -1, session))) {

					jsonReturn.setState(true);
				} else {
					jsonReturn.setMsg("验证码错误！！");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("此手机号码没有注册！！");
				jsonReturn.setState(false);
			}

		} else {
			jsonReturn.setMsg("验证码和手机号码不能为空!!");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 修改密码
	 * 
	 * @param pw
	 * @param password
	 * @param confirmPassword
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/updatePassword")
	public void updatePassword(PrintWriter pw, String password,
			String confirmPassword, String phoneNumber, Map map) {

		JsonReturn jsonReturn = new JsonReturn();
		if (Tools.isNotNull(confirmPassword) && Tools.isNotNull(password)) {
			if (Tools.isNotNull(phoneNumber)) {

				if (confirmPassword.equals(password)) {
					map.put("phonenumber", phoneNumber);
					List<User> list = userService.findAll(map);
					if (list.size() > 0 && list.size() == 1) {

						User user = list.get(0);
						user.setLoginpassword(MD5Util.getMD5(password));
						int r = userService.updateByPrimaryKey(user);
						if (r > 0) {
							jsonReturn.setMsg("修改成功！！");
							jsonReturn.setState(true);
						} else {
							jsonReturn.setMsg("修改失败！！");
							jsonReturn.setState(false);
						}
					} else {
						jsonReturn.setMsg("手机号码重复了，请联系管理员！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("密码不一致！！");
					jsonReturn.setState(false);
				}
			} else {
				jsonReturn.setMsg("请刷洗新界面！！");
				jsonReturn.setState(false);
			}

		} else {
			jsonReturn.setMsg("密码不能为空！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 查找图片
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/getPicture")
	protected void getPicture(HttpServletRequest request,
			HttpServletResponse response, String fileName) throws IOException {

		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp";
		try {

			// 构建上传目录的路径
			// String uploadPath = "D:\\JavaTest\\LogisticsSystem\\Temp";
			if (Tools.isNotNull(fileName)) {
				File file = new File(uploadPath + File.separator + fileName);
				if (file.exists() && file.isFile()) {
					FileInputStream in = new FileInputStream(file);
					ServletOutputStream out = response.getOutputStream();

					byte[] b = new byte[1024];
					int count = 0;
					while (-1 != (count = in.read(b, 0, b.length))) {
						out.write(b, 0, count);
					}
					response.setContentType("image/png");// 设置返回的文件类型
					out.flush();
					out.close();
					in.close();
				}

			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
