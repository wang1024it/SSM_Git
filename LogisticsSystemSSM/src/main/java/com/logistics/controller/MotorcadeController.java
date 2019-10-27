package com.logistics.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Car;
import com.logistics.po.Cartype;
import com.logistics.po.Motorcade;
import com.logistics.po.Teammembers;
import com.logistics.po.User;
import com.logistics.service.ICarService;
import com.logistics.service.ICartypeService;
import com.logistics.service.IMotorcadeService;
import com.logistics.service.ITeammembersService;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.JsonReturn;
import com.logistics.util.RMessage;
import com.logistics.util.Tools;
import com.logistics.vo.CarVo;

@Controller
@RequestMapping("/MotorcadeController")
public class MotorcadeController {
	@Autowired
	ICarService iCarService;
	@Autowired
	ICartypeService iCartypeService;
	@Autowired
	IMotorcadeService iMotorcadeService;
	@Autowired
	ITeammembersService iTeammembersService;
	User user = null;

	@RequestMapping("/personalManage")
	public ModelAndView personalManage(HttpSession session) {

		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			List<Cartype> carTypeList = iCartypeService.findAll();
			List<Car> Carlist = iCarService.findAll();
			List<Motorcade> Motolist = iMotorcadeService.findAll();
			mv = new ModelAndView("Motorcade");
			mv.addObject("user", user);
			mv.addObject("carTypeList", carTypeList);
			mv.addObject("Carlist", Carlist);
			mv.addObject("Motolist", Motolist);

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
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	@ResponseBody
	protected DatatablesViewPage<CarVo> getList(Integer length, Integer start,
			String MotorcadeID, Map map) {

		int totalRows = 0;

		if ((length) >= 0 && (start) >= 0 && Tools.isNotNull(MotorcadeID)) {

			map.put("startIndex", start);
			map.put("pageSize", length);

			map.put("InstitutionalOrganizationID", 3);
			DatatablesViewPage<CarVo> view = new DatatablesViewPage<CarVo>();

			if (Tools.isNotNull(MotorcadeID)
					&& Integer.valueOf(MotorcadeID) > 0) {
				map.put("MotorcadeID", MotorcadeID);
			}
			List<CarVo> list = iCarService.findPageBySQL(map);
			totalRows = iCarService.getTotalRowBySQL(map);

			view.setiTotalDisplayRecords(totalRows);
			view.setiTotalRecords(totalRows);

			view.setAaData(list);

			return view;

		}
		return null;
	}

	/**
	 * 变更车队
	 * 
	 * @param pw
	 * @param UserID
	 * @param NowMotorcadeNameID
	 * @param ChangeMotorcadeName
	 * @param map
	 */

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/carMatching")
	protected void carMatching(PrintWriter pw, Integer UserID,
			Integer NowMotorcadeNameID, String ChangeMotorcadeName, Map map) {
		JsonReturn jsonReturn = new JsonReturn();

		if (UserID > 0 && Tools.isNotNull(ChangeMotorcadeName)) {
			if (Tools.isNotNull(String.valueOf(NowMotorcadeNameID))) {
				map.put("MotorcadeID", NowMotorcadeNameID);
				map.put("UserID", UserID);

				Teammembers teamMembers = iTeammembersService.findBySQL(map);

				if (teamMembers != null) {

					teamMembers.setMotorcadeid(Integer
							.valueOf(ChangeMotorcadeName));
					int b = iTeammembersService.updateByPrimaryKey(teamMembers);

					if (b > 0) {
						jsonReturn.setMsg("变更成功！");
						jsonReturn.setState(true);
					} else {
						jsonReturn.setMsg("变更失败！");
						jsonReturn.setState(false);
					}

				} else {
					jsonReturn.setMsg("失败！");
					jsonReturn.setState(false);
				}

			} else {
				Teammembers teamMembers = new Teammembers();
				teamMembers
						.setMotorcadeid(Integer.valueOf(ChangeMotorcadeName));
				teamMembers.setUserid(Integer.valueOf(UserID));
				int b = iTeammembersService.insert(teamMembers);
				if (b > 0) {
					jsonReturn.setMsg("分配成功！！");
					jsonReturn.setState(true);
				} else {
					jsonReturn.setMsg("分配失败！！");
					jsonReturn.setState(false);
				}

			}
		} else {
			jsonReturn.setMsg("请选择数据！！");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 分配车辆
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/deployCar")
	protected void deployCar(PrintWriter pw, int CarID, int userID) {
		JsonReturn jsonReturn = new JsonReturn();
		if (userID > 0 && CarID > 0) {

			Car car = iCarService.selectByPrimaryKey(CarID);
			if (car != null && car.getStatusid() == 14) {
				car.setUserid(userID);
				car.setStatusid(1);
				int b = iCarService.updateByPrimaryKey(car);
				if (b > 0) {
					jsonReturn.setMsg("分配成功！！");
					jsonReturn.setState(true);
				} else {
					jsonReturn.setMsg("分配失败！！");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("没有此车辆或者已经分配了！！");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("请选择数据！！");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 查询车辆
	 * 
	 * @param pw
	 * @param CarID
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/selectCarInfor")
	public void selectCarInfor(PrintWriter pw, Integer CarID, Map map) {
		CarVo car = null;
		if (CarID > 0) {
			map.put("carid", CarID);

			car = iCarService.findCarSql(map);
		}
		pw.write(JSONArray.fromObject(car).toString());
		pw.close();
	}

	/**
	 * * 新增车队
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/insertMotorcade")
	protected void insertMotorcade(PrintWriter pw, String MotorcadeName, Map map) {
		JsonReturn jsonReturn = new JsonReturn();
		if (Tools.isNotNull(MotorcadeName)) {
			map.put("MotorcadeName", MotorcadeName);
			List<Motorcade> list = iMotorcadeService.findBySQL(map);

			if (list.size() == 0) {
				Motorcade Newmotorcade = new Motorcade();
				Newmotorcade.setMotorcadename(MotorcadeName);
				int b = iMotorcadeService.insert(Newmotorcade);
				if (b > 0) {
					jsonReturn.setMsg("新增成功！！");
					jsonReturn.setState(true);
				} else {
					jsonReturn.setMsg("新增失败！！");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("此车队已有！！");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("请填写完整数据!!");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 修改车队
	 * 
	 * @param pw
	 * @param OriginalMotorcadeName
	 * @param NowMotorcadeName
	 */
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@RequestMapping("/updateMotorcade")
	private void updateMotorcade(PrintWriter pw, Integer OriginalMotorcadeName,
			String NowMotorcadeName, Map map) {
		JsonReturn jsonReturn = new JsonReturn();
		if (OriginalMotorcadeName > 0 && Tools.isNotNull(NowMotorcadeName)) {
			map.put("MotorcadeName", NowMotorcadeName);
			Motorcade motorcade = iMotorcadeService
					.selectByPrimaryKey(OriginalMotorcadeName);
			if (motorcade != null) {
				motorcade.setMotorcadename(NowMotorcadeName);
				int r = iMotorcadeService.updateByPrimaryKey(motorcade);
				if (r > 0) {
					jsonReturn.setMsg("修改成功！！");
					jsonReturn.setState(true);
				} else {
					jsonReturn.setMsg("修改失败！！");
					jsonReturn.setState(false);
				}
			} else {
				jsonReturn.setMsg("没有此车队");
				jsonReturn.setState(false);
			}

		} else {
			jsonReturn.setMsg("请填写完整数据！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

}
