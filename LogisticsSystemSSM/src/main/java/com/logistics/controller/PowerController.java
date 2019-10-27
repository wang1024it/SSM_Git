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

import com.logistics.po.Power;
import com.logistics.po.User;
import com.logistics.po.Usertype;
import com.logistics.service.IPowerService;
import com.logistics.service.IUserService;
import com.logistics.service.IUsertypeService;
import com.logistics.util.JsonReturn;
import com.logistics.util.RMessage;
import com.logistics.vo.PowerVo;

@Controller
@RequestMapping("/PowerController")
public class PowerController {
	@Autowired
	IUserService iUserService;
	@Autowired
	IUsertypeService iUsertypeService;

	@Autowired
	IPowerService iPowerService;
	User user = null;

	@RequestMapping("/power")
	public ModelAndView power(HttpSession session) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			List<Usertype> strlist = iUsertypeService.findAll();

			mv = new ModelAndView("Power");
			mv.addObject("strlist", strlist);

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	/**
	 * 查询权限
	 * 
	 * @param UserTypeID
	 * @param map
	 * @param pw
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/select0perate")
	protected void select0perate(Integer UserTypeID, Map map, PrintWriter pw) {

		List<PowerVo> list = null;
		if (UserTypeID > 0) {
			map.put("usertypeid", UserTypeID);
			list = iPowerService.findPower(map);
		}
		RMessage.returnMessage(pw, null, list, null);
	}

	/**
	 * 关闭权限
	 * 
	 * @param UserType
	 * @param ModuleID
	 * @param pw
	 * @param map
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/deletePower")
	protected void deletePower(Integer UserType, Integer ModuleID,
			PrintWriter pw, Map map, HttpSession session) {
		JsonReturn jsonReturn = new JsonReturn();
		if (UserType > 0 && (ModuleID) > 0) {
			map.put("usertypeid", UserType);
			if (Integer.valueOf(ModuleID) != 20) {

				map.put("moduleid", ModuleID);

				List<PowerVo> list = iPowerService.findPower(map);
				if (list.size() > 0) {
					map.clear();
					map.put("moduleid", ModuleID);
					int b = iPowerService.deleteBySql(map);
					if (b > 0) {
						jsonReturn.setMsg("关闭成功！！");
						jsonReturn.setState(true);

					} else {
						jsonReturn.setMsg("关闭失败！！");
						jsonReturn.setState(false);
					}

				} else {
					jsonReturn.setMsg("此权限还没有开启！！");
					jsonReturn.setState(false);
				}
			} else {
				List<PowerVo> list = iPowerService.findPower(map);

				if (list.size() > 0) {

					int b = iPowerService.deleteBySql(map);
					if (b > 0) {
						jsonReturn.setMsg("关闭成功！！");
						jsonReturn.setState(true);

					} else {
						jsonReturn.setMsg("关闭失败！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("此角色没有权限，不用关闭！！");
					jsonReturn.setState(false);

				}
			}
		} else {
			jsonReturn.setMsg("请选择需要开启的权限！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);

	}

	/**
	 * 新增权限
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/insertPower")
	protected void insertPower(Integer UserType, Integer ModuleID,
			PrintWriter pw, Map map, HttpSession session) {
		JsonReturn jsonReturn = new JsonReturn();
		if ((UserType) > 0 && (ModuleID) > 0) {
			map.put("usertypeid", UserType);
			map.put("moduleid", ModuleID);
			if (Integer.valueOf(ModuleID) != 20) {

				List<PowerVo> list = iPowerService.findPower(map);
				if (list.size() == 0) {

					Power newpower = new Power();
					newpower.setModuleid(ModuleID);

					newpower.setUsertypeid(Integer.valueOf(UserType));
					int b = iPowerService.insert(newpower);
					if (b > 0) {
						jsonReturn.setMsg("开启成功！！");
						jsonReturn.setState(true);

					} else {
						jsonReturn.setMsg("开启失败！！");
						jsonReturn.setState(false);
					}

				} else {
					jsonReturn.setMsg("已经开启此权限！！");
					jsonReturn.setState(false);
				}

			} else {
				List<PowerVo> list = iPowerService.findPower(map);
				if (list.size() > 0) {
					iPowerService.deleteBySql(map);
				}

				for (int i = 1; i < Integer.valueOf(ModuleID); i++) {
					Power newpower = new Power();
					newpower.setModuleid(i);

					newpower.setUsertypeid(Integer.valueOf(UserType));
					int bol = iPowerService.insert(newpower);
					if (bol > 0) {
						jsonReturn.setMsg("开启成功！！");
						jsonReturn.setState(true);

					} else {
						jsonReturn.setMsg("开启失败！！");
						jsonReturn.setState(false);
					}

				}

			}
		} else {
			jsonReturn.setMsg("请选择需要开启的权限！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}
}
