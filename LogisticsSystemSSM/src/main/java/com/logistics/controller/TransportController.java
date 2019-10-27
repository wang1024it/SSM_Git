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
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Location;
import com.logistics.po.Logisticstracking;
import com.logistics.po.Orderform;
import com.logistics.po.User;
import com.logistics.service.ILocationService;
import com.logistics.service.ILogisticsTrackingService;
import com.logistics.service.IOrderformService;
import com.logistics.service.IProcuratoryService;
import com.logistics.util.Bsgrid;
import com.logistics.util.ChangeUtil;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.JudgingStringSimilarityUtil;
import com.logistics.util.RMessage;
import com.logistics.util.Tools;
import com.logistics.vo.ProcuratoryVo;

@Controller
@RequestMapping("/TransportController")
public class TransportController {
	@Autowired
	IProcuratoryService iProcuratoryService;
	@Autowired
	IOrderformService iOrderformService;
	@Autowired
	ILogisticsTrackingService iLogisticsTrackingService;
	@Autowired
	ILocationService iLocationService;

	User user;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/home")
	public ModelAndView home(HttpSession session, Map map) {
		map.clear();
		ModelAndView mv = null;
		user = (User) ChangeUtil.sessionpotting("USERINFO", null, false, -1,
				session);
		if (user != null) {
			mv = new ModelAndView("Home");

			map.put("startIndex", 0);
			map.put("pageSize", 10);
			map.put("userid", user.getUserid());
			map.put("iscancel", true);
			map.put("isfinish", false);

			List<Orderform> orderlist = iOrderformService
					.findOrderformBySQL(map);
			if (orderlist.size() == 0) {
				map.put("statusid", 4);

				List<ProcuratoryVo> list = iProcuratoryService.findPage(map);

				if (list.size() == 1) {

					Orderform orderForm = iOrderformService
							.selectByPrimaryKey(Integer.valueOf(list.get(0)
									.getOrderformid()));
					if (orderForm != null && orderForm.getIsauditing() == true) {

						mv.addObject("TakeAdress", orderForm.getTakeadress());

					}

				} else {
					map.put("statusid", 5);
					List<ProcuratoryVo> strlist = iProcuratoryService
							.findPage(map);
					if (strlist.size() == 1) {

						Orderform orderForm = iOrderformService
								.selectByPrimaryKey(Integer.valueOf(strlist
										.get(0).getOrderformid()));
						if (orderForm != null) {
							mv.addObject("TakeAdress",
									orderForm.getTakeadress());
						}
					}
				}
			} else {

				mv.addObject("Return", orderlist.get(0).getSendadress());
			}

			mv.addObject("user", user);
		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;
	}

	/**
	 * 查询委托的订单
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/getList")
	protected void getList(PrintWriter pw, int pageSize, int curPage, Map map) {

		if (user != null) {

			Bsgrid<ProcuratoryVo> bs = new Bsgrid<ProcuratoryVo>();
			if (pageSize >= 0 && curPage >= 0) {

				int startIndex = (curPage - 1) * pageSize;
				map.put("userid", user.getUserid());
				map.put("statusid", 13);
				map.put("pageSize", pageSize);
				map.put("startIndex", startIndex);

				List<ProcuratoryVo> list = iProcuratoryService.findPage(map);

				int totalRows = iProcuratoryService.getTotalRow(map);

				bs.setCurPage(curPage);
				bs.setData(list);
				bs.setSuccess(true);
				bs.setTotalRows(totalRows);
			} else {
				bs.setSuccess(false);
			}

			RMessage.returnMessage(pw, bs, null, null);
		}
	}

	/**
	 * 接受或者拒绝
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/update")
	protected void update(PrintWriter pw, String status, String orderFormID,
			Map map) {
		JsonReturn jsReturn = new JsonReturn();
		map.put("isfinish", 0);
		map.put("statusid", 9);
		map.put("userid", user.getUserid());
		map.put("pageSize", 10);
		map.put("startIndex", 0);

		List<ProcuratoryVo> list = iProcuratoryService.findPage(map);
		String MC = "";

		if (Tools.isNotNull(status) && Tools.isNotNull(orderFormID)) {
			Orderform orderForm = iOrderformService.selectByPrimaryKey(Integer
					.valueOf(orderFormID));

			if (orderForm != null) {

				if ("accept".equals(status)) {
					orderForm.setStatusid(9);
					MC = "接受";
					orderForm.setSingletime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));

				} else {
					orderForm.setStatusid(10);
					MC = "拒绝";
					iProcuratoryService.deleteByOrderformID(orderForm
							.getOrderformid());
				}
				if (list.size() == 0 || MC == "拒绝") {
					orderForm.setSingletime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));

					int bol = iOrderformService.updateByPrimaryKey(orderForm);
					if (bol > 0) {
						jsReturn.setMsg(MC + "成功！！，请到订单管理进行查看！！");
						jsReturn.setState(true);
					} else {
						jsReturn.setMsg(MC + "失败！！");
						jsReturn.setState(false);
					}
				} else {
					jsReturn.setMsg("您已经接有单了，完成了才能接其他的订单！！");
					jsReturn.setState(false);
				}
			} else {
				jsReturn.setMsg("没有此条数据");
				jsReturn.setState(false);
			}

		} else {
			jsReturn.setMsg("请选择一条数据将");
			jsReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsReturn, null, null);
	}

	/**
	 * 定位
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/dingWei")
	protected void dingWei(Map map, String DiZhi, PrintWriter pw) {
		try {

			Logisticstracking logisticsTracking = null;
			Location location = null;

			if (user != null) {

				if (user.getInstitutionalorganizationid() == 3
						&& Tools.isNotNull(DiZhi)
						&& (!"网络错误，识别不了地址！！".equals(DiZhi))) {
					map.put("userid", user.getUserid());
					map.put("statusid", 4);

					List<Orderform> list = iOrderformService
							.findOrderformBySQL(map);
					if (list.size() == 1) {
						if (!JudgingStringSimilarityUtil.udgingStringSimilar(
								DiZhi, list.get(0).getTakeadress())) {

							map.put("orderformid", list.get(0).getOrderformid());
							map.put("specificinformation", "司机已经到达：" + DiZhi
									+ ",请耐心等待！！");
							List<Logisticstracking> strlist = iLogisticsTrackingService
									.findLogBySQL(map);

							if (strlist.size() == 0) {
								logisticsTracking = new Logisticstracking();
								logisticsTracking.setOrderformid(list.get(0)
										.getOrderformid());
								logisticsTracking
										.setSpecificinformation("司机已经到达："
												+ DiZhi + ",请耐心等待！！");
								logisticsTracking
										.setUploadlogisticstime(GetTimeUtil
												.changeStrToTime(GetTimeUtil
														.getNowTime()));
								iLogisticsTrackingService
										.insert(logisticsTracking);

							}
						} else {

							logisticsTracking = new Logisticstracking();
							logisticsTracking.setOrderformid(list.get(0)
									.getOrderformid());
							logisticsTracking
									.setSpecificinformation("司机已经到达目的地："
											+ DiZhi + ",司机电话："
											+ user.getPhonenumber());
							logisticsTracking
									.setUploadlogisticstime(GetTimeUtil
											.changeStrToTime(GetTimeUtil
													.getNowTime()));
							iLogisticsTrackingService.insert(logisticsTracking);
						}

					}
				}
				map.clear();
				map.put("userid", user.getUserid());
				location = iLocationService.findLocationSQL(map);
				if (location != null) {
					location.setCarlocation(DiZhi);
					location.setUploadtime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));
					iLocationService.updateByPrimaryKey(location);
				} else {
					location = new Location();
					location.setCarlocation(DiZhi);
					location.setUserid(user.getUserid());
					location.setUploadtime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));
					iLocationService.insert(location);
				}

			}
		} catch (Exception e) {

		}
	}
}
