package com.logistics.controller;

import java.io.IOException;
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

import com.logistics.po.User;
import com.logistics.service.IFundrecordService;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.Tools;
import com.logistics.vo.FundRecordVo;

@Controller
@RequestMapping("/FundRecordController")
public class FundRecordController {
	@Autowired
	IFundrecordService iFundrecordService;

	User user = null;

	@RequestMapping("/fundRecord")
	public ModelAndView fundRecord(HttpSession session) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("FundRecord");
			mv.addObject("user", user);

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	/**
	 * 获取数据
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	@ResponseBody
	protected DatatablesViewPage<FundRecordVo> getList(String Auditing,
			@SuppressWarnings("rawtypes") Map map, Integer start, Integer length) {
		if (Tools.isNotNull(Auditing)) {

			map.put("IsAudit", Auditing);

		}
		map.put("startIndex", start);
		map.put("pageSize", length);
		map.put("userid", user.getUserid());
		DatatablesViewPage<FundRecordVo> view = new DatatablesViewPage<FundRecordVo>();
		List<FundRecordVo> list = iFundrecordService.findPage(map);
		int totalRows = iFundrecordService.getTotalRows(map);
		view.setiTotalDisplayRecords(totalRows);
		view.setiTotalRecords(totalRows);

		view.setAaData(list);
		return view;

	}
}
