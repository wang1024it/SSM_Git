package com.logistics.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
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

import com.logistics.po.Cartype;
import com.logistics.po.User;
import com.logistics.po.Usertypedetail;
import com.logistics.service.ICarService;
import com.logistics.service.ICartypeService;
import com.logistics.service.IUserService;
import com.logistics.service.IUsertypedetailService;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.FormListObjectUtil;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.MD5Util;
import com.logistics.util.RMessage;
import com.logistics.util.ReadFileUtil;
import com.logistics.util.Tools;
import com.logistics.util.ValidateIDCardPhotoUtil;
import com.logistics.vo.UserVo;

@Controller
@RequestMapping("/DriverManagementController")
public class DriverManagementController {
	@Autowired
	ICarService iCarService;
	@Autowired
	ICartypeService iCartypeService;
	@Autowired
	IUserService iUserService;
	@Autowired
	IUsertypedetailService iUsertypedetailService;
	User user = null;

	@RequestMapping("/driverManagement")
	public ModelAndView driverManagement(HttpSession session) {

		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {

			List<Cartype> carTypeList = iCartypeService.findAll();

			mv = new ModelAndView("DriverManagement");

			mv.addObject("carTypeList", carTypeList);

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
	@RequestMapping(value = "/getUserList", method = RequestMethod.GET)
	@ResponseBody
	protected DatatablesViewPage<UserVo> getUserList(Integer length,
			Integer start, String Condition, Map map) {

		int totalRows = 0;

		if ((length) >= 0 && (start) >= 0) {

			map.put("startIndex", start);
			map.put("pageSize", length);
			map.put("InstitutionalOrganizationID", 3);

			DatatablesViewPage<UserVo> view = new DatatablesViewPage<UserVo>();

			if (Tools.isNotNull(Condition)) {
				map.put("UserCondition", Condition);
			}
			List<UserVo> list = iUserService.findPageUserVo(map);
			totalRows = iUserService.getTotalRowUserVo(map);

			view.setiTotalDisplayRecords(totalRows);
			view.setiTotalRecords(totalRows);

			view.setAaData(list);
			return view;

		}
		return null;
	}

	/**
	 * 查找司机信息
	 * 
	 * @param pw
	 * @param UserID
	 */
	@RequestMapping("/selectDriver")
	protected void selectDriver(PrintWriter pw, int UserID) {

		User newuser = null;
		if (UserID > 0) {
			newuser = iUserService.selectByPrimaryKey(UserID);

		}
		pw.write(JSONObject.fromObject(newuser).toString());
	}

	/**
	 * 新增司机
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/insertDriver")
	protected void insertDriver(
			HttpServletRequest request,
			User newuser,
			PrintWriter pw,
			@RequestParam(value = "picture", required = true) MultipartFile[] myFile,
			String confirmLoginPassWord, String confirmPayPassWord,
			@SuppressWarnings("rawtypes") Map map) throws IOException {
		JsonReturn jsonReturn = new JsonReturn();

		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp";
		File uploadDir = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir.exists()) {
			uploadDir.mkdir();

		}
		int Record = 0;
		List<String> imageName = new ArrayList<String>();

		if (myFile.length == 4) {
			try {
				if (myFile != null && myFile.length > 0) {
					String uploadFileName = "";
					for (MultipartFile multipartFile : myFile) {
						uploadFileName = ReadFileUtil
								.readWriteFile(multipartFile.getInputStream(),
										multipartFile.getOriginalFilename(),
										uploadPath);
						imageName.add(uploadFileName);
					}
					if (imageName.size() == 4) {
						newuser.setPhoto(imageName.get(0));
						newuser.setIdphoto(imageName.get(1));
						newuser.setDrivinglicencephoto(imageName.get(2));
						newuser.setMancarphoto(imageName.get(3));

						if (Tools.isNotNull(newuser.getAddress())
								&& Tools.isNotNull(newuser.getIdnumber())
								&& Tools.isNotNull(newuser.getUsername())
								&& Tools.isNotNull(newuser.getPhonenumber())
								&& Tools.isNotNull(newuser.getSex())
								&& Tools.isNotNull(newuser.getPhoto())
								&& Tools.isNotNull(newuser.getMancarphoto())
								&& Tools.isNotNull(newuser.getIdphoto())
								&& Tools.isNotNull(newuser
										.getDrivinglicencephoto())) {
							if (!Tools.isNotNull(newuser.getLoginpassword())) {
								newuser.setLoginpassword("12345");

							}
							if (!Tools.isNotNull(confirmLoginPassWord)) {
								confirmLoginPassWord = "12345";
							}
							if (!Tools.isNotNull(newuser.getPaymentpassword())) {
								newuser.setPaymentpassword("12345");
							}
							if (!Tools.isNotNull(confirmPayPassWord)) {
								confirmPayPassWord = "12345";
							}
							if (confirmLoginPassWord.equals(newuser
									.getLoginpassword())) {

								if (confirmPayPassWord.equals(newuser
										.getPaymentpassword())) {
									map.put("phonenumber",
											newuser.getPhonenumber());
									List<UserVo> list = iUserService
											.findUserBySQL(map);

									if (list.size() == 0) {
										map.clear();
										map.put("idnumber",
												newuser.getIdnumber());
										List<UserVo> list1 = iUserService
												.findUserBySQL(map);
										if (list1.size() == 0) {
											if (ValidateIDCardPhotoUtil
													.ValidateIDPoto(
															uploadPath
																	+ "\\"
																	+ newuser
																			.getIdphoto(),
															"front",
															newuser.getIdnumber())) {
												if (ValidateIDCardPhotoUtil
														.driverLicence(uploadPath
																+ "\\"
																+ newuser
																		.getDrivinglicencephoto())) {

													newuser.setLoginpassword(MD5Util
															.getMD5(confirmLoginPassWord));
													newuser.setPaymentpassword(MD5Util
															.getMD5(confirmPayPassWord));
													newuser.setInstitutionalorganizationid(3);
													newuser.setStatusid(2);
													newuser.setEntrytime(GetTimeUtil
															.changeStrToTime(GetTimeUtil
																	.getNowTime()));
													newuser.setEnableno(true);
													newuser.setRemainingsum(Float
															.valueOf(0));

													int i = iUserService
															.insertReturnID(newuser);
													if (i > 0) {
														int userID = newuser
																.getUserid();
														Usertypedetail usertypedetail = new Usertypedetail();
														if (userID > 0) {
															usertypedetail
																	.setUserid(userID);
															usertypedetail
																	.setUsertypeid(1);
															int r = iUsertypedetailService
																	.insert(usertypedetail);
															if (r > 0) {
																jsonReturn
																		.setMsg("新增成功！！");
																jsonReturn
																		.setState(true);
															} else {
																jsonReturn
																		.setMsg("新增失败！！");
																jsonReturn
																		.setState(false);
																iUserService
																		.deleteByPrimaryKey(userID);
																Record = 1;
															}

														} else {
															jsonReturn
																	.setMsg("新增失败！！");
															jsonReturn
																	.setState(false);
															Record = 1;
														}

													} else {
														jsonReturn
																.setMsg("新增失败！！");
														jsonReturn
																.setState(false);
														Record = 1;
													}
												} else {
													jsonReturn
															.setMsg("错误驾驶证照片！！");
													jsonReturn.setState(false);
													Record = 1;
												}
											} else {
												jsonReturn
														.setMsg("输入的身份证号码与身份证照片的号码不一致！！");
												jsonReturn.setState(false);
												Record = 1;
											}
										} else {
											jsonReturn.setMsg("此人已经注册！！");
											jsonReturn.setState(false);
											Record = 1;
										}
									} else {
										jsonReturn.setMsg("此手机号码已经被注册！！");
										jsonReturn.setState(false);
										Record = 1;
									}
								} else {
									jsonReturn.setMsg("支付密码不一致！！");
									jsonReturn.setState(false);
									Record = 1;
								}

							} else {
								jsonReturn.setMsg("登录密码不一致！！");
								jsonReturn.setState(false);
								Record = 1;
							}

						} else {
							jsonReturn.setMsg("请填写完整信息！！");
							jsonReturn.setState(false);
							Record = 1;
						}

					} else {
						jsonReturn.setMsg("请图片不能为空！！");
						jsonReturn.setState(false);
						Record = 1;
					}

				} else {
					jsonReturn.setMsg("请图片不能为空！！");
					jsonReturn.setState(false);
				}

			} catch (Exception e) {
				e.printStackTrace();
				jsonReturn.setMsg("失败");
				jsonReturn.setState(false);
				Record = 1;
			}
		}
		if (Record > 0) {

			if (imageName.size() > 0) {
				for (int i = 0; i < imageName.size(); i++) {
					File oldFile = new File(uploadPath + "\\"
							+ imageName.get(i));
					if (oldFile.exists() && oldFile.isFile()) {
						oldFile.delete();
					}

				}

			}
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);

	}

	/**
	 * 修改司机信息
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/updateDriver")
	protected void updateDriver(HttpServletRequest request, User newuser,
			PrintWriter pw,
			@RequestParam(value = "picture") List<MultipartFile> myFile,
			@SuppressWarnings("rawtypes") Map map, FormListObjectUtil listName) {
		JsonReturn jsonReturn = new JsonReturn();

		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp";
		File uploadDir = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir.exists()) {
			uploadDir.mkdir();

		}
		int Record = 0;
		List<String> imageName = new ArrayList<String>();
		User oldUser = iUserService.selectByPrimaryKey(newuser.getUserid());
		if (oldUser != null) {

			try {
				if (myFile != null && myFile.size() > 0) {

					String uploadFileName = "";
					for (MultipartFile multipartFile : myFile) {
						uploadFileName = ReadFileUtil
								.readWriteFile(multipartFile.getInputStream(),
										multipartFile.getOriginalFilename(),
										uploadPath);
						imageName.add(uploadFileName);

						for (int i = 0; i < listName.getFilelist().size(); i++) {

							if (listName.getFilelist().get(i)
									.equals("personPhoto")) {

								newuser.setPhoto(uploadFileName);
								listName.getFilelist().remove(i);
								i--;
								break;
							} else if (listName.getFilelist().get(i)
									.equals("driverPhoto")) {
								newuser.setDrivinglicencephoto(uploadFileName);
								listName.getFilelist().remove(i);
								i--;
								break;
							} else if (listName.getFilelist().get(i)
									.equals("manCarPhoto")) {
								newuser.setMancarphoto(uploadFileName);
								listName.getFilelist().remove(i);
								i--;
								break;
							} else if (listName.getFilelist().get(i)
									.equals("idPhoto")) {
								newuser.setIdphoto(uploadFileName);
								listName.getFilelist().remove(i);
								i--;
								break;
							}
							if (i < 0) {
								i = 0;
							}

						}
					}

				}

				if (Tools.isNotNull(newuser.getAddress())
						&& Tools.isNotNull(newuser.getIdnumber())
						&& Tools.isNotNull(newuser.getUsername())
						&& Tools.isNotNull(newuser.getPhonenumber())
						&& Tools.isNotNull(newuser.getSex())) {
					newuser.setInstitutionalorganizationid(oldUser
							.getInstitutionalorganizationid());
					newuser.setStatusid(oldUser.getStatusid());
					map.put("phonenumber", newuser.getPhonenumber());
					map.put("noequalsid", newuser.getUserid());
					if (!Tools.isNotNull(newuser.getDrivinglicencephoto())) {
						newuser.setDrivinglicencephoto(oldUser
								.getDrivinglicencephoto());
					}
					if (!Tools.isNotNull(newuser.getPhoto())) {
						newuser.setPhoto(oldUser.getPhoto());
					}
					if (!Tools.isNotNull(newuser.getIdphoto())) {
						newuser.setIdphoto(oldUser.getIdphoto());
					}

					if (!Tools.isNotNull(newuser.getMancarphoto())) {
						newuser.setMancarphoto(oldUser.getMancarphoto());
					}
					List<UserVo> list = iUserService.findUserBySQL(map);

					if (list.size() == 0) {
						map.clear();
						map.put("noequalsid", newuser.getUserid());
						map.put("idnumber", newuser.getIdnumber());
						List<UserVo> list1 = iUserService.findUserBySQL(map);
						if (list1.size() == 0) {
							if (ValidateIDCardPhotoUtil.ValidateIDPoto(
									uploadPath + "\\" + newuser.getIdphoto(),
									"front", newuser.getIdnumber())) {
								if (ValidateIDCardPhotoUtil
										.driverLicence(uploadPath
												+ "\\"
												+ newuser
														.getDrivinglicencephoto())) {

									int i = iUserService
											.updateByPrimaryKey(newuser);
									if (i > 0) {
										jsonReturn.setMsg("修改成功！！");
										jsonReturn.setState(true);
									} else {
										jsonReturn.setMsg("修改失败！！");
										jsonReturn.setState(false);
										Record = 1;
									}
								} else {
									jsonReturn.setMsg("错误驾驶证照片！！");
									jsonReturn.setState(false);
									Record = 1;
								}
							} else {
								jsonReturn.setMsg("输入的身份证号码与身份证照片的号码不一致！！");
								jsonReturn.setState(false);
								Record = 1;
							}
						} else {
							jsonReturn.setMsg("此身份证号码已经注册！！");
							jsonReturn.setState(false);
							Record = 1;
						}
					} else {
						jsonReturn.setMsg("此手机号码已经被注册！！");
						jsonReturn.setState(false);
						Record = 1;
					}

				} else {
					jsonReturn.setMsg("请填写完整信息！！");
					jsonReturn.setState(false);
					Record = 1;
				}

			} catch (Exception e) {
				e.printStackTrace();
				jsonReturn.setMsg("失败");
				jsonReturn.setState(false);
				Record = 1;
			}

		} else {
			jsonReturn.setMsg("没有此数据");
			jsonReturn.setState(false);
			Record = 1;
		}
		if (Record > 0) {

			if (imageName.size() > 0) {
				for (int i = 0; i < imageName.size(); i++) {
					File oldFile = new File(uploadPath + "\\"
							+ imageName.get(i));
					if (oldFile.exists() && oldFile.isFile()) {
						oldFile.delete();
					}

				}

			}
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);

	}
}
