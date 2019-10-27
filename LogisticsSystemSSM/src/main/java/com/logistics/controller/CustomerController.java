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

import com.logistics.po.User;
import com.logistics.service.ILocationService;
import com.logistics.util.Bsgrid;
import com.logistics.util.ChangeUtil;
import com.logistics.util.RMessage;
import com.logistics.vo.LocationVo;

@Controller
@RequestMapping("/CustomerController")
public class CustomerController {
	@Autowired
	ILocationService iLocationService;

	@RequestMapping("/homeService")
	public ModelAndView homeService(HttpSession session) {
		ModelAndView mv = null;

		User user = (User) ChangeUtil.sessionpotting("USERINFO", null, false,
				-1, session);
		if (user != null) {
			mv = new ModelAndView("HomeService");
			mv.addObject("user", user);
		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	/**
	 * 查询司机定位信息
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/getList")
	protected void getList(PrintWriter pw, Integer pageSize,
			Integer startIndex, Map map) {
		Bsgrid<LocationVo> bs = new Bsgrid<LocationVo>();
		if (pageSize > 0 && startIndex >= 0) {
			map.put("pageSize", pageSize);
			map.put("startIndex", startIndex);
			List<LocationVo> list = iLocationService.findPage(map);
			int total = iLocationService.getRowTotal(map);
			bs.setData(list);
			bs.setTotalRows(total);
		}
		RMessage.returnMessage(pw, bs, null, null);
	}
}
