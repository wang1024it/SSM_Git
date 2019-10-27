package com.logistics.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bsh.ParseException;

import com.logistics.po.User;
import com.logistics.service.IOrderformService;
import com.logistics.util.ChangeUtil;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.ExportImportUtil;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.RMessage;
import com.logistics.util.Tools;
import com.logistics.vo.OrderformVo;

@Controller
@RequestMapping("/DataStatisticsController")
public class DataStatisticsController {
	@Autowired
	IOrderformService iOrderformService;
	User user = null;

	@RequestMapping("/dataStatistics")
	public ModelAndView dataStatistics(HttpSession session) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("DataStatistics");

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	/**
	 * 获取数据
	 * 
	 * @param pageSize
	 * @param curPage
	 * @param audit
	 * @param problem
	 * @param finish
	 * @param vague
	 * @param startTime
	 * @param endTime
	 * @param pw
	 * @param map
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	@ResponseBody
	public DatatablesViewPage<OrderformVo> getList(Integer length,
			Integer start, String startTime, String endTime,
			@SuppressWarnings("rawtypes") Map map) {
		DatatablesViewPage<OrderformVo> view = new DatatablesViewPage<OrderformVo>();
		if (length >= 0 && start >= 0) {

			if (Tools.isNotNull(startTime)) {
				map.put("startTime", startTime);
			}
			if (Tools.isNotNull(endTime)) {
				map.put("endTime", endTime);
			}

			map.put("startIndex", start);
			map.put("pageSize", length);

			List<OrderformVo> list = iOrderformService.findPageOrder(map);
			int totalRows = iOrderformService.getTotalRowOrder(map);
			view.setiTotalDisplayRecords(totalRows);
			view.setiTotalRecords(totalRows);

			view.setAaData(list);
			return view;
		}
		return null;

	}

	/**
	 * 查询订单
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/selectOrderForm")
	protected void selectOrderForm(String startTime, String endTime,
			PrintWriter pw, Map map) {

		StringBuffer stringBuffer = new StringBuffer();

		map.put("startTime", startTime);
		map.put("endTime", endTime);

		List<OrderformVo> list = iOrderformService.findOrderBySql(map);
		List<OrderformVo> timelist = iOrderformService.findTimeAndCount(map);

		String Json = null;
		int Count = 0;
		int finish = 0;
		int Notfinish = 0;
		int YiJiaoKuan = 0;
		int WeiJiaoKuan = 0;
		int Cancel = 0;
		if (list.size() > 0) {
			Count = list.get(0).getTotal();
			finish = list.get(0).getFinish();
			Notfinish = list.get(0).getNofinish();
			YiJiaoKuan = list.get(0).getAlreadyPay();
			WeiJiaoKuan = list.get(0).getUnpaid();
			Cancel = list.get(0).getCancel();

		}
		if (timelist.size() > 0) {
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			for (int i = 0; i < timelist.size(); i++) {

				stringBuffer.append(fmt.format(timelist.get(i)
						.getShangChuangTime())
						+ "/"
						+ (timelist.get(i).getDailyQuantity()) + "`");

			}
		}

		Json = "{" + ChangeUtil.changeJson("Count", Count) + ","
				+ ChangeUtil.changeJson("finish", finish) + ","
				+ ChangeUtil.changeJson("Notfinish", Notfinish) + ","
				+ ChangeUtil.changeJson("YiJiaoKuan", YiJiaoKuan) + ","
				+ ChangeUtil.changeJson("WeiJiaoKuan", WeiJiaoKuan) + ","
				+ ChangeUtil.changeJson("Cancel", Cancel) + ","
				+ ChangeUtil.changeJson("ZheXian", stringBuffer) + "}";

		RMessage.returnMessage(pw, null, null, Json);

	}

	/**
	 * 导出Excel
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/export")
	protected void export(String startTime, String endTime, Map map,
			HttpServletResponse response, int pageSize, int startIndex)
			throws IOException {
		JsonReturn jsonReturn = new JsonReturn();
		try {

			int[] columnWidth = { 10, 30, 40, 50, 30, 30, 40, 30, 20, 20, 20,
					20, 20, 20, 50, 40 };
			String[] columnName = { "序号", "订单编号", "寄货人（公司）名称", "寄货人（公司）地址",
					"寄货人（公司）电话号码", "收货人（公司）名称", "收货人（公司）地址", "收货人（公司）电话号码",
					"运输方式", "付款方式", "交钱否", "审核时间", "是否审核", "状态", "订单问题", "备注" };

			String[][] dataList = null;

			map.put("startTime", startTime);
			map.put("endTime", endTime);
			map.put("pageSize", pageSize);
			map.put("startIndex", startIndex);

			List<OrderformVo> list = iOrderformService.findPageOrder(map);
			if (list.size() > 0) {

				dataList = new String[list.size()][16];

				for (int i = 0; i < list.size(); i++) {

					if (list.get(i).isReceivables() == true) {
						list.get(i).setPaymoney("已交");
					} else {
						list.get(i).setPaymoney("未交");
					}

					if (list.get(i).getIsauditing() == true) {
						list.get(i).setExamine("已审核");
					} else {
						list.get(i).setExamine("未审核");
					}

					for (int j = 0; j < 16; j++) {
						switch (j) {
						case 0:
							dataList[i][j] = String.valueOf((i + 1));
							break;
						case 1:
							dataList[i][j] = list.get(i).getOrdernumber();
							break;
						case 2:
							dataList[i][j] = list.get(i).getSendname();
							break;
						case 3:
							dataList[i][j] = list.get(i).getSendadress();
							break;
						case 4:
							dataList[i][j] = list.get(i).getSendphonenumber();
							break;
						case 5:
							dataList[i][j] = list.get(i).getTakename();
							break;
						case 6:
							dataList[i][j] = list.get(i).getTakeadress();
							break;
						case 7:
							dataList[i][j] = list.get(i).getTakephonenumber();
							break;
						case 8:
							dataList[i][j] = list.get(i).getTransportmodename();
							break;
						case 9:
							dataList[i][j] = list.get(i).getPaymentname();
							break;

						case 10:
							dataList[i][j] = list.get(i).getPaymoney();
							break;
						case 11:

							if (list.get(i).getAudittime() != null) {
								dataList[i][j] = GetTimeUtil
										.changeTimeToStr(list.get(i)
												.getAudittime().getTime());
							} else {
								dataList[i][j] = null;
							}

							break;
						case 12:
							dataList[i][j] = list.get(i).getExamine();
							break;
						case 13:
							dataList[i][j] = list.get(i).getStatusname();
							break;
						case 14:
							dataList[i][j] = list.get(i).getReason();
							break;
						case 15:
							dataList[i][j] = list.get(i).getRemark();
							break;

						}
					}
				}
				ExportImportUtil.Export("订单详情", 16, columnWidth, columnName,
						dataList, response);

			} else {

				jsonReturn.setMsg("没有数据，不用导出！！");
				jsonReturn.setState(false);

			}

		} catch (Exception e) {
			jsonReturn.setMsg("出错啦！！");
			jsonReturn.setState(false);
			e.printStackTrace();

			PrintWriter writer = response.getWriter();
			writer.write(JSONObject.fromObject(jsonReturn).toString());
			writer.close();
		}

	}
}
