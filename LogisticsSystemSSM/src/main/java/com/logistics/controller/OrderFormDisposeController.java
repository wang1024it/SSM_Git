package com.logistics.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Approvalrecord;
import com.logistics.po.Cancel;
import com.logistics.po.Car;
import com.logistics.po.Custom;
import com.logistics.po.Logisticstracking;
import com.logistics.po.Motorcade;
import com.logistics.po.Mrchandise;
import com.logistics.po.Mrchandisetype;
import com.logistics.po.Orderform;
import com.logistics.po.Orderformdetail;
import com.logistics.po.Payment;
import com.logistics.po.Procuratory;
import com.logistics.po.Teammembers;
import com.logistics.po.Transportmode;
import com.logistics.po.User;
import com.logistics.service.IApprovalrecordService;
import com.logistics.service.IBillingmethodService;
import com.logistics.service.ICancelService;
import com.logistics.service.ICarService;
import com.logistics.service.ICustomService;
import com.logistics.service.ILogisticsTrackingService;
import com.logistics.service.IMotorcadeService;
import com.logistics.service.IMrchandiseService;
import com.logistics.service.IMrchandisetypeService;
import com.logistics.service.IOrderformService;
import com.logistics.service.IOrderformdetailService;
import com.logistics.service.IOrderproblemService;
import com.logistics.service.IPaymentService;
import com.logistics.service.IProcuratoryService;
import com.logistics.service.ITeammembersService;
import com.logistics.service.ITransportModeService;
import com.logistics.service.IUserService;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.FormListObjectUtil;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.RMessage;
import com.logistics.util.Tools;
import com.logistics.vo.OrderformDetailVo;
import com.logistics.vo.OrderformVo;
import com.logistics.vo.OrderproblemVo;
import com.logistics.vo.ProcuratoryVo;

@Controller
@RequestMapping("/OrderFormDisposeController")
public class OrderFormDisposeController {
	@Autowired
	IBillingmethodService ibillingmethodService;
	@Autowired
	IOrderformService iOrderformService;
	@Autowired
	ITransportModeService iTransportModeService;
	@Autowired
	IMrchandisetypeService iMrchandisetypeService;
	@Autowired
	IPaymentService iPaymentService;
	@Autowired
	ICustomService iCustomService;
	@Autowired
	IMrchandiseService iMrchandiseService;
	@Autowired
	IOrderformdetailService iOrderformdetailService;
	@Autowired
	IProcuratoryService iProcuratoryService;
	@Autowired
	IUserService iUserService;
	@Autowired
	ITeammembersService iTeammembersService;
	@Autowired
	ILogisticsTrackingService iLogisticsTrackingService;
	@Autowired
	IApprovalrecordService iApprovalrecordService;
	@Autowired
	IOrderproblemService iOrderproblemService;
	@Autowired
	ICarService iCarService;
	@Autowired
	IMotorcadeService iMotorcadeService;
	@Autowired
	ICancelService iCancelService;

	User user = null;

	@RequestMapping("/orderFormDispose")
	public ModelAndView orderFormDispose(HttpSession session) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("OrderFormDispose");
			List<Mrchandisetype> MRlist = iMrchandisetypeService.findAll();

			List<Payment> Pylist = iPaymentService.findAll();

			// List<Billingmethod> billlist = ibillingmethodService.findAll();

			List<Transportmode> Tplllist = iTransportModeService.findAll();
			List<Custom> customlist = iCustomService.findAll();
			List<Motorcade> list = iMotorcadeService.findAll();

			mv.addObject("customlist", customlist);
			mv.addObject("Motolist", list);
			mv.addObject("user", user);
			mv.addObject("MRlist", MRlist);
			mv.addObject("Pylist", Pylist);
			// mv.addObject("billlist", billlist);
			mv.addObject("Tplllist", Tplllist);
			mv.addObject("user", user);

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	@RequestMapping("/inputorder")
	public ModelAndView inputorder(HttpSession session) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("InputNewOrder");
			List<Mrchandisetype> MRlist = iMrchandisetypeService.findAll();

			List<Payment> Pylist = iPaymentService.findAll();

			// List<Billingmethod> billlist = ibillingmethodService.findAll();

			List<Transportmode> Tplllist = iTransportModeService.findAll();
			List<Custom> customlist = iCustomService.findAll();
			List<Motorcade> list = iMotorcadeService.findAll();

			mv.addObject("customlist", customlist);
			mv.addObject("Motolist", list);
			mv.addObject("user", user);
			mv.addObject("MRlist", MRlist);
			mv.addObject("Pylist", Pylist);
			// mv.addObject("billlist", billlist);
			mv.addObject("Tplllist", Tplllist);
			mv.addObject("user", user);

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
			Integer start, String audit, String problem, String finish,
			String vague, String startTime, String endTime,
			@SuppressWarnings("rawtypes") Map map) {
		DatatablesViewPage<OrderformVo> view = new DatatablesViewPage<OrderformVo>();
		if (length >= 0 && start >= 0) {
			if (Tools.isNotNull(audit)) {
				map.put("audit", audit);
			}
			if (Tools.isNotNull(problem)) {
				map.put("problem", problem);
			}
			if (Tools.isNotNull(finish)) {
				map.put("finish", finish);
			}

			if (Tools.isNotNull(startTime)) {
				map.put("startTime", startTime);
			}
			if (Tools.isNotNull(endTime)) {
				map.put("endTime", endTime);
			}
			if (Tools.isNotNull(vague)) {
				map.put("vague", vague);
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
	 * 新增订单
	 * 
	 * @param orderform
	 * @param list
	 * @param map
	 * @param pw
	 * @throws IllegalAccessException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/insertOrderForm")
	protected void insertOrderForm(Orderform orderform,
			FormListObjectUtil list, @SuppressWarnings("rawtypes") Map map,
			PrintWriter pw) throws IllegalAccessException {
		JsonReturn jsonReturn = new JsonReturn();

		Calendar now = Calendar.getInstance();

		String OrderNumber = "";
		map.put("Reverse", orderform.getTransportcost());
		int orderformID = 0;
		int mrchandisID = 0;
		try {

			List<Orderform> orderlist = iOrderformService.selectOrderNumber();
			if (orderlist.size() > 0) {
				OrderNumber = String.valueOf(Integer.valueOf(orderlist.get(0)
						.getOrdernumber().substring(8)) + 1);
				if (OrderNumber.length() == 1) {
					OrderNumber = "00000" + OrderNumber;
				} else if (OrderNumber.length() == 2) {
					OrderNumber = "0000" + OrderNumber;
				} else if (OrderNumber.length() == 3) {
					OrderNumber = "000" + OrderNumber;
				} else if (OrderNumber.length() == 4) {
					OrderNumber = "00" + OrderNumber;
				} else if (OrderNumber.length() == 5) {
					OrderNumber = "0" + OrderNumber;
				}
				OrderNumber = String.valueOf(now.get(Calendar.YEAR))
						+ (String.valueOf(now.get(Calendar.MONTH) + 1).length() == 2 ? String
								.valueOf(now.get(Calendar.MONTH) + 1) : "0"
								+ String.valueOf(now.get(Calendar.MONTH) + 1))
						+ (String.valueOf(now.get(Calendar.DATE)).length() == 2 ? String
								.valueOf(now.get(Calendar.DATE)) : "0"
								+ String.valueOf(now.get(Calendar.DATE)))
						+ OrderNumber;
			} else {
				OrderNumber = String.valueOf(now.get(Calendar.YEAR))
						+ (String.valueOf(now.get(Calendar.MONTH) + 1).length() == 2 ? String
								.valueOf(now.get(Calendar.MONTH) + 1) : "0"
								+ String.valueOf(now.get(Calendar.MONTH) + 1))
						+ (String.valueOf(now.get(Calendar.DATE)).length() == 2 ? String
								.valueOf(now.get(Calendar.DATE)) : "0"
								+ String.valueOf(now.get(Calendar.DATE)))
						+ "000001";

			}
			if (Tools.checkObjFieldIsNull(orderform)
					&& Tools.isNotNull(orderform.getTakeadress())
					&& Tools.isNotNull(orderform.getTakename())
					&& Tools.isNotNull(orderform.getTakephonenumber())
					&& Tools.isNum(String.valueOf(orderform.getPaymentid()))
					&& Tools.isNum(String.valueOf(orderform
							.getTransportmodeid()))
					&& Tools.isNotNull(orderform.getSendadress())
					&& Tools.isNum(String.valueOf(orderform.getCustomid()))
					&& Tools.isNotNull(orderform.getSendname())
					&& Tools.isNotNull(orderform.getSendphonenumber())
					&& Tools.isNum(String.valueOf(orderform.getTransportcost()))) {

				orderform.setIsindeedupload(false);
				if (!"1".equals(orderform.getPaymentid())) {
					orderform.setBargainmoney(Float.valueOf(0));
				}
				orderform.setIsauditing(false);
				orderform.setUploadtime(GetTimeUtil.changeStrToTime(GetTimeUtil
						.getNowTime()));
				orderform.setOrdernumber(OrderNumber);
				orderform.setIsfinish(false);
				orderform.setStatusid(17);
				orderform.setFinishtime(null);
				orderform.setStarttime(null);
				orderform.setSingletime(null);
				orderform.setIsproblem(false);
				if (list.getMrchlist().size() == list.getOrderformdetaillist()
						.size()) {
					if (list.getMrchlist().size() > 0) {
						for (int i = 0; i < list.getMrchlist().size(); i++) {
							if (!Tools.isNotNull(list.getMrchlist().get(i)
									.getMrchandisename())
									|| !Tools.isNotNull(String.valueOf(list
											.getOrderformdetaillist().get(i)
											.getVolume()))) {
								list.getMrchlist().remove(i);
								list.getOrderformdetaillist().remove(i);
								i--;
							}

						}
						int r = iOrderformService.insertReturnID(orderform);
						orderformID = orderform.getOrderformid();
						if (r > 0) {
							Orderformdetail orderformdetail = null;
							Mrchandise mrchandise = null;
							for (int i = 0; i < list.getMrchlist().size(); i++) {
								orderformdetail = new Orderformdetail();
								mrchandise = new Mrchandise();
								if (Tools.checkObjFieldIsNull(list
										.getMrchlist().get(i))
										&& Tools.isNotNull(list.getMrchlist()
												.get(i).getMrchandisename())
										&& Tools.isNotNull(String.valueOf(list
												.getMrchlist().get(i)
												.getMrchandisetypeid()))) {
									mrchandise.setMrchandisename(list
											.getMrchlist().get(i)
											.getMrchandisename());
									mrchandise.setMrchandisetypeid(list
											.getMrchlist().get(i)
											.getMrchandisetypeid());
									mrchandisID = iMrchandiseService
											.insertReturnID(mrchandise);
									list.getMrchlist()
											.get(i)
											.setMrchandiseid(
													mrchandise
															.getMrchandiseid());
									if (mrchandisID > 0) {
										if (Tools.checkObjFieldIsNull(list
												.getOrderformdetaillist()
												.get(i))
												&& Tools.isNotNull(String
														.valueOf(list
																.getOrderformdetaillist()
																.get(i)
																.getQuantity()))
												&& Tools.isNotNull(String
														.valueOf(list
																.getOrderformdetaillist()
																.get(i)
																.getVolume()))
												&& Tools.isNotNull(String
														.valueOf(list
																.getOrderformdetaillist()
																.get(i)
																.getWeight()))) {
											orderformdetail
													.setMrchandiseid(mrchandise
															.getMrchandiseid());

											orderformdetail
													.setOrderformid(orderformID);
											orderformdetail.setQuantity(list
													.getOrderformdetaillist()
													.get(i).getQuantity());
											orderformdetail.setVolume(list
													.getOrderformdetaillist()
													.get(i).getVolume());
											orderformdetail.setWeight(list
													.getOrderformdetaillist()
													.get(i).getWeight());
											int k = iOrderformdetailService
													.insertSelective(orderformdetail);
											if (k > 0) {
												jsonReturn.setMsg("新增成功！！");
												jsonReturn.setState(true);
											} else {
												jsonReturn.setMsg("出错啦！！");
												jsonReturn.setState(false);
												iOrderformService
														.deleteByPrimaryKey(orderformID);
												for (int j = 0; j < list
														.getMrchlist().size(); j++) {

													iMrchandiseService
															.deleteByPrimaryKey(list
																	.getMrchlist()
																	.get(j)
																	.getMrchandiseid());
												}

												break;
											}

										} else {
											jsonReturn.setMsg("物品信息不完整！！");
											jsonReturn.setState(false);
											iOrderformService
													.deleteByPrimaryKey(orderformID);
											for (int j = 0; j < list
													.getMrchlist().size(); j++) {

												iMrchandiseService
														.deleteByPrimaryKey(list
																.getMrchlist()
																.get(j)
																.getMrchandiseid());

											}

											break;
										}

									} else {
										jsonReturn.setMsg("出错啦！！");
										jsonReturn.setState(false);
										iOrderformService
												.deleteByPrimaryKey(orderformID);
										break;
									}

								} else {
									jsonReturn.setMsg("物品信息不完整！！");
									jsonReturn.setState(false);
									iOrderformService
											.deleteByPrimaryKey(orderformID);
									break;

								}

							}

						} else {
							jsonReturn.setMsg("出错啦！！");
							jsonReturn.setState(false);
						}
					} else {
						jsonReturn.setMsg("请填写物品信息！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("填写的数据不对应！！");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("请填写完整数据！！");
				jsonReturn.setState(false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonReturn.setMsg("出错啦！！");
			jsonReturn.setState(false);
			if (orderformID > 0) {
				iOrderformService.deleteByPrimaryKey(orderformID);

				map.put("orderformid", orderformID);
				List<OrderformDetailVo> OrderDetaillist = iOrderformdetailService
						.findBySQL(map);

				if (OrderDetaillist.size() > 0) {

					for (int i = 0; i < OrderDetaillist.size(); i++) {
						iMrchandiseService.deleteByPrimaryKey(OrderDetaillist
								.get(i).getMrchandiseid());
					}

				}
				iOrderformdetailService.deleteByOrderformID(orderformID);
			}

		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 查询用户
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/selectUser")
	protected void selectUser(PrintWriter pw, int MotorcadeID, Map map) {

		List<User> userlist = null;

		if (MotorcadeID > 0) {
			map.put("MotorcadeID", MotorcadeID);
			userlist = iUserService.findAllBySql(map);

		}

		RMessage.returnMessage(pw, null, userlist, null);
	}

	/**
	 * 委任司机
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/appointDriver")
	protected void appointDriver(PrintWriter pw, int OrderID, int Motorcade,
			String YongHuID, @SuppressWarnings("rawtypes") Map map) {
		JsonReturn jsonReturn = new JsonReturn();

		if (OrderID > 0 && Motorcade > 0 && Tools.isNotNull(YongHuID)) {
			map.put("MotorcadeID", Motorcade);
			map.put("UserID", YongHuID);

			Teammembers teamMembers = iTeammembersService.findBySQL(map);

			if (teamMembers != null) {
				Procuratory procuratory = new Procuratory();
				procuratory.setOrderformid(OrderID);

				procuratory.setTeammembersid(teamMembers.getTeammembersid());
				Orderform orderForm = iOrderformService
						.selectByPrimaryKey(OrderID);

				orderForm.setStatusid(13);

				User newuser = iUserService.selectByPrimaryKey(Integer
						.valueOf(YongHuID));

				try {

					Logisticstracking logisticsTracking = new Logisticstracking();
					logisticsTracking.setOrderformid(OrderID);
					logisticsTracking.setSpecificinformation("已经派遣司机："
							+ newuser.getUsername() + ",请耐心等待！！手机号码："
							+ newuser.getPhonenumber());
					logisticsTracking.setUploadlogisticstime(GetTimeUtil
							.changeStrToTime(GetTimeUtil.getNowTime()));

					int b = iLogisticsTrackingService.insert(logisticsTracking);
					int logisID = logisticsTracking.getLogisticstrackingid();
					if (b > 0) {

						int b2 = iOrderformService
								.updateByPrimaryKey(orderForm);
						int b1 = iProcuratoryService.insert(procuratory);
						if (b1 > 0 && b2 > 0) {

							jsonReturn.setMsg("委任成功！！");
							jsonReturn.setState(true);

						} else {
							jsonReturn.setMsg("委任失败！！");
							jsonReturn.setState(false);
							iLogisticsTrackingService
									.deleteByPrimaryKey(logisID);
						}
					} else {
						jsonReturn.setMsg("委任失败！！");
						jsonReturn.setState(false);

					}
				} catch (Exception e) {
					jsonReturn.setMsg("委任失败！！");
					jsonReturn.setState(false);
				}
			} else {
				jsonReturn.setMsg("失败！！");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("请填写完整信息！！");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 审核订单
	 * 
	 * @param pw
	 * @param orderFormID
	 */

	@RequestMapping("/auditOrderForm")
	protected void auditOrderForm(PrintWriter pw, Integer orderFormID) {
		JsonReturn jsonReturn = new JsonReturn();
		if (orderFormID > 0) {

			Orderform orderForm = iOrderformService
					.selectByPrimaryKey(orderFormID);

			if (orderForm != null) {
				if (orderForm.getIsfinish() == false) {

					if (orderForm.getIsindeedupload() == true) {

						if (orderForm.getIsauditing() == false) {

							orderForm.setIsauditing(true);
							orderForm.setAudittime(GetTimeUtil
									.changeStrToTime(GetTimeUtil.getNowTime()));

							Approvalrecord approvalRecord = new Approvalrecord();
							approvalRecord.setApproverid(user.getUserid());
							approvalRecord.setOrderformid(orderForm
									.getOrderformid());

							int bol = iApprovalrecordService
									.insert(approvalRecord);

							if (bol > 0) {

								int b = iOrderformService
										.updateByPrimaryKey(orderForm);
								if (b > 0) {
									jsonReturn.setMsg("审核成功！！");
									jsonReturn.setState(true);
								} else {
									jsonReturn.setMsg("审核失败！！");
									jsonReturn.setState(false);
									iApprovalrecordService
											.deleteByPrimaryorderID(orderForm
													.getOrderformid());

								}
							} else {
								jsonReturn.setMsg("审核失败！！");
								jsonReturn.setState(false);
							}
						} else {
							jsonReturn.setMsg("已经审核！！");
							jsonReturn.setState(false);
						}
					} else {
						jsonReturn.setMsg("还没有进行订单实地上传，不可以审核！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("此订单已完成，不用审核了！！");
					jsonReturn.setState(false);
				}
			} else {
				jsonReturn.setMsg("没有此订单！！");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("请选择数据！！");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 查询订单问题
	 * 
	 * @param pw
	 * @param orderProblemID
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/selectorderProblem")
	protected void selectorderProblem(PrintWriter pw, Integer orderFormID,
			Map map) {

		if (orderFormID > 0) {
			map.put("orderformid", orderFormID);
			OrderproblemVo orderProblem = iOrderproblemService
					.findByProbleSQL(map);
			pw.write(JSONObject.fromObject(orderProblem).toString());
		}

	}

	/**
	 * 解决问题
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/solveProblem")
	protected void solveProblem(PrintWriter pw, Integer orderproblemid,
			Integer UpdateOrderFormID, Integer nowMotorcadeID, String UserID,
			String describe, Map map, Integer FUserID) {

		JsonReturn jsonReturn = new JsonReturn();
		OrderproblemVo orderProblem = null;
		if (orderproblemid > 0 && UpdateOrderFormID > 0 && nowMotorcadeID > 0
				&& Tools.isNotNull(UserID) && Tools.isNotNull(describe)
				&& FUserID > 0) {
			map.put("orderformid", UpdateOrderFormID);
			orderProblem = iOrderproblemService.findByProbleSQL(map);
			if (orderProblem != null) {
				map.clear();
				map.put("MotorcadeID", nowMotorcadeID);
				map.put("UserID", UserID);
				Teammembers teammembers = iTeammembersService.findBySQL(map);
				if (teammembers != null) {
					ProcuratoryVo procuratoryVo = iProcuratoryService
							.findByOrderformID(UpdateOrderFormID);
					Procuratory procuratory = iProcuratoryService
							.selectByPrimaryKey(procuratoryVo
									.getProcuratoryid());
					procuratory
							.setTeammembersid(teammembers.getTeammembersid());
					int r = iProcuratoryService.updateByPrimaryKey(procuratory);
					if (r > 0) {

						Car car = iCarService.findByUserID(FUserID);
						if (car != null) {

							car.setStatusid(1);
							int k = iCarService.updateByPrimaryKey(car);
							if (k > 0) {
								car = iCarService.findByUserID(Integer
										.valueOf(UserID));
								car.setStatusid(4);
								int j = iCarService.updateByPrimaryKey(car);
								if (j > 0) {
									orderProblem.setIssolve(true);
									orderProblem.setNowuserid(Integer
											.valueOf(UserID));
									orderProblem.setReason("订单问题："
											+ orderProblem.getReason()
											+ ";订单解决办法：" + describe);

									Logisticstracking logisticsTracking = new Logisticstracking();
									logisticsTracking
											.setOrderformid(orderproblemid);
									logisticsTracking
											.setSpecificinformation("我们处理好了，已经开始运输了！！");
									logisticsTracking
											.setUploadlogisticstime(GetTimeUtil
													.changeStrToTime(GetTimeUtil
															.getNowTime()));

									int b = iLogisticsTrackingService
											.insert(logisticsTracking);
									int logisID = logisticsTracking
											.getLogisticstrackingid();
									if (b > 0) {

										int bol = iOrderproblemService
												.updateByPrimaryKey(orderProblem);
										if (bol > 0) {
											jsonReturn.setMsg("处理成功！！");
											jsonReturn.setState(true);
										} else {
											jsonReturn.setMsg("处理失败！！");
											jsonReturn.setState(false);
											iLogisticsTrackingService
													.deleteByPrimaryKey(logisID);
										}
									} else {
										jsonReturn.setMsg("处理失败！！");
										jsonReturn.setState(false);
									}
								} else {
									jsonReturn.setMsg("失败！！");
									jsonReturn.setState(false);
								}
							} else {
								jsonReturn.setMsg("失败！！");
								jsonReturn.setState(false);
							}
						} else {
							jsonReturn.setMsg("失败！！");
							jsonReturn.setState(false);
						}
					} else {
						jsonReturn.setMsg("失败！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("失败！！");
					jsonReturn.setState(false);
				}
			} else {
				jsonReturn.setMsg("失败！！");
				jsonReturn.setState(false);
			}
		} else {
			map.put("orderformid", UpdateOrderFormID);
			orderProblem = iOrderproblemService.findByProbleSQL(map);
			orderProblem.setIssolve(true);

			orderProblem.setReason("订单问题：" + orderProblem.getReason()
					+ ";订单解决办法：" + describe);

			Logisticstracking logisticsTracking = new Logisticstracking();
			logisticsTracking.setOrderformid(orderproblemid);
			logisticsTracking.setSpecificinformation("我们处理好了，已经开始运输了！！");
			logisticsTracking.setUploadlogisticstime(GetTimeUtil
					.changeStrToTime(GetTimeUtil.getNowTime()));
			int b = iLogisticsTrackingService.insert(logisticsTracking);
			int logisID = logisticsTracking.getLogisticstrackingid();
			if (b > 0) {

				int bol = iOrderproblemService.updateByPrimaryKey(orderProblem);
				if (bol > 0) {
					jsonReturn.setMsg("处理成功！！");
					jsonReturn.setState(true);
				} else {
					jsonReturn.setMsg("处理失败！！");
					jsonReturn.setState(false);
					iLogisticsTrackingService.deleteByPrimaryKey(logisID);
				}
			}
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);

	}

	/**
	 * 审批作废
	 * 
	 * @param pw
	 * @param map
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	@RequestMapping("/approvalCancel")
	private void approvalCancel(PrintWriter pw,
			@SuppressWarnings("rawtypes") Map map, Integer orderFormID) {
		JsonReturn jsonReturn = new JsonReturn();
		if (orderFormID > 0) {
			map.put("orderformid", orderFormID);
			List<Cancel> list = iCancelService.findCancelBySQL(map);
			if (list.size() > 0 && list.size() == 1) {
				System.out.println(list.get(0).getIsaudit());
				if (list.get(0).getIsaudit() == false) {

					Orderform orderform = iOrderformService
							.selectByPrimaryKey(orderFormID);
					if (orderform != null) {
						orderform.setIscancel(true);
						orderform.setStatusid(19);
						int r = iOrderformService.updateByPrimaryKey(orderform);
						if (r > 0) {

							Cancel cancel = list.get(0);
							cancel.setAuditcanceltime(GetTimeUtil
									.changeStrToTime(GetTimeUtil.getNowTime()));
							cancel.setIsaudit(true);
							cancel.setOperatorid(user.getUserid());
							int i = iCancelService.updateByPrimaryKey(cancel);
							if (i > 0) {
								orderform.setStatusid(18);
								jsonReturn.setMsg("作废成功！！");
								jsonReturn.setState(true);
							} else {
								jsonReturn.setMsg("作废失败！！");
								jsonReturn.setState(false);
								orderform.setIscancel(false);
								iOrderformService.updateByPrimaryKey(orderform);
							}
						} else {
							jsonReturn.setMsg("作废失败！！");
							jsonReturn.setState(false);
						}
					} else {
						jsonReturn.setMsg("没有此订单！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("已经作废！！");
					jsonReturn.setState(false);
				}
			} else {
				jsonReturn.setMsg("此订单没有申请作废！！");
				jsonReturn.setState(false);
			}

		} else {
			jsonReturn.setMsg("请刷新界面！！");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

}
