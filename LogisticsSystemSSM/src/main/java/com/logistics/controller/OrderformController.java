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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Car;
import com.logistics.po.Logisticstracking;
import com.logistics.po.Mrchandise;
import com.logistics.po.Mrchandisetype;
import com.logistics.po.Orderform;
import com.logistics.po.Orderformdetail;
import com.logistics.po.Orderproblem;
import com.logistics.po.Payment;
import com.logistics.po.Receivables;
import com.logistics.po.Transportmode;
import com.logistics.po.User;
import com.logistics.service.IBillingmethodService;
import com.logistics.service.ICarService;
import com.logistics.service.ILogisticsTrackingService;
import com.logistics.service.IMrchandiseService;
import com.logistics.service.IMrchandisetypeService;
import com.logistics.service.IOrderformService;
import com.logistics.service.IOrderformdetailService;
import com.logistics.service.IOrderproblemService;
import com.logistics.service.IPaymentService;
import com.logistics.service.IReceivablesService;
import com.logistics.service.ITransportModeService;
import com.logistics.service.IUserService;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.FormListObjectUtil;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.JudgingStringSimilarityUtil;
import com.logistics.util.RMessage;
import com.logistics.util.Tools;
import com.logistics.vo.OrderformDetailVo;
import com.logistics.vo.OrderformVo;

@Controller
@RequestMapping("/OrderformController")
public class OrderformController {
	@Autowired
	IMrchandisetypeService iMrchandisetypeService;
	@Autowired
	IPaymentService iPaymentService;
	@Autowired
	IBillingmethodService ibillingmethodService;
	@Autowired
	ITransportModeService iTransportModeService;
	@Autowired
	IOrderformService iOrderformService;
	@Autowired
	ILogisticsTrackingService iLogisticsTrackingService;
	@Autowired
	ICarService iCarService;
	@Autowired
	IMrchandiseService iMrchaandiseService;
	@Autowired
	IOrderformdetailService iOrderformdetailService;
	@Autowired
	IReceivablesService iReceivablesService;
	@Autowired
	IOrderproblemService iOrderproblemService;
	@Autowired
	IUserService iUserService;
	User user = null;

	@RequestMapping("/orderForm")
	public ModelAndView orderForm(HttpSession session) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {

			mv = new ModelAndView("OrderForm");

			List<Mrchandisetype> MRlist = iMrchandisetypeService.findAll();

			List<Payment> Pylist = iPaymentService.findAll();

			// List<Billingmethod> billlist = ibillingmethodService.findAll();

			List<Transportmode> Tplllist = iTransportModeService.findAll();

			mv.addObject("user", user);
			mv.addObject("MRlist", MRlist);
			mv.addObject("Pylist", Pylist);
			// mv.addObject("billlist", billlist);
			mv.addObject("Tplllist", Tplllist);

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	/**
	 * 查询订单
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	@ResponseBody
	protected DatatablesViewPage<OrderformVo> getList(Integer length,
			Integer start, Integer JieShou, Integer WanCheng,
			@SuppressWarnings("rawtypes") Map map, String condition,
			String startTime, String endTime, HttpSession session) {
		map.clear();
		user = (User) session.getAttribute("USERINFO");

		if (user != null) {
			if (user.getInstitutionalorganizationid() == 3) {
				map.put("userid", user.getUserid());
			}

			if (Tools.isNotNull(String.valueOf(WanCheng))) {

				if (WanCheng >= 0) {
					map.put("isfinish", WanCheng);
				}
			}
			if (Tools.isNotNull(String.valueOf(JieShou))) {

				if (9 == JieShou) {
					map.put("StatusID", 9);
				} else if (10 == JieShou) {
					map.put("statusid", 10);

				}
			}
			if (Tools.isNotNull(startTime)) {
				map.put("startTime", startTime);
			}
			if (Tools.isNotNull(endTime)) {
				map.put("endTime", endTime);
			}
			if (Tools.isNotNull(condition)) {

				map.put("vague", condition);
			}
			DatatablesViewPage<OrderformVo> view = new DatatablesViewPage<OrderformVo>();
			if (length >= 0 && start >= 0) {

				map.put("startIndex", start);
				map.put("pageSize", length);
				List<OrderformVo> list = iOrderformService.findPage(map);

				int totalRows = iOrderformService.getTotalRow(map);

				view.setiTotalDisplayRecords(totalRows);
				view.setiTotalRecords(totalRows);

				view.setAaData(list);
				return view;
			} else {
				return null;
			}

		}
		return null;
	}

	/**
	 * 接货
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/pickUpGoods")
	protected void pickUpGoods(String orderFormID, PrintWriter pw,
			@SuppressWarnings("rawtypes") Map map) {
		JsonReturn jsonReturn = new JsonReturn();
		Orderform orderForm = iOrderformService.selectByPrimaryKey(Integer
				.valueOf(orderFormID));
		if (orderForm.getIsfinish() == false) {
			try {
				map.clear();
				if (Tools.isNotNull(orderFormID)) {
					map.put("orderformid", orderFormID);
					map.put("specificinformation", "司机已经出发，请耐心等待！！");
					List<Logisticstracking> list = iLogisticsTrackingService
							.findLogBySQL(map);
					if (list.size() == 0) {
						Car car = iCarService.findByUserID(user.getUserid());

						if (car != null) {
							if (orderForm.getIsauditing() == false) {
								if (orderForm.getStarttime() == null) {

									if (orderForm.getReceipttime() == null) {
										if (orderForm.getStatusid() == 9) {
											Logisticstracking logisticsTracking = new Logisticstracking();
											logisticsTracking
													.setOrderformid(Integer
															.valueOf(orderFormID));
											logisticsTracking
													.setSpecificinformation("司机已经出发，请耐心等待！！");
											logisticsTracking
													.setUploadlogisticstime(GetTimeUtil
															.changeStrToTime(GetTimeUtil
																	.getNowTime()));
											orderForm.setStatusid(5);

											if (car.getStatusid() == 1) {

												car.setStatusid(11);
												int b1 = iCarService
														.updateByPrimaryKey(car);
												if (b1 > 0) {

													int bol = iOrderformService
															.updateByPrimaryKey(orderForm);
													if (bol > 0) {

														int b = iLogisticsTrackingService
																.insert(logisticsTracking);
														if (b > 0) {
															jsonReturn
																	.setMsg("成功");
															jsonReturn
																	.setState(true);
														} else {
															jsonReturn
																	.setMsg("失败");
															jsonReturn
																	.setState(false);
														}

													} else {
														jsonReturn.setMsg("失败");
														jsonReturn
																.setState(false);
													}
												} else {
													jsonReturn.setMsg("失败");
													jsonReturn.setState(false);
												}

											} else {
												jsonReturn.setMsg("已经开始接货！");
												jsonReturn.setState(true);
											}
										} else {
											if (orderForm.getStatusid() == 5) {
												jsonReturn.setMsg("已经开始接货！！！");
												jsonReturn.setState(false);
											} else if (orderForm.getStatusid() == 4) {
												jsonReturn.setMsg("已经开始运输了！！！");
												jsonReturn.setState(false);
											} else if (orderForm.getStatusid() == 12) {
												jsonReturn.setMsg("此订单已完成！！！");
												jsonReturn.setState(false);
											}
										}
									} else {
										jsonReturn.setMsg("已经收货了，不用接货了！");
										jsonReturn.setState(false);
									}

								} else {
									jsonReturn.setMsg("已经开始运输！！");
									jsonReturn.setState(false);
								}
							} else {
								jsonReturn.setMsg("已经审核，不用再次接货了！");
								jsonReturn.setState(false);
							}
						} else {
							jsonReturn.setMsg("您现在没有车辆可以使用！！");
							jsonReturn.setState(false);
						}
					} else {
						if (orderForm.getStatusid() == 4) {
							jsonReturn.setMsg("已经开始运输了！！！！");
							jsonReturn.setState(false);
						} else if (orderForm.getStatusid() == 9) {
							jsonReturn.setMsg("开始接货！！！");
							jsonReturn.setState(true);
						} else {
							jsonReturn.setMsg("还没有接受此订单！！！");
							jsonReturn.setState(false);
						}

					}
				} else {
					jsonReturn.setMsg("请选择一条数据！！");
					jsonReturn.setState(false);
				}
			} catch (Exception e) {

				jsonReturn.setMsg("失败");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("此订单已完成！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 查询订单物品
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/getMerchandise")
	protected void getMerchandise(PrintWriter pw, String OrderFormID,
			Map<String, String> map) {

		map.put("orderformid", OrderFormID);

		List<OrderformDetailVo> Mrchlist = iOrderformdetailService
				.findBySQL(map);

		RMessage.returnMessage(pw, null, Mrchlist, null);
	}

	/**
	 * 修改订单
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("/updateOrderForm")
	protected void updateOrderForm(Orderform newOrderform, PrintWriter pw,
			FormListObjectUtil list) {

		JsonReturn jsonReturn = new JsonReturn();
		try {

			if (Tools.isNotNull(newOrderform.getSendname())
					&& Tools.isNotNull(newOrderform.getSendadress())
					&& Tools.isNotNull(newOrderform.getSendname())
					&& Tools.isNotNull(newOrderform.getSendphonenumber())
					&& Tools.isNotNull(newOrderform.getTakeadress())
					&& Tools.isNotNull(newOrderform.getTakename())
					&& Tools.isNotNull(newOrderform.getTakephonenumber())
					&& newOrderform.getPaymentid() > 0
					&& newOrderform.getTransportcost() > 0
					&& newOrderform.getTransportmodeid() > 0
					&& newOrderform.getOrderformid() > 0) {

				Orderform orderForm = iOrderformService
						.selectByPrimaryKey(Integer.valueOf(newOrderform
								.getOrderformid()));
				int count = 0;
				if (orderForm != null) {
					if (orderForm.getIsfinish() == false) {
						if (orderForm.getStarttime() == null) {
							if (orderForm.getIsindeedupload() == false) {
								if (orderForm.getIsauditing() == false) {
									if (list.getMrchlist().size() > 0
											&& list.getOrderformdetaillist()
													.size() > 0) {
										if (list.getMrchlist().size() == list
												.getOrderformdetaillist()
												.size()) {
											for (int i = 0; i < list
													.getMrchlist().size(); i++) {
												if (!Tools.isNotNull(list
														.getMrchlist().get(i)
														.getMrchandisename())) {
													list.getMrchlist()
															.remove(i);
													list.getOrderformdetaillist()
															.remove(i);
													i--;
												}

											}
											if (list.getMrchlist().size() > 0
													&& list.getOrderformdetaillist()
															.size() > 0) {

												Mrchandise mrchandise = null;
												int Mrchandiseid = 0;
												for (int i = 0; i < list
														.getMrchlist().size(); i++) {
													if (Tools
															.isNotNull(list
																	.getMrchlist()
																	.get(i)
																	.getMrchandisename())
															&& list.getMrchlist()
																	.get(i)
																	.getMrchandisetypeid() > 0
															&& list.getOrderformdetaillist()
																	.get(i)
																	.getQuantity() > 0
															&& list.getOrderformdetaillist()
																	.get(i)
																	.getVolume() > 0
															&& list.getOrderformdetaillist()
																	.get(i)
																	.getWeight() > 0) {

														if (list.getOrderformdetaillist()
																.get(i)
																.getOrderformdetailid() != null
																&& list.getOrderformdetaillist()
																		.get(i)
																		.getOrderformdetailid() > 0) {

															mrchandise = iMrchaandiseService
																	.selectByPrimaryKey(list
																			.getMrchlist()
																			.get(i)
																			.getMrchandiseid());
															if (mrchandise != null) {
																mrchandise
																		.setMrchandisename(list
																				.getMrchlist()
																				.get(i)
																				.getMrchandisename());

																mrchandise
																		.setMrchandisetypeid(list
																				.getMrchlist()
																				.get(i)
																				.getMrchandisetypeid());
																int b = iMrchaandiseService
																		.updateByPrimaryKey(mrchandise);

																if (b > 0) {

																	Orderformdetail orderformdetail = iOrderformdetailService
																			.selectByPrimaryKey(list
																					.getOrderformdetaillist()
																					.get(i)
																					.getOrderformdetailid());

																	if (orderformdetail != null) {
																		orderformdetail
																				.setQuantity(list
																						.getOrderformdetaillist()
																						.get(i)
																						.getQuantity());
																		orderformdetail
																				.setVolume(list
																						.getOrderformdetaillist()
																						.get(i)
																						.getVolume());
																		orderformdetail
																				.setWeight(list
																						.getOrderformdetaillist()
																						.get(i)
																						.getWeight());
																		int r = iOrderformdetailService
																				.updateByPrimaryKey(orderformdetail);
																		if (r > 0) {
																			count++;
																		}

																	}

																}
															}

														} else {
															mrchandise = new Mrchandise();
															mrchandise
																	.setMrchandisename(list
																			.getMrchlist()
																			.get(i)
																			.getMrchandisename());

															mrchandise
																	.setMrchandisetypeid(list
																			.getMrchlist()
																			.get(i)
																			.getMrchandisetypeid());
															Mrchandiseid = iMrchaandiseService
																	.insertReturnID(mrchandise);
															if (Mrchandiseid > 0) {
																Orderformdetail orderformdetail = new Orderformdetail();
																orderformdetail
																		.setMrchandiseid(mrchandise
																				.getMrchandiseid());
																orderformdetail
																		.setOrderformid(Integer
																				.valueOf(newOrderform
																						.getOrderformid()));

																orderformdetail
																		.setQuantity(list
																				.getOrderformdetaillist()
																				.get(i)
																				.getQuantity());
																orderformdetail
																		.setVolume(list
																				.getOrderformdetaillist()
																				.get(i)
																				.getVolume());
																orderformdetail
																		.setWeight(list
																				.getOrderformdetaillist()
																				.get(i)
																				.getWeight());
																int r = iOrderformdetailService
																		.insertSelective(orderformdetail);
																if (r > 0) {
																	count++;
																}
															}

														}

													} else {
														jsonReturn
																.setMsg("物品名称、数量、体积以及重量不能为空！！！！");
														jsonReturn
																.setState(false);
													}
												}
											} else {
												jsonReturn.setMsg("至少有一个货物！！！");
												jsonReturn.setState(false);
											}
											if (count == list.getMrchlist()
													.size()) {

												orderForm
														.setPaymentid(newOrderform
																.getPaymentid());
												orderForm
														.setTransportmodeid(newOrderform
																.getTransportmodeid());
												// orderForm
												// .setBillingmethodid(newOrderform
												// .getBillingmethodid());
												orderForm
														.setTransportcost(newOrderform
																.getTransportcost());
												orderForm
														.setRemark(newOrderform
																.getRemark());
												orderForm
														.setTakeadress(newOrderform
																.getTakeadress());
												orderForm
														.setTakename(newOrderform
																.getTakename());
												orderForm
														.setTakephonenumber(newOrderform
																.getTakephonenumber());
												orderForm
														.setIsindeedupload(true);
												orderForm.setIscancel(false);
												int k = iOrderformService
														.updateByPrimaryKey(orderForm);
												if (k > 0) {
													jsonReturn.setMsg("成功！！！！");
													jsonReturn.setState(true);
												} else {
													jsonReturn.setMsg("失败");
													jsonReturn.setState(false);
												}

											} else {
												jsonReturn.setMsg("失败");
												jsonReturn.setState(false);
											}

										} else {
											jsonReturn.setMsg("数据不对应，请检查！！！！");
											jsonReturn.setState(false);
										}
									} else {
										jsonReturn.setMsg("数据不完整，请填写完整！！！！");
										jsonReturn.setState(false);
									}
								} else {
									jsonReturn.setMsg("已经审核，不用再次上传了！！");
									jsonReturn.setState(false);
								}
							} else {
								jsonReturn.setMsg("此订单已上传，不用再次上传了！");
								jsonReturn.setState(false);
							}
						} else {
							jsonReturn.setMsg("此订单已经开始运输了，不用再次上传了！！");
							jsonReturn.setState(false);
						}
					} else {
						jsonReturn.setMsg("此订单已完成，不用再次上传了！");
						jsonReturn.setState(false);
					}

				} else {
					jsonReturn.setMsg("没有此订单！！！");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("请填写完整数据！！！");
				jsonReturn.setState(false);

			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonReturn.setMsg("出错啦！！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 模拟收钱
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/money")
	protected void money(PrintWriter pw, int orderFormID, Map map) {
		JsonReturn jsonReturn = new JsonReturn();

		if (orderFormID > 0) {
			Orderform orderForm = iOrderformService
					.selectByPrimaryKey(orderFormID);
			if (orderForm.getIsfinish() == false) {
				if (orderForm.getIsauditing() == true) {
					map.put("orderformid", orderFormID);
					List<Receivables> list = iReceivablesService
							.findAllSQL(map);
					// orderForm.setStatusid(4);
					int b = iOrderformService.updateByPrimaryKey(orderForm);
					if (b > 0) {
						if (list.size() == 0) {
							Receivables receivables = new Receivables();
							if (orderForm.getPaymentid() == 1) {
								receivables.setMoney(orderForm
										.getBargainmoney());
								receivables.setReceivablescontent("定金付款："
										+ orderForm.getBargainmoney());
								receivables.setPaymenttypeid(2);
							} else {
								receivables.setMoney(orderForm
										.getTransportcost());
								receivables.setReceivablescontent("运输费用付款："
										+ orderForm.getTransportcost());
								receivables.setPaymenttypeid(1);
							}
							receivables.setOrderformid(orderFormID);

							receivables.setReceivablestime(GetTimeUtil
									.changeStrToTime(GetTimeUtil.getNowTime()));

							int b1 = iReceivablesService.insert(receivables);
							if (b1 > 0) {
								jsonReturn.setMsg("收款成功！！");
								jsonReturn.setState(true);
							} else {
								jsonReturn.setMsg("收款失败！！");
								jsonReturn.setState(false);
							}
						} else {
							jsonReturn.setMsg("已经交款！！");
							jsonReturn.setState(false);

						}
					} else {
						jsonReturn.setMsg("收款失败！！");
						jsonReturn.setState(false);

					}
				} else {
					jsonReturn.setMsg("还没有审核，不可以收款！！！");
					jsonReturn.setState(false);
				}
			} else {

				jsonReturn.setMsg("此订单已完成，不用再次收款了！！");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("请选择一条订单！！");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);

	}

	/**
	 * 开始运送货物
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/updateProcuratory")
	protected void updateProcuratory(int orderFormID, Map map, PrintWriter pw) {
		JsonReturn jsonReturn = new JsonReturn();

		if (orderFormID > 0) {
			map.put("orderformid", orderFormID);
			Orderform orderForm = iOrderformService
					.selectByPrimaryKey((orderFormID));
			if (orderForm != null) {
				if (orderForm.getIscancel() == false) {
					List<Receivables> list = iReceivablesService
							.findAllSQL(map);
					if (orderForm.getIsfinish() == false) {

						if (list.size() > 0) {
							if (orderForm.getReceipttime() == null) {
								if (orderForm.getAudittime() != null) {
									if (orderForm.getStarttime() == null) {

										orderForm.setDeliverytime(GetTimeUtil
												.changeStrToTime(GetTimeUtil
														.getNowTime()));

										orderForm.setStarttime(GetTimeUtil
												.changeStrToTime(GetTimeUtil
														.getNowTime()));
										orderForm.setStatusid(4);

										int bol = iOrderformService
												.updateByPrimaryKey(orderForm);

										if (bol > 0) {
											jsonReturn.setMsg("成功");
											jsonReturn.setState(true);
										} else {
											jsonReturn.setMsg("失败");
											jsonReturn.setState(false);
										}

									} else {
										jsonReturn.setMsg("成功");
										jsonReturn.setState(true);
									}
								} else {
									jsonReturn.setMsg("还没有审核，不可以运输！！");
									jsonReturn.setState(false);
								}
							} else {
								jsonReturn.setMsg("已经收货了，不用再次运输了！！");
								jsonReturn.setState(false);
							}
						} else {
							jsonReturn.setMsg("还没有交款，不可以进行运送！！");
							jsonReturn.setState(false);
						}
					} else {
						jsonReturn.setMsg("已经完成，不用再次运输货物了！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("此订单已作废！！");
					jsonReturn.setState(false);
				}

			} else {
				jsonReturn.setMsg("没有此数据！！");
				jsonReturn.setState(false);
			}

		} else {
			jsonReturn.setMsg("请选择订单！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 订单问题处理
	 * 
	 * @param DingDanID
	 * @param pw
	 * @param question
	 * @param Location
	 */
	@RequestMapping("/question")
	protected void question(int DingDanID, PrintWriter pw, String question,
			String Location) {
		JsonReturn jsonReturn = new JsonReturn();

		if (DingDanID > 0 && Tools.isNotNull(question)) {

			if (Tools.isNotNull(Location) && Location.indexOf("u") == -1) {
				Orderform orderForm = iOrderformService
						.selectByPrimaryKey(DingDanID);
				if (orderForm.getIsfinish() == false) {
					if (orderForm.getIscancel() == false) {

						if (orderForm.getStatusid() > 3
								&& orderForm.getStatusid() < 6) {

							Orderproblem problem = new Orderproblem();
							problem.setFormerlyuserid(user.getUserid());
							problem.setOrderformid(DingDanID);
							problem.setReason(question);
							problem.setIssolve(false);
							problem.setRegistrationtime(GetTimeUtil
									.changeStrToTime(GetTimeUtil.getNowTime()));
							problem.setOrderformlocation(Location);
							problem.setIssolve(false);

							Logisticstracking logisticsTracking = new Logisticstracking();
							logisticsTracking.setOrderformid(DingDanID);
							logisticsTracking
									.setSpecificinformation("运输期间出现一些问题，我们会派人去解决，请不要担心，到达目的地后，请检查货物！！");
							logisticsTracking
									.setUploadlogisticstime(GetTimeUtil
											.changeStrToTime(GetTimeUtil
													.getNowTime()));
							int b = iLogisticsTrackingService
									.insert(logisticsTracking);
							if (b > 0) {

								orderForm.setIsproblem(true);
								int b1 = iOrderformService
										.updateByPrimaryKey(orderForm);
								if (b1 > 0) {

									int bol = iOrderproblemService
											.insert(problem);
									if (bol > 0) {

										jsonReturn.setMsg("已经提交，请等待审核！！");
										jsonReturn.setState(true);
									} else {
										jsonReturn.setMsg("提交失败！！");
										jsonReturn.setState(false);
									}
								} else {
									jsonReturn.setMsg("提交失败！！");
									jsonReturn.setState(false);
								}
							} else {
								jsonReturn.setMsg("提交失败！！");
								jsonReturn.setState(false);
							}
						} else {
							jsonReturn.setMsg("订单问题只能在运输过程中才可以处理！");
							jsonReturn.setState(false);
						}
					} else {
						jsonReturn.setMsg("此订单已作废！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("此订单已完成！！");
					jsonReturn.setState(false);
				}
			} else {
				jsonReturn.setMsg("位置错误，请刷新位置");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("请填写订单问题！！");
			jsonReturn.setState(false);
		}

		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 完成订单
	 * 
	 * @param orderFormID
	 * @param pw
	 */
	@RequestMapping("/finishOrderForm")
	protected void finishOrderForm(int orderFormID, PrintWriter pw,
			String nowAdress) {
		JsonReturn jsonReturn = new JsonReturn();

		if (orderFormID > 0) {
			if (Tools.isNotNull(nowAdress)) {

				Orderform orderForm = iOrderformService
						.selectByPrimaryKey(orderFormID);
				if (orderForm != null) {
					if (orderForm.getIsfinish() == false) {
						if (JudgingStringSimilarityUtil.udgingStringSimilar(
								nowAdress, orderForm.getTakeadress())
								|| JudgingStringSimilarityUtil
										.udgingStringSimilar(nowAdress,
												orderForm.getSendadress())) {

							if (orderForm.getStatusid() == 4) {

								if (orderForm.getDeliverytime() != null) {
									if (orderForm.getReceipttime() != null) {

										orderForm.setReceipttime(GetTimeUtil
												.changeStrToTime(GetTimeUtil
														.getNowTime()));
										Logisticstracking logisticsTracking = new Logisticstracking();
										logisticsTracking
												.setOrderformid(orderFormID);
										logisticsTracking
												.setSpecificinformation("您已经签收成功，谢谢您的光临！！");
										logisticsTracking
												.setUploadlogisticstime(GetTimeUtil
														.changeStrToTime(GetTimeUtil
																.getNowTime()));
										int bo = iLogisticsTrackingService
												.insert(logisticsTracking);
										if (bo > 0) {

											if (orderForm.getStarttime() != null) {
												orderForm.setIsfinish(true);
												orderForm
														.setFinishtime(GetTimeUtil
																.changeStrToTime(GetTimeUtil
																		.getNowTime()));
												orderForm.setStatusid(12);
												Car car = iCarService
														.findByUserID(user
																.getUserid());

												if (car != null) {

													car.setStatusid(1);
													int b1 = iCarService
															.updateByPrimaryKey(car);
													if (b1 > 0) {

														int b = iOrderformService
																.updateByPrimaryKey(orderForm);
														if (b > 0) {
															jsonReturn
																	.setMsg("成功！！");
															jsonReturn
																	.setState(true);
														} else {
															jsonReturn
																	.setMsg("失败！！");
															jsonReturn
																	.setState(false);
														}
													} else {
														jsonReturn
																.setMsg("失败！！");
														jsonReturn
																.setState(false);
													}
												} else {

													jsonReturn.setMsg("失败！！");
													jsonReturn.setState(false);
												}
											} else {
												jsonReturn
														.setMsg("还没有开始，怎么能完成！！");
												jsonReturn.setState(false);
											}

										} else {
											jsonReturn.setMsg("失败！！");
											jsonReturn.setState(false);
										}

									} else {
										jsonReturn
												.setMsg("顾客还没有收货，不可以完成订单！！！！");
										jsonReturn.setState(false);
									}
								} else {
									jsonReturn.setMsg("还没有开始运输，怎么能收货！！");
									jsonReturn.setState(false);
								}
							} else {
								if (orderForm.getStatusid() == 19) {
									orderForm.setReceipttime(GetTimeUtil
											.changeStrToTime(GetTimeUtil
													.getNowTime()));
									Logisticstracking logisticsTracking = new Logisticstracking();
									logisticsTracking
											.setOrderformid(orderFormID);
									logisticsTracking
											.setSpecificinformation("由于您退货，货物已经送回给您了！！");
									logisticsTracking
											.setUploadlogisticstime(GetTimeUtil
													.changeStrToTime(GetTimeUtil
															.getNowTime()));
									int bo = iLogisticsTrackingService
											.insert(logisticsTracking);
									if (bo > 0) {

										if (orderForm.getStarttime() != null) {
											orderForm.setIsfinish(true);
											orderForm
													.setFinishtime(GetTimeUtil
															.changeStrToTime(GetTimeUtil
																	.getNowTime()));
											orderForm.setStatusid(12);
											Car car = iCarService
													.findByUserID(user
															.getUserid());

											if (car != null) {

												car.setStatusid(1);
												int b1 = iCarService
														.updateByPrimaryKey(car);

												if (b1 > 0) {

													int b = iOrderformService
															.updateByPrimaryKey(orderForm);
													if (b > 0) {
														jsonReturn
																.setMsg("成功！！");
														jsonReturn
																.setState(true);
													} else {
														jsonReturn
																.setMsg("失败！！");
														jsonReturn
																.setState(false);
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
											jsonReturn.setMsg("还没有开始，怎么能完成！！");
											jsonReturn.setState(false);
										}

									} else {
										jsonReturn.setMsg("失败！！");
										jsonReturn.setState(false);
									}
								} else {
									jsonReturn.setMsg("只能在运输之后才可以收货！！");
									jsonReturn.setState(false);
								}

							}
						} else {
							jsonReturn.setMsg("还没有到达指定位置，不可以完成订单！！");
							jsonReturn.setState(false);
						}

					} else {
						jsonReturn.setMsg("已经完成了，不用再次收货了！！");
						jsonReturn.setState(false);
					}

				} else {
					jsonReturn.setMsg("没有此数据！！");
					jsonReturn.setState(false);
				}
			} else {
				jsonReturn.setMsg("您所在的地区网络有问题，请刷新界面！！");
				jsonReturn.setState(false);
			}
		} else {
			jsonReturn.setMsg("请选择一条数据！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}
}
