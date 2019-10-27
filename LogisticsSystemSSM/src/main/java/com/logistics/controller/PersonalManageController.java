package com.logistics.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Car;
import com.logistics.po.Cartype;
import com.logistics.po.User;
import com.logistics.service.ICarService;
import com.logistics.service.ICartypeService;
import com.logistics.service.IMotorcadeService;
import com.logistics.service.IUserService;
import com.logistics.service.IUsertypedetailService;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.JsonReturn;
import com.logistics.util.RMessage;
import com.logistics.util.ReadFileUtil;
import com.logistics.util.Tools;
import com.logistics.util.ValidateIDCardPhotoUtil;
import com.logistics.vo.UserVo;

@Controller
@RequestMapping("/PersonalManageController")
public class PersonalManageController {
	@Autowired
	ICarService iCarService;
	@Autowired
	ICartypeService iCartypeService;
	@Autowired
	IMotorcadeService iMotorcadeService;
	@Autowired
	IUserService iUserService;

	@Autowired
	IUsertypedetailService iUsertypedetailService;
	User user = null;

	@RequestMapping("/carManage")
	public ModelAndView carManage(HttpSession session) {

		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {

			List<Cartype> carTypeList = iCartypeService.findAll();

			mv = new ModelAndView("CarManagement");

			mv.addObject("carTypeList", carTypeList);

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	

	

	/**
	 * 查询私家车用户
	 * 
	 * @param pw
	 * @param value
	 */
	@SuppressWarnings({ "unused", "unchecked", "rawtypes" })
	@RequestMapping("/selectUser")
	private void selectUser(PrintWriter pw, String value, Map map) {
		List<UserVo> list = null;
		if (Tools.isNotNull(value)) {
			map.put("InstitutionalOrganizationID", 3);
			map.put("ishavecar", value);

			list = iUserService.findUserCar(map);
			if (list.size() > 0) {

				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getCarid() != null
							|| list.get(i).getIshavecar() == false) {
						list.remove(i);
						i--;
					}
				}
			}
		}
		RMessage.returnMessage(pw, null, list, null);
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
	@RequestMapping(value = "/getCarList", method = RequestMethod.GET)
	@ResponseBody
	protected DatatablesViewPage<Car> getCarList(Integer length, Integer start,
			String CarCondition, Map map) {

		int totalRows = 0;

		if ((length) >= 0 && (start) >= 0) {

			map.put("startIndex", start);
			map.put("pageSize", length);

			DatatablesViewPage<Car> view = new DatatablesViewPage<Car>();

			if (Tools.isNotNull(CarCondition)) {
				map.put("CarCondition", CarCondition);
			}
			List<Car> list = iCarService.findPage(map);
			totalRows = iCarService.getTotalRow(map);

			view.setiTotalDisplayRecords(totalRows);
			view.setiTotalRecords(totalRows);

			view.setAaData(list);
			return view;

		}
		return null;
	}

	
	
	/**
	 * 新增车辆
	 * 
	 * @param request
	 * @param response
	 * @throws FileNotFoundException
	 * @throws ServletException
	 * @throws IOException
	 * @throws IllegalAccessException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/insertCar")
	protected void insertCar(
			@RequestParam(value = "picture", required = true) MultipartFile myFile,
			PrintWriter pw, HttpServletRequest request, Car car,
			@SuppressWarnings("rawtypes") Map map)
			throws FileNotFoundException, IOException, IllegalAccessException {
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
			String PhotoUrl = uploadPath + "\\" + uploadFileName;
			car.setCardrivinglicensephoto(uploadFileName);
			if (Tools.checkObjFieldIsNull(car)
					&& Tools.isNotNull(car.getPlatenumber())
					&& car.getCartypeid() > 0
					&& Tools.isNotNull(car.getMaxload())
					&& Tools.isNotNull(car.getCardrivinglicensephoto())) {

				if (ValidateIDCardPhotoUtil.CarDrivingLicensePhoto(PhotoUrl,
						car.getPlatenumber())) {

					if (car.getIsprivate() == false) {
						car.setUserid(0);
					}

					car.setStatusid(14);
					map.put("platenumber", car.getPlatenumber());
					Car oldcar = iCarService.findCar(map);
					car.setMaxload(car.getMaxload() + "kg");
					car.setCarriagespecification(car.getCarriagespecification()
							+ "/箱");
					if (String.valueOf(car.getUserid()) != null) {
						car.setUserid(0);
					}
					if (oldcar == null) {

						int b = iCarService.insert(car);
						if (b > 0) {
							jsonReturn.setState(true);
							jsonReturn.setMsg("录入成功！！");
						} else {
							jsonReturn.setMsg("录入失败！！");
							jsonReturn.setState(false);
							File oldFile = new File(PhotoUrl);
							if (oldFile.exists() && oldFile.isFile()) {
								oldFile.delete();
							}
						}
					} else {
						jsonReturn.setMsg("此车已有，不用再次录入！！");
						jsonReturn.setState(false);
						File oldFile = new File(PhotoUrl);
						if (oldFile.exists() && oldFile.isFile()) {
							oldFile.delete();
						}
					}

				} else {
					jsonReturn.setMsg("行驶证图片车牌号码与填写的车牌号码不一致！！");
					jsonReturn.setState(false);
					File oldFile = new File(PhotoUrl);
					if (oldFile.exists() && oldFile.isFile()) {
						oldFile.delete();
					}

				}
			} else {
				jsonReturn.setMsg("数据不完整！！");
				jsonReturn.setState(false);
				File oldFile = new File(PhotoUrl);
				if (oldFile.exists() && oldFile.isFile()) {
					oldFile.delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 查询车辆
	 * 
	 * @param pw
	 * @param CarID
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/selectCar")
	private void selectCar(PrintWriter pw, int CarID) {
		Car car = null;
		JsonReturn jsonReturn = new JsonReturn();
		if (CarID > 0) {
			car = iCarService.selectByPrimaryKey(CarID);

		} else {
			jsonReturn.setMsg("请选择车辆！！！");
			jsonReturn.setState(false);
		}
		pw.write(JSONObject.fromObject(car).toString());

	}

	

	/**
	 * 修改车辆信息
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/updateCar")
	protected void updateCar(HttpServletRequest request,
			HttpServletResponse response, MultipartFile picture, Car car,
			Map map, String PrivateUserID, PrintWriter pw) throws IOException {
		JsonReturn jsonReturn = new JsonReturn();
		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp";

		String PhotoUrl = uploadPath + "\\";
		File uploadDir = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir.exists()) {
			uploadDir.mkdir();

		}
		try {
			if (Tools.checkObjFieldIsNull(car) && car.getCarid() > 0
					&& Tools.isNotNull(car.getMaxload())
					&& Tools.isNotNull(car.getPlatenumber())
					&& Tools.isNotNull(car.getCarriagespecification())) {

				Car oldcar = iCarService.selectByPrimaryKey(car.getCarid());
				if (picture != null) {

					String uploadFileName = ReadFileUtil.readWriteFile(
							picture.getInputStream(),
							picture.getOriginalFilename(), uploadPath);
					PhotoUrl = uploadPath + "\\" + uploadFileName;
					car.setCardrivinglicensephoto(uploadFileName);
				} else {
					car.setCardrivinglicensephoto(oldcar
							.getCardrivinglicensephoto());
					PhotoUrl = uploadPath + "\\"
							+ oldcar.getCardrivinglicensephoto();
				}

				if (ValidateIDCardPhotoUtil.CarDrivingLicensePhoto(PhotoUrl,
						car.getPlatenumber())) {

					car.setMaxload(car.getMaxload());
					car.setCarriagespecification(car.getCarriagespecification());
					map.put("platenumber", car.getPlatenumber());
					map.put("Distinguish", car.getCarid());
					oldcar = iCarService.findCar(map);
					if (oldcar == null) {
						car.setStatusid(14);

						if (Tools.isNotNull(PrivateUserID)) {
							car.setUserid(Integer.valueOf(PrivateUserID));

						} else {
							car.setUserid(0);
						}

						int b = iCarService.updateByPrimaryKey(car);
						if (b > 0) {
							jsonReturn.setState(true);
							jsonReturn.setMsg("修改成功！！");
						} else {
							jsonReturn.setMsg("修改失败！！");
							jsonReturn.setState(false);
							if (picture != null) {
								File oldFile = new File(PhotoUrl);
								if (oldFile.exists() && oldFile.isFile()) {
									oldFile.delete();
								}
							}
						}
					} else {
						jsonReturn.setMsg("此车已有，不用再次录入！！");
						jsonReturn.setState(false);
						if (picture != null) {
							File oldFile = new File(PhotoUrl);
							if (oldFile.exists() && oldFile.isFile()) {
								oldFile.delete();
							}
						}
					}

				} else {
					jsonReturn.setMsg("行驶证图片车牌号与填写的车牌号码不一致！！");
					jsonReturn.setState(false);
					if (picture != null) {
						File oldFile = new File(PhotoUrl);
						if (oldFile.exists() && oldFile.isFile()) {
							oldFile.delete();
						}
					}

				}
			} else {
				jsonReturn.setMsg("数据不完整！！");
				jsonReturn.setState(false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			jsonReturn.setMsg("服务器异常，请稍后再试");
			jsonReturn.setState(false);
			File oldFile = new File(PhotoUrl);
			if (oldFile.exists() && oldFile.isFile()) {
				oldFile.delete();
			}

		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	
}
