package com.logistics.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Information;
import com.logistics.po.User;
import com.logistics.service.IInformationService;

@Controller
@RequestMapping("/AboutUsController")
public class AboutUsController {
	@Autowired
	IInformationService iInformationService;
	User user = null;

	@RequestMapping("/aboutUs")
	public ModelAndView aboutUs(HttpSession session) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("AboutUs");
			Information information = iInformationService.findInformation();
			mv.addObject("information", information);
		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}
}
