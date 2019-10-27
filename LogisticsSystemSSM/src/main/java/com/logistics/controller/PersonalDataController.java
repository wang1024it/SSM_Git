package com.logistics.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Bankcardinformation;
import com.logistics.po.Fundrecord;
import com.logistics.po.User;
import com.logistics.service.IBankcardinformationService;
import com.logistics.service.ICarService;
import com.logistics.service.IFundrecordService;
import com.logistics.service.IUserService;
import com.logistics.util.ChangeUtil;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.MD5Util;
import com.logistics.util.RMessage;
import com.logistics.util.ReadFileUtil;
import com.logistics.util.Tools;
import com.logistics.vo.CarVo;
import com.logistics.vo.UserVo;

@Controller
@RequestMapping("/PersonalDataController")
public class PersonalDataController {
	@Autowired
	IUserService iUserService;
	@Autowired
	IBankcardinformationService iBankcardinformationService;
	@Autowired
	IFundrecordService iFundrecordService;
	@Autowired
	ICarService iCarService;
	User user = null;

	@SuppressWarnings("unchecked")
	@RequestMapping("/personal")
	public ModelAndView personal(HttpSession session,
			@SuppressWarnings("rawtypes") Map map) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("PersonalData");
			map.put("userid", user.getUserid());
			List<UserVo> list = iUserService.findUserBySQL(map);
			String Time = "";
			if (list.get(0).getEntrytime() != null) {
				Time = GetTimeUtil.changeTimeToStr(list.get(0).getEntrytime()
						.getTime());
			}

			List<Bankcardinformation> banklist = iBankcardinformationService
					.findAllBankCard(user.getUserid());
			CarVo car = iCarService.findByUserID(user.getUserid());

			mv.addObject("car", car);
			mv.addObject("Time", Time);
			mv.addObject("banklist", banklist);

			mv.addObject("user", list.get(0));

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	@RequestMapping("/account")
	public ModelAndView account(HttpSession session,
			@SuppressWarnings("rawtypes") Map map) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("AccountSecurity");

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	@RequestMapping("/payment")
	public ModelAndView payment(HttpSession session,
			@SuppressWarnings("rawtypes") Map map) {
		ModelAndView mv = null;

		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("PaymentSecurity");

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	@RequestMapping("/carInformation")
	public ModelAndView carInformation(HttpSession session,
			@SuppressWarnings("rawtypes") Map map) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("CarInformation");

			CarVo car = iCarService.findByUserID(user.getUserid());

			mv.addObject("car", car);
			mv.addObject("user", user);

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	/**
	 * 查找图片
	 * 
	 * @param file
	 * @param request
	 * @throws IOException
	 */
	@RequestMapping("/getUserPicture")
	protected void getUserPicture(String strfile, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp";

		// 构建上传目录的路径
		// String uploadPath = "D:\\JavaTest\\LogisticsSystem\\Temp";
		if (Tools.isNotNull(strfile)) {
			File file = new File(uploadPath + File.separator + strfile);
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

	}

	/**
	 * 绑定银行卡
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/insertBankCard")
	protected void insertBankCard(String ShouJiNumber, String BankCardNumber,
			String YanZhengMa, HttpSession session, PrintWriter pw) {
		JsonReturn jsonReturn = new JsonReturn();

		if (Tools.isNotNull(ShouJiNumber) && Tools.isNotNull(BankCardNumber)
				&& Tools.isNotNull(YanZhengMa)) {
			int ShuJu = 0;
			List<Bankcardinformation> list = iBankcardinformationService
					.findAllBankCard(user.getUserid());
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getBankcardnumber().equals(BankCardNumber)) {
					ShuJu = 1;
				}
				if (i > 5) {
					ShuJu = 2;
				}
			}
			if (ShuJu == 0) {
				String identifyingCode = (String) ChangeUtil.sessionpotting(
						"PHCODE", null, false, 0, session);

				if (YanZhengMa.equalsIgnoreCase(identifyingCode)) {

					Bankcardinformation bankCardInformation = new Bankcardinformation();
					bankCardInformation.setBankcardnumber(BankCardNumber);
					bankCardInformation
							.setBankcardreservedphonenumber(ShouJiNumber);
					bankCardInformation.setUserid(user.getUserid());

					int bol = iBankcardinformationService
							.insert(bankCardInformation);
					if (bol > 0) {
						jsonReturn.setMsg("绑定成功");
						jsonReturn.setState(true);
					} else {
						jsonReturn.setMsg("绑定失败");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("验证码错误！！");
					jsonReturn.setState(false);
				}
			} else {
				if (ShuJu == 1) {
					jsonReturn.setMsg("已经绑定此银行卡，不用再次绑定");
					jsonReturn.setState(false);
				} else {
					jsonReturn.setMsg("您已经绑定很多银行卡了，不能再绑定");
					jsonReturn.setState(false);
				}
			}
		} else {
			jsonReturn.setMsg("填写完整信息");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 解除绑定银行卡
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/deleteBankCard")
	protected void deleteBankCard(int YinHangKaID, PrintWriter pw) {
		JsonReturn jsReturn = new JsonReturn();

		if (YinHangKaID > 0) {

			int bol = iBankcardinformationService
					.deleteByPrimaryKey(YinHangKaID);
			if (bol > 0) {
				jsReturn.setMsg("解除成功");
				jsReturn.setState(true);
			} else {
				jsReturn.setMsg("解除失败");
				jsReturn.setState(false);
			}
		} else {
			jsReturn.setMsg("解除失败");
			jsReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsReturn, null, null);
	}

	/**
	 * 申请金额
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/application")
	protected void application(float JinE, String PayPassword, PrintWriter pw) {
		JsonReturn jsReturn = new JsonReturn();
		Fundrecord fundRecord = new Fundrecord();

		if (JinE > 0 && Tools.isNotNull(PayPassword)) {

			List<Fundrecord> list = iFundrecordService.findAllByUserID(user
					.getUserid());
			int ShuJu = 0;
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getIsaudit() == false) {
						ShuJu = 1;
						break;
					}
				}
			}
			if (ShuJu == 0) {
				if (MD5Util.getMD5(PayPassword).equalsIgnoreCase(
						user.getPaymentpassword())) {

					fundRecord.setApplicationtime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));
					fundRecord.setExtractmoney(Float.valueOf(JinE));
					fundRecord.setUserid(user.getUserid());
					fundRecord.setIsaudit(false);
					fundRecord.setOperationlog("用户:" + user.getUsername()
							+ "  申请提现，金额为" + JinE + "元");
					int bol = iFundrecordService.insert(fundRecord);
					if (bol > 0) {
						jsReturn.setMsg("提交成功，等待审核");
						jsReturn.setState(true);
					} else {
						jsReturn.setMsg("提交失败");
						jsReturn.setState(false);
					}
				} else {
					jsReturn.setMsg("密码错误");
					jsReturn.setState(false);
				}
			} else {
				jsReturn.setMsg("您已经申请了，收到回复后，才可以再次申请");
				jsReturn.setState(false);

			}

		} else {
			jsReturn.setMsg("填写完整信息");
			jsReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsReturn, null, null);
	}

	/**
	 * 修改支付密码
	 * 
	 * @param pw
	 * @param originalpassword
	 * @param newpassword
	 * @param confirmpassword
	 * @param PhoneNumber
	 * @param Code
	 * @param session
	 */
	@RequestMapping("/updatePay")
	protected void updatePay(PrintWriter pw, String originalpassword,
			String newpassword, String confirmpassword, String PhoneNumber,
			String Code, HttpSession session) {
		JsonReturn jsonReturn = new JsonReturn();

		if (!Tools.isNotNull(PhoneNumber)) {
			if (Tools.isNotNull(originalpassword)
					&& Tools.isNotNull(newpassword)
					&& Tools.isNotNull(confirmpassword)) {
				if (MD5Util.getMD5(originalpassword).equals(
						user.getPaymentpassword())) {
					if (confirmpassword.equals(newpassword)) {
						User newuser = iUserService.selectByPrimaryKey(user
								.getUserid());
						newuser.setPaymentpassword(MD5Util.getMD5(newpassword));
						Calendar beforeTime = Calendar.getInstance();
						beforeTime.add(Calendar.MINUTE, -3);// 5分钟之前的时间
						newuser.setOnlinetime(beforeTime.getTime());
						int bol = iUserService.updateByPrimaryKey(newuser);
						if (bol > 0) {

							jsonReturn.setMsg("修改成功,由于您已经修改支付密码，请重新登录！！");
							jsonReturn.setState(true);

							ChangeUtil.destroySession(session, "USERINFO");

						} else {
							jsonReturn.setMsg("修改失败");
							jsonReturn.setState(false);
						}

					} else {
						jsonReturn.setMsg("两次密码不一样");
						jsonReturn.setState(false);
					}

				} else {
					jsonReturn.setMsg("您的原密码错误");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("请输入您的密码");
				jsonReturn.setState(false);
			}
		} else {

			if (Tools.isNotNull(PhoneNumber) && Tools.isNotNull(Code)) {
				String identifyingCode = (String) ChangeUtil.sessionpotting(
						"PHCODE", null, false, 0, session);

				if (Code.equalsIgnoreCase(identifyingCode)) {

					if (confirmpassword.equals(newpassword)) {
						User newuser = iUserService.selectByPrimaryKey(user
								.getUserid());
						newuser.setPaymentpassword(MD5Util.getMD5(newpassword));
						int bol = iUserService.updateByPrimaryKey(newuser);
						if (bol > 0) {
							jsonReturn.setMsg("修改成功,由于您已经修改支付密码，请重新登录！！");
							jsonReturn.setState(true);
							ChangeUtil.destroySession(session, "USERINFO");
						} else {
							jsonReturn.setMsg("修改失败");
							jsonReturn.setState(false);
						}

					} else {
						jsonReturn.setMsg("两次密码不一样");
						jsonReturn.setState(false);
					}

				} else {
					jsonReturn.setMsg("验证码错误");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("请填写完整信息");
				jsonReturn.setState(false);
			}

		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 修改登录密码
	 * 
	 * @param pw
	 * @param originalpassword1
	 * @param newpassword1
	 * @param confirmpassword1
	 * @param PhoneNumber1
	 * @param Code1
	 * @param session
	 */
	@RequestMapping("/updatePassword")
	protected void updatePassword(PrintWriter pw, String originalpassword1,
			String newpassword1, String confirmpassword1, String PhoneNumber1,
			String Code1, HttpSession session) {

		JsonReturn jsonReturn = new JsonReturn();

		if (!Tools.isNotNull(PhoneNumber1)) {
			if (Tools.isNotNull(originalpassword1)
					&& Tools.isNotNull(newpassword1)
					&& Tools.isNotNull(confirmpassword1)) {

				if (MD5Util.getMD5(originalpassword1).equals(
						user.getLoginpassword())) {
					if (confirmpassword1.equals(newpassword1)) {
						User newuser = iUserService.selectByPrimaryKey(user
								.getUserid());
						newuser.setLoginpassword(MD5Util.getMD5(newpassword1));
						Calendar beforeTime = Calendar.getInstance();
						beforeTime.add(Calendar.MINUTE, -3);// 5分钟之前的时间
						newuser.setOnlinetime(beforeTime.getTime());
						int bol = iUserService.updateByPrimaryKey(newuser);
						if (bol > 0) {
							jsonReturn.setMsg("修改成功,由于您已经修改登录密码，请重新登录！！");
							jsonReturn.setState(true);

							ChangeUtil.destroySession(session, "USERINFO");
						} else {
							jsonReturn.setMsg("修改失败");
							jsonReturn.setState(false);
						}

					} else {
						jsonReturn.setMsg("两次密码不一样");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("您的原密码错误");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("请输入您的密码");
				jsonReturn.setState(false);
			}
		} else {

			if (Tools.isNotNull(PhoneNumber1) && Tools.isNotNull(Code1)) {
				String identifyingCode = (String) ChangeUtil.sessionpotting(
						"PHCODE", null, false, 0, session);

				if (Code1.equalsIgnoreCase(identifyingCode)) {

					if (confirmpassword1.equals(newpassword1)) {
						User newuser = iUserService.selectByPrimaryKey(user
								.getUserid());
						newuser.setLoginpassword(MD5Util.getMD5(newpassword1));
						int bol = iUserService.updateByPrimaryKey(newuser);
						if (bol > 0) {
							jsonReturn.setMsg("修改成功,由于您已经修改登录密码，请重新登录！！");
							jsonReturn.setState(true);
							ChangeUtil.destroySession(session, "USERINFO");
						} else {
							jsonReturn.setMsg("修改失败");
							jsonReturn.setState(false);
						}

					} else {
						jsonReturn.setMsg("两次密码不一样");
						jsonReturn.setState(false);
					}

				} else {
					jsonReturn.setMsg("验证码错误");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("请填写完整信息");
				jsonReturn.setState(false);
			}

		}

		RMessage.returnMessage(pw, jsonReturn, null, null);

	}

	/**
	 * 修改个人资料
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/updatePersonal")
	protected void updatePersonal(String NewPhoneNumber, String NewCode,
			String adress, HttpSession session, PrintWriter pw) {
		JsonReturn jsonReturn = new JsonReturn();

		if (Tools.isNotNull(NewPhoneNumber) && Tools.isNotNull(adress)) {
			User newUser = iUserService.selectByPrimaryKey(user.getUserid());
			if (NewPhoneNumber.equals(user.getPhonenumber())) {

			} else {
				String YanZhengMa = (String) ChangeUtil.sessionpotting(
						"PHCODE", null, false, 0, session);
				if (YanZhengMa.equals(NewCode)) {
					newUser.setPhonenumber(NewPhoneNumber);
				} else {
					jsonReturn.setMsg("验证码错误");
					jsonReturn.setState(false);
				}

			}

			if (newUser != null) {
				newUser.setAddress(adress);

				int bol = iUserService.updateByPrimaryKey(newUser);
				if (bol > 0) {
					jsonReturn.setMsg("修改成功");
					jsonReturn.setState(true);
				} else {
					jsonReturn.setMsg("修改失败");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("请重新登录");
				jsonReturn.setState(false);
			}

		} else {
			jsonReturn.setMsg("不能为空");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 上传个人照片
	 * 
	 * @param myFile
	 * @param pw
	 * @param request
	 */
	@RequestMapping("/uploadPersonalPicture")
	public void uploadPersonalPicture(
			HttpServletRequest request,
			@RequestParam(value = "picture", required = true) MultipartFile myFile,
			PrintWriter pw) {

		JsonReturn jsonReturn = new JsonReturn();
		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp";
		File uploadDir = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir.exists()) {
			uploadDir.mkdir();

		}
		try {
			String uploadFileName = ReadFileUtil.readWriteFile(
					myFile.getInputStream(), myFile.getOriginalFilename(),
					uploadPath);
			User newuser = iUserService.selectByPrimaryKey(this.user
					.getUserid());
			if (newuser.getPhoto() != null) {

				File oldFile = new File(uploadPath + "\\" + newuser.getPhoto());
				if (oldFile.exists() && oldFile.isFile()) {
					oldFile.delete();
				}
			}
			newuser.setPhoto(uploadFileName);

			int r = iUserService.updateByPrimaryKey(newuser);
			if (r > 0) {
				jsonReturn.setMsg("修改成功！！");
				jsonReturn.setState(true);
				ChangeUtil.destroySession(request.getSession(), "USERINFO");
				ChangeUtil.sessionpotting("USERINFO", newuser, true, -1,
						request.getSession());
			} else {
				jsonReturn.setMsg("修改失败！！");
				jsonReturn.setState(false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonReturn.setMsg("修改失败！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}
}
