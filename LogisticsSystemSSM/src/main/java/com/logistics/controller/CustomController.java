package com.logistics.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Custom;
import com.logistics.po.Customertype;
import com.logistics.po.User;
import com.logistics.service.ICustomService;
import com.logistics.service.ICustomertypeService;
import com.logistics.util.ChangeUtil;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.MD5Util;
import com.logistics.util.RMessage;
import com.logistics.util.Tools;
import com.logistics.vo.CustomVo;

@Controller
@RequestMapping("/CustomController")
public class CustomController {

	@Autowired
	ICustomService iCustomService;
	@Autowired
	ICustomertypeService icustomertypeService;
	User user = null;

	@RequestMapping("/customerManagement")
	public ModelAndView customerManagement(HttpSession session) {
		ModelAndView mv = null;

		user = (User) ChangeUtil.sessionpotting("USERINFO", null, false, -1,
				session);
		if (user != null) {
			List<Customertype> list = icustomertypeService.findAll();
			mv = new ModelAndView("CustomerManagement");

			mv.addObject("listcustom", list);
		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	/**
	 * 查询订单
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	@ResponseBody
	protected DatatablesViewPage<CustomVo> getList(Integer length,
			Integer start, @SuppressWarnings("rawtypes") Map map,
			String condition, HttpSession session) {
		map.clear();
		user = (User) session.getAttribute("USERINFO");

		if (user != null) {

			if (Tools.isNotNull(condition)) {

				map.put("customname", condition);
			}
			DatatablesViewPage<CustomVo> view = new DatatablesViewPage<CustomVo>();
			if (length >= 0 && start >= 0) {

				map.put("startIndex", start);
				map.put("pageSize", length);
				List<CustomVo> list = iCustomService.findPage(map);

				int totalRows = iCustomService.getTotalRow(map);

				view.setiTotalDisplayRecords(totalRows);
				view.setiTotalRecords(totalRows);

				view.setAaData(list);
				return view;
			} else {
				return null;
			}

		}
		return null;
	}

	/**
	 * 客户注册信息
	 * 
	 * @param picture
	 * @param pw
	 * @param request
	 * @param custom
	 * @param map
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/insertCustom")
	public void insertCustom(PrintWriter pw, HttpServletRequest request,
			Custom custom, Map map, String confimcustompassword) {
		JsonReturn jsonReturn = new JsonReturn();

		if (custom != null) {

			try {
				map.put("CustomPhoneNumber", custom.getCustomphonenumber());
				map.put("unequal", custom.getCustomid());
				List<Custom> list1 = iCustomService.findCustomBySQL(map);

				if (list1.size() == 0) {
					if (!Tools.isNotNull(custom.getCustompassword())) {
						custom.setCustompassword("12345");
					}
					if (!Tools.isNotNull(confimcustompassword)) {
						confimcustompassword = "12345";
					}
					if (custom.getCustompassword().equals(confimcustompassword)) {
						custom.setCustompassword(MD5Util
								.getMD5(confimcustompassword));

						custom.setRegistrationdate(GetTimeUtil
								.changeStrToTime(GetTimeUtil.getNowTime()));

						if (Tools.isNotNull(custom.getCustomname())
								&& Tools.isNotNull(custom
										.getCustomphonenumber())) {
							if (custom.getCustomertypeid() == 1) {
								if (!Tools.isNotNull(custom.getSex())
										|| Tools.isNotNull(custom
												.getCustomidnumber())) {
									jsonReturn.setMsg("请填写完整数据！！");
									jsonReturn.setState(false);

									RMessage.returnMessage(pw, jsonReturn,
											null, null);
									return;
								}

								map.clear();
								map.put("CustomIDNumber",
										custom.getCustomidnumber());
								map.put("unequal", custom.getCustomid());
								List<Custom> list = iCustomService
										.findCustomBySQL(map);
								if (list.size() > 0) {
									jsonReturn.setMsg("此身份证已注册！！");
									jsonReturn.setState(false);
								}
								RMessage.returnMessage(pw, jsonReturn, null,
										null);
								return;
							} else {
								if (!Tools.isNotNull(custom
										.getTelephonenumber())
										|| !Tools.isNotNull(custom
												.getCompanyadress())) {
									jsonReturn.setMsg("请填写完整数据！！");
									jsonReturn.setState(false);

									RMessage.returnMessage(pw, jsonReturn,
											null, null);
									return;
								}

							}

							int r = iCustomService.insert(custom);
							if (r > 0) {
								jsonReturn.setMsg("注冊成功！！");
								jsonReturn.setState(true);

							} else {
								jsonReturn.setMsg("注冊失败！！");
								jsonReturn.setState(false);

							}

						} else {
							jsonReturn.setMsg("请填写完整数据！！");
							jsonReturn.setState(false);

						}

					} else {
						jsonReturn.setMsg("两次密码不对应！！");
						jsonReturn.setState(false);

					}
				} else {
					jsonReturn.setMsg("此手机号码已注册！！");
					jsonReturn.setState(false);

				}

			} catch (Exception e) {
				e.printStackTrace();
				jsonReturn.setMsg("出错啦！！");
				jsonReturn.setState(false);

			}
		} else {
			jsonReturn.setMsg("数据丢失，请刷新界面再进行注册！！");
			jsonReturn.setState(false);

		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}
}
