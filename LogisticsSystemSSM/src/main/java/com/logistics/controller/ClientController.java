package com.logistics.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Cancel;
import com.logistics.po.City;
import com.logistics.po.Custom;
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
import com.logistics.po.Usertypedetail;
import com.logistics.service.ICancelService;
import com.logistics.service.ICityService;
import com.logistics.service.ICustomService;
import com.logistics.service.IDotService;
import com.logistics.service.ILogisticsTrackingService;
import com.logistics.service.IMrchandiseService;
import com.logistics.service.IMrchandisetypeService;
import com.logistics.service.IOrderformService;
import com.logistics.service.IOrderformdetailService;
import com.logistics.service.IOrderproblemService;
import com.logistics.service.IPaymentService;
import com.logistics.service.IReceivablesService;
import com.logistics.service.IRouteService;
import com.logistics.service.ITransportModeService;
import com.logistics.service.IUserService;
import com.logistics.service.IUsertypedetailService;
import com.logistics.util.Bsgrid;
import com.logistics.util.ChangeUtil;
import com.logistics.util.CookieUtil;
import com.logistics.util.FormListObjectUtil;
import com.logistics.util.GetTimeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.MD5Util;
import com.logistics.util.RMessage;
import com.logistics.util.ReadFileUtil;
import com.logistics.util.Tools;
import com.logistics.util.ValidateIDCardPhotoUtil;
import com.logistics.vo.CancelVo;
import com.logistics.vo.CustomVo;
import com.logistics.vo.DotVo;
import com.logistics.vo.OrderformDetailVo;
import com.logistics.vo.OrderformVo;
import com.logistics.vo.RouteVo;
import com.logistics.vo.UserVo;

@Controller
@RequestMapping("/ClientController")
public class ClientController {
    @Autowired
    IDotService iDotService;

    @Autowired
    ICityService iCityService;
    @Autowired
    IRouteService iRouteService;
    @Autowired
    ICustomService iCustomService;
    @Autowired
    IMrchandisetypeService iMrchandisetypeService;
    @Autowired
    IOrderformdetailService iOrderformdetailService;
    @Autowired
    IOrderformService iOrderformService;
    @Autowired
    IMrchandiseService iMrchandiseService;
    @Autowired
    ICancelService iCancelService;
    @Autowired
    ILogisticsTrackingService iLogisticsTrackingService;
    @Autowired
    IUserService iUserService;
    @Autowired
    IUsertypedetailService iUsertypedetailService;
    @Autowired
    IOrderproblemService iOrderproblemService;
    @Autowired
    IReceivablesService iReceivablesService;
    @Autowired
    IPaymentService iPaymentService;
    @Autowired
    ITransportModeService iTransportModeService;
    Custom custom = null;

    /**
     * 客户登录界面
     *
     * @param request
     * @return
     */
    @RequestMapping("/customlogin")
    public ModelAndView customlogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("../FrontJsp/CustomLogin");
        mv.addObject("PhoneNumber",
                CookieUtil.getCookie("CustomCOOKIEPHONE", request));
        mv.addObject("Password",
                CookieUtil.getCookie("CustomCOOKIEPASSWORD", request));
        mv.addObject("ISTrue",
                CookieUtil.getCookie("CustomCOOKIETRUE", request));

        return mv;
    }

    /**
     * 客户登录
     *
     * @param pw
     * @param PhoneNumber
     * @param Password
     * @param YanZhengMa
     * @param IsTrue
     * @param session
     * @param request
     * @param response
     */
    @RequestMapping("/checkLogin")
    public void checkLogin(PrintWriter pw, String PhoneNumber, String Password,
                           String YanZhengMa, String IsTrue, HttpSession session,
                           HttpServletRequest request, HttpServletResponse response) {
        JsonReturn jsonReturn = new JsonReturn();

        try {
            String identity = (String) ChangeUtil.sessionpotting("identity",
                    null, false, 0, session);
            if (Tools.isNotNull(YanZhengMa)
                    && identity.equalsIgnoreCase(YanZhengMa)) {

                Custom custom = iCustomService.login(PhoneNumber,
                        MD5Util.getMD5(Password));
                if (custom != null) {

                    ChangeUtil.sessionpotting("custom", custom, true, -1,
                            session);
                    this.custom = custom;
                    jsonReturn.setState(true);

                    jsonReturn.setMsg("登陆成功");
                    if (Tools.isNotNull(IsTrue) && IsTrue.equals("true")) {

                        CookieUtil.setCookie("CustomCOOKIEPHONE", PhoneNumber,
                                request, response, 24 * 60 * 60);
                        CookieUtil.setCookie("CustomCOOKIEPASSWORD", Password,
                                request, response, 24 * 60 * 60);
                        CookieUtil.setCookie("CustomCOOKIETRUE", IsTrue,
                                request, response, 24 * 60 * 60);

                    } else {
                        CookieUtil.destroyCookie("CustomCOOKIEPHONE", request,
                                response);
                        CookieUtil.destroyCookie("CustomCOOKIEPASSWORD",
                                request, response);
                        CookieUtil.destroyCookie("CustomCOOKIETRUE", request,
                                response);

                    }

                } else {
                    jsonReturn.setState(false);
                    jsonReturn.setMsg("密码或者用户名称错误");

                }
            } else {
                jsonReturn.setState(false);
                jsonReturn.setMsg("验证码不正确");

            }

        } catch (Exception e) {
            e.printStackTrace();
            jsonReturn.setState(false);
            jsonReturn.setMsg("参数不正确");
        }
        RMessage.returnMessage(pw, jsonReturn, null, null);

    }

    /**
     * 客户注销
     */
    @RequestMapping("/cancellation")
    public void cancellation(HttpSession session, PrintWriter pw) {
        Boolean b = false;
        try {
            ChangeUtil.destroySession(session, "custom");
            b = true;
        } catch (Exception e) {
            b = false;
        }
        pw.write(String.valueOf(b));
        pw.close();
    }

    /**
     * 查询网点
     *
     * @param pw
     * @param map
     * @param proName
     * @param cityName
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/selectDot")
    public void selectDot(PrintWriter pw,
                          @SuppressWarnings("rawtypes") Map map, String proName,
                          String cityName, Integer startIndex, Integer pageSize) {

        map.put("startIndex", startIndex);
        map.put("pageSize", pageSize);
        if (Tools.isNotNull(cityName)) {
            map.put("cityName", cityName);
        }
        if (Tools.isNotNull(proName)) {
            map.put("proName", proName);
        }

        List<DotVo> list = iDotService.findPage(map);

        RMessage.returnMessage(pw, null, list, null);

    }

    /**
     * 查询网点总数
     *
     * @param pw
     * @param map
     * @param proName
     * @param cityName
     * @param startIndex
     * @param pageSize
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/selectDotCount")
    public void selectDotCount(PrintWriter pw, Map map, String proName,
                               String cityName, Integer startIndex, Integer pageSize) {
        map.put("startIndex", startIndex);
        map.put("pageSize", pageSize);
        if (Tools.isNotNull(cityName)) {
            map.put("cityName", cityName);
        }
        if (Tools.isNotNull(proName)) {
            map.put("proName", proName);
        }

        int total = iDotService.getTotalRow(map);
        pw.write(total);
        pw.close();
    }

    /**
     * 按照城市查询网点
     *
     * @param pw
     * @param map
     * @param proName
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/selectCity")
    public void selectCity(PrintWriter pw, Map map, String proName) {
        map.put("proname", proName);
        List<City> list = iCityService.findAll(map);

        RMessage.returnMessage(pw, null, list, null);
    }

    /**
     * 查询线路
     *
     * @param pw
     * @param map
     * @param startIndex
     * @param pageSize
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/selectRoute")
    public void selectRoute(PrintWriter pw,
                            @SuppressWarnings("rawtypes") Map map, Integer startIndex,
                            Integer pageSize, String startName, String endName) {
        if (Tools.isNotNull(startName)) {

            map.put("startName",
                    ( startName.split("-")[2] ).equals("市辖区") ? startName
                            .split("-")[1] : startName.split("-")[2]);
        }
        if (Tools.isNotNull(endName)) {
            map.put("endName",
                    endName.split("-")[2].equals("市辖区") ? endName.split("-")[1]
                            : endName.split("-")[2]);
        }

        map.put("startIndex", startIndex);
        map.put("pageSize", pageSize);
        List<RouteVo> list = iRouteService.findPage(map);

        RMessage.returnMessage(pw, null, list, null);
    }

    /**
     * 查询路线总数
     *
     * @param pw
     * @param map
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/selectRouteConut")
    public void selectRouteConut(PrintWriter pw,
                                 @SuppressWarnings("rawtypes") Map map, String startName,
                                 String endName) {
        if (Tools.isNotNull(startName)) {
            map.put("startName",
                    ( startName.split("-")[2] ).equals("市辖区") ? startName
                            .split("-")[1] : startName.split("-")[2]);
        }
        if (Tools.isNotNull(endName)) {
            map.put("endName",
                    endName.split("-")[2].equals("市辖区") ? endName.split("-")[1]
                            : endName.split("-")[2]);
        }
        int total = iRouteService.getTatolRow(map);
        pw.write(String.valueOf(total));
        pw.close();
    }

    /**
     * 查询客户是否存在
     *
     * @param pw
     * @param CustomUserName
     * @param txtCode
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping("/selectCustom")
    public void selectCustom(PrintWriter pw, String phone, String txtCode,
                             Map map, HttpSession session) {
        map.put("CustomPhoneNumber", phone);

        String YanZhengMa = (String) ChangeUtil.sessionpotting("identity",
                null, false, 0, session);
        String b = "false";
        if (YanZhengMa.equalsIgnoreCase(txtCode)) {

            List<Custom> list = iCustomService.findCustomBySQL(map);
            if (list.size() > 0) {
                b = "true";
            }
        } else {
            b = "验证码错误！！";
        }
        pw.write(String.valueOf(b));
        pw.close();

    }

    /**
     * 发送手机验证码
     *
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/faSongYanZhengMa")
    protected void faSongYanZhengMa(String ShouJiNumber, HttpSession session,
                                    PrintWriter pw) {
        JsonReturn jsonReturn = new JsonReturn();

        if (Tools.isNotNull(ShouJiNumber)) {
            // SendMessage.smsg(ShouJiNumber);
            String ShouJiYanZhengMa = "12";
            if (Tools.isNotNull(ShouJiYanZhengMa)) {

                ChangeUtil.sessionpotting("PHCODE", ShouJiYanZhengMa, true,
                        2 * 60, session);
                jsonReturn.setMsg("发送成功！！");
                jsonReturn.setState(true);

            } else {
                jsonReturn.setMsg("发送失败！！");
                jsonReturn.setState(false);
            }

        } else {
            jsonReturn.setMsg("请刷新界面！！");
            jsonReturn.setState(false);
        }

        RMessage.returnMessage(pw, jsonReturn, null, null);
    }

    /**
     * 验证短信验证码
     *
     * @param pw
     * @param PhoneCode
     */

    @SuppressWarnings("unused")
    @RequestMapping("/verficationPhone")
    private void verficationPhone(PrintWriter pw, String PhoneCode,
                                  HttpSession session) {
        String YanZhenGMa = (String) ChangeUtil.sessionpotting("PHCODE", null,
                false, -1, session);
        String tip = "0";
        if (Tools.isNotNull(PhoneCode)) {
            if (YanZhenGMa.equals(PhoneCode)) {
                tip = "1";
            }
        }
        pw.write(tip);
        pw.close();
    }

    /**
     * 设置新密码
     *
     * @param pw
     * @param passWord
     * @param confirmPassword
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/setNewPassword")
    public void setNewPassword(PrintWriter pw, String password,
                               String confirmPassword, Map map, HttpSession session,
                               String phoneNumber) {
        JsonReturn jsonReturn = new JsonReturn();
        if (Tools.isNotNull(password) && Tools.isNotNull(confirmPassword)) {

            if (password.equals(confirmPassword)) {
                try {

                    map.put("CustomPhoneNumber", phoneNumber);
                    List<Custom> list = iCustomService.findCustomBySQL(map);
                    if (list.size() == 1) {
                        Custom custom = list.get(0);
                        custom.setCustompassword(MD5Util.getMD5(password));
                        int i = iCustomService.updateByPrimaryKey(custom);
                        if (i > 0) {
                            jsonReturn.setMsg("重置成功！！");
                            jsonReturn.setState(true);
                            ChangeUtil.destroySession(session, "PhoneHaoMa");
                        } else {
                            jsonReturn.setMsg("重置失败！！");
                            jsonReturn.setState(false);
                        }

                    } else {
                        jsonReturn.setMsg("手机号码重复了，请重新注册！！");
                        jsonReturn.setState(false);
                    }

                } catch (Exception e) {
                    jsonReturn.setMsg("请重新验证用户名！！");
                    jsonReturn.setState(false);
                }

            } else {
                jsonReturn.setMsg("两次密码不一致！！");
                jsonReturn.setState(false);
            }

        } else {
            jsonReturn.setMsg("密码不能为空！！");
            jsonReturn.setState(false);
        }
        RMessage.returnMessage(pw, jsonReturn, null, null);
    }

    /**
     * 在线下单
     *
     * @return
     */
    @RequestMapping("/online")
    public ModelAndView online(HttpSession session, String point) {
        ModelAndView mv = null;
        mv = new ModelAndView("../FrontJsp/OnlineOrder");
        List<Mrchandisetype> list = iMrchandisetypeService.findAll();
        this.custom = (Custom) ChangeUtil.sessionpotting("custom", null, false,
                -1, session);
        if (Tools.isNotNull(point)) {
            mv.addObject("point", point);
        }
        mv.addObject("MRlist", list);
        return mv;
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
                                   PrintWriter pw, String tc_from, String tc_to)
            throws IllegalAccessException {
        JsonReturn jsonReturn = new JsonReturn();

        Calendar now = Calendar.getInstance();

        String OrderNumber = "";
        map.put("Reverse", orderform.getSendname());
        int orderformID = 0;
        int mrchandisID = 0;
        if (Tools.isNotNull(tc_from)) {

            map.put("startName",
                    ( tc_from.split("-")[2] ).equals("市辖区") ? tc_from.split("-")[1]
                            : tc_from.split("-")[2]);
        }
        if (Tools.isNotNull(tc_to)) {
            map.put("endName",
                    tc_to.split("-")[2].equals("市辖区") ? tc_to.split("-")[1]
                            : tc_to.split("-")[2]);
        }

        map.put("startIndex", 0);
        map.put("pageSize", 10);
        List<RouteVo> rlist = iRouteService.findPage(map);
        if (rlist.size() > 0) {

            if (this.custom != null) {

                try {

                    List<Orderform> orderlist = iOrderformService
                            .selectOrderNumber();
                    if (orderlist.size() > 0) {
                        OrderNumber = String.valueOf(Integer.valueOf(orderlist
                                .get(0).getOrdernumber().substring(8)) + 1);
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
                                + ( String.valueOf(now.get(Calendar.MONTH) + 1)
                                .length() == 2 ? String.valueOf(now
                                .get(Calendar.MONTH) + 1) : "0"
                                + String.valueOf(now
                                .get(Calendar.MONTH) + 1) )
                                + ( String.valueOf(now.get(Calendar.DATE))
                                .length() == 2 ? String.valueOf(now
                                .get(Calendar.DATE))
                                : "0"
                                + String.valueOf(now
                                .get(Calendar.DATE)) )
                                + OrderNumber;
                    } else {
                        OrderNumber = String.valueOf(now.get(Calendar.YEAR))
                                + ( String.valueOf(now.get(Calendar.MONTH) + 1)
                                .length() == 2 ? String.valueOf(now
                                .get(Calendar.MONTH) + 1) : "0"
                                + String.valueOf(now
                                .get(Calendar.MONTH) + 1) )
                                + ( String.valueOf(now.get(Calendar.DATE))
                                .length() == 2 ? String.valueOf(now
                                .get(Calendar.DATE))
                                : "0"
                                + String.valueOf(now
                                .get(Calendar.DATE)) )
                                + "000001";

                    }

                    if (Tools.checkObjFieldIsNull(orderform)

                            && Tools.isNotNull(orderform.getSendadress())

                            && Tools.isNotNull(orderform.getSendname())
                            && Tools.isNotNull(orderform.getSendphonenumber())) {
                        if (Tools
                                .isNum(String.valueOf(orderform.getCustomid()))) {

                            orderform.setIsindeedupload(false);
                            orderform.setTransportcost(Float.valueOf(0));
                            orderform.setBargainmoney(Float.valueOf(0));

                            orderform.setIsauditing(false);
                            orderform.setUploadtime(GetTimeUtil
                                    .changeStrToTime(GetTimeUtil.getNowTime()));
                            orderform.setOrdernumber(OrderNumber);
                            orderform.setIsfinish(false);
                            orderform.setStatusid(17);
                            orderform.setFinishtime(null);
                            orderform.setStarttime(null);
                            orderform.setSingletime(null);
                            orderform.setIsproblem(false);
                            if (list.getMrchlist().size() == list
                                    .getOrderformdetaillist().size()) {
                                if (list.getMrchlist().size() > 0) {
                                    for (int i = 0; i < list.getMrchlist()
                                            .size(); i++) {
                                        if (!Tools.isNotNull(list.getMrchlist()
                                                .get(i).getMrchandisename())) {
                                            list.getMrchlist().remove(i);
                                            list.getOrderformdetaillist()
                                                    .remove(i);
                                            i--;
                                        }

                                    }

                                    int r = iOrderformService
                                            .insertReturnID(orderform);
                                    orderformID = orderform.getOrderformid();
                                    if (r > 0) {
                                        Orderformdetail orderformdetail = null;
                                        Mrchandise mrchandise = null;
                                        if (list.getMrchlist().size() > 0) {

                                            for (int i = 0; i < list
                                                    .getMrchlist().size(); i++) {
                                                orderformdetail = new Orderformdetail();
                                                mrchandise = new Mrchandise();
                                                if (Tools
                                                        .checkObjFieldIsNull(list
                                                                .getMrchlist()
                                                                .get(i))
                                                        && Tools.isNotNull(list
                                                        .getMrchlist()
                                                        .get(i)
                                                        .getMrchandisename())
                                                        && Tools.isNum(String
                                                        .valueOf(list
                                                                .getMrchlist()
                                                                .get(i)
                                                                .getMrchandisetypeid()))
                                                        && list.getMrchlist()
                                                        .get(i)
                                                        .getMrchandisetypeid() > 0

                                                ) {
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
                                                    mrchandisID = iMrchandiseService
                                                            .insertReturnID(mrchandise);

                                                    if (mrchandisID > 0) {
                                                        if (Tools
                                                                .checkObjFieldIsNull(list
                                                                        .getOrderformdetaillist()
                                                                        .get(i))
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
                                                            int k = iOrderformdetailService
                                                                    .insertSelective(orderformdetail);
                                                            if (k > 0) {
                                                                jsonReturn
                                                                        .setMsg("下单成功，稍后会有人联系您，请留意！！");
                                                                jsonReturn
                                                                        .setState(true);
                                                            } else {
                                                                jsonReturn
                                                                        .setMsg("出错啦！！");
                                                                jsonReturn
                                                                        .setState(false);
                                                                iOrderformService
                                                                        .deleteByPrimaryKey(orderformID);
                                                                for (int j = 0; j < list
                                                                        .getMrchlist()
                                                                        .size(); j++) {

                                                                    iMrchandiseService
                                                                            .deleteByPrimaryKey(list
                                                                                    .getMrchlist()
                                                                                    .get(j)
                                                                                    .getMrchandiseid());

                                                                }

                                                                break;
                                                            }

                                                        } else {
                                                            jsonReturn
                                                                    .setMsg("物品信息不完整！！");
                                                            jsonReturn
                                                                    .setState(false);
                                                            iOrderformService
                                                                    .deleteByPrimaryKey(orderformID);
                                                            for (int j = 0; j < list
                                                                    .getMrchlist()
                                                                    .size(); j++) {

                                                                iMrchandiseService
                                                                        .deleteByPrimaryKey(list
                                                                                .getMrchlist()
                                                                                .get(j)
                                                                                .getMrchandiseid());

                                                            }

                                                            break;
                                                        }

                                                    } else {
                                                        jsonReturn
                                                                .setMsg("出错啦！！");
                                                        jsonReturn
                                                                .setState(false);
                                                        iOrderformService
                                                                .deleteByPrimaryKey(orderformID);
                                                        break;
                                                    }

                                                } else {
                                                    jsonReturn
                                                            .setMsg("物品信息不完整！！");
                                                    jsonReturn.setState(false);
                                                    iOrderformService
                                                            .deleteByPrimaryKey(orderformID);
                                                    break;

                                                }

                                            }
                                        } else {
                                            jsonReturn.setMsg("物品信息不完整！！");
                                            jsonReturn.setState(false);
                                            iOrderformService
                                                    .deleteByPrimaryKey(orderformID);

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
                            jsonReturn.setMsg("您还没有登录，请先登录！！");
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
                                iMrchandiseService
                                        .deleteByPrimaryKey(OrderDetaillist
                                                .get(i).getMrchandiseid());
                            }

                        }
                        iOrderformdetailService
                                .deleteByOrderformID(orderformID);
                    }
                }
            } else {
                jsonReturn.setMsg("请登录！！");
                jsonReturn.setState(false);
            }
        } else {
            jsonReturn.setMsg("路线还没有开通，请选择其他路线！！");
            jsonReturn.setState(false);
        }
        RMessage.returnMessage(pw, jsonReturn, null, null);
    }

    /**
     * 我的订单
     *
     * @param pw
     * @param map
     * @return
     */

    @RequestMapping("/myOrder")
    public ModelAndView myOrder(HttpSession session) {

        ModelAndView mv = null;
        try {
            List<Mrchandisetype> list = iMrchandisetypeService.findAll();

            custom = (Custom) ChangeUtil.sessionpotting("custom", null, false,
                    -1, session);
            if (custom != null) {
                mv = new ModelAndView("../FrontJsp/MyOrder");
            } else {
                mv = new ModelAndView("../FrontJsp/CustomLogin");
            }
            List<Payment> Pylist = iPaymentService.findAll();
            List<Transportmode> Tplllist = iTransportModeService.findAll();
            mv.addObject("MRlist", list);
            mv.addObject("Pylist", Pylist);
            // mv.addObject("billlist", billlist);
            mv.addObject("Tplllist", Tplllist);
        } catch (Exception e) {
            e.printStackTrace();
            mv = new ModelAndView("../FrontJsp/CustomLogin");
        }

        return mv;
    }

    /**
     * 查询个人订单
     *
     * @param pw
     * @param map
     * @param session
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/selcetMyorder")
    public void selcetMyorder(PrintWriter pw, Map map, HttpSession session,
                              Integer startIndex, Integer pageSize) {
        Bsgrid<OrderformVo> bsgrid = new Bsgrid<OrderformVo>();
        List<OrderformVo> list = null;
        try {

            map.put("customid", custom.getCustomid());

            map.put("startIndex", startIndex);
            map.put("pageSize", pageSize);
            list = iOrderformService.findPageOrder(map);
            int total = iOrderformService.getTotalRowOrder(map);
            bsgrid.setData(list);
            bsgrid.setTotalRows(total);

        } catch (Exception e) {
            e.printStackTrace();

        }
        RMessage.returnMessage(pw, bsgrid, list, null);
    }

    /**
     * 查询订单
     *
     * @param pw
     * @param orderformid
     */
    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/selectOrder")
    public void selectOrder(PrintWriter pw, Integer orderformid, Map map) {
        List<Object> list = new ArrayList<Object>();
        map.put("orderformid", orderformid);
        OrderformVo orderformvo = iOrderformService.findOrderVo(map);
        list.add(orderformvo);

        List<OrderformDetailVo> OrderformDetailist = iOrderformdetailService
                .findBySQL(map);
        list.add(OrderformDetailist);
        List<Orderproblem> prolist = iOrderproblemService.findOrderProSQL(map);
        list.add(prolist);
        List<Receivables> recelist = iReceivablesService.findAllSQL(map);
        list.add(recelist);

        List<CancelVo> cancellist = iCancelService.findCancelVo(map);
        list.add(cancellist);
        RMessage.returnMessage(pw, null, list, null);
    }

    /**
     * 申请作废订单
     *
     * @param pw
     * @param map
     */

    @SuppressWarnings({"unchecked", "rawtypes"})
    @RequestMapping("/voidOrder")
    public void voidOrder(PrintWriter pw, Map map, Cancel cancel) {
        JsonReturn jsonReturn = new JsonReturn();
        map.put("orderformid", cancel.getOrderformid());
        Orderform orderform = iOrderformService.selectByPrimaryKey(cancel
                .getOrderformid());
        if (orderform != null) {
            if (orderform.getStatusid() != 18) {
                if (orderform.getStatusid() != 19) {

                    List<Receivables> list = iReceivablesService
                            .findAllSQL(map);
                    int Pay = 0;
                    if (list.size() > 0) {
                        for (int i = 0; i < list.size(); i++) {
                            if (list.get(i).getPaymenttypeid() == 3) {
                                Pay = 1;
                            }
                        }
                    }
                    if (Pay > 0) {

                        int ZhuangTaiID = orderform.getStatusid();
                        if (orderform.getStatusid() == 17) {

                            cancel.setIsaudit(true);
                            cancel.setDefaultmoney(Float.valueOf(0));
                        } else {
                            cancel.setIsaudit(false);

                        }
                        cancel.setApplicationcanceltime(GetTimeUtil
                                .changeStrToTime(GetTimeUtil.getNowTime()));

                        orderform.setStatusid(18);

                        int r = iOrderformService.updateByPrimaryKey(orderform);
                        if (r > 0) {
                            int i = iCancelService.insert(cancel);
                            if (i > 0) {
                                jsonReturn.setMsg("申请成功！！");
                                jsonReturn.setState(true);
                            } else {
                                jsonReturn.setMsg("失敗了！！");
                                jsonReturn.setState(false);
                                orderform.setStatusid(ZhuangTaiID);
                                iOrderformService.updateByPrimaryKey(orderform);
                            }
                        } else {
                            jsonReturn.setMsg("失敗了！！");
                            jsonReturn.setState(false);
                        }
                    } else {
                        jsonReturn.setMsg("请缴纳违约金！！");
                        jsonReturn.setState(false);
                    }
                } else {
                    jsonReturn.setMsg("已作废，不用再次作废了！！");
                    jsonReturn.setState(false);
                }
            } else {
                jsonReturn.setMsg("正在申请中，请等待消息！！");
                jsonReturn.setState(false);
            }
        } else {
            jsonReturn.setMsg("没有此订单的信息！！");
            jsonReturn.setState(false);
        }
        RMessage.returnMessage(pw, jsonReturn, null, null);
    }

    /**
     * 查询物流信息
     *
     * @return
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping("/selectInformation")
    public ModelAndView selectInformation(Map map, HttpSession session) {

        ModelAndView mv = null;
        try {
            custom = (Custom) ChangeUtil.sessionpotting("custom", null, false,
                    -1, session);
            mv = new ModelAndView("../FrontJsp/InquiryLogistics");
            map.put("customid", custom.getCustomid());
            map.put("startIndex", 0);
            map.put("pageSize", 10000);
            List<OrderformVo> list = iOrderformService.findPageOrder(map);
            mv.addObject("Orderlist", list);

        } catch (Exception e) {
            e.printStackTrace();
            mv = new ModelAndView("../FrontJsp/CustomLogin");
        }
        return mv;
    }

    /**
     * 查询订单物流信息
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @SuppressWarnings({"unchecked"})
    @RequestMapping("/getLogisticsInformation")
    protected void getLogisticsInformation(Integer OrderFormID,
                                           @SuppressWarnings("rawtypes") Map map, PrintWriter pw) {
        List<Object> objlist = new ArrayList<Object>();
        List<Logisticstracking> list = null;
        if (OrderFormID > 0) {
            Orderform orderform = iOrderformService
                    .selectByPrimaryKey(OrderFormID);
            map.put("orderformid", OrderFormID);
            list = iLogisticsTrackingService.findLogBySQL(map);
            if (list.size() > 0) {
                objlist.add(list);
            } else {
                objlist.add("null");
            }
            objlist.add(orderform.getTakeadress());
            objlist.add(orderform.getSendadress());
        }
        RMessage.returnMessage(pw, null, objlist, null);

    }

    /**
     * 客户个人中心
     *
     * @param pw
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/personalCenter")
    public ModelAndView personalCenter(@SuppressWarnings("rawtypes") Map map,
                                       HttpSession session, ModelAndView mv) {

        try {
            if (( custom.getCustomertypeid() != 1 )) {

                mv = new ModelAndView("../FrontJsp/EnterpriseInformation");
            } else {
                mv = new ModelAndView("../FrontJsp/CustomerPersonalCenter");
            }
            custom = (Custom) ChangeUtil.sessionpotting("custom", null, false,
                    -1, session);
            map.put("customid", custom.getCustomid());
            CustomVo custom = iCustomService.findCustomInformation(map);

            mv.addObject("custom", custom);

        } catch (Exception e) {
            e.printStackTrace();
            mv = new ModelAndView("../FrontJsp/CustomLogin");
        }
        return mv;
    }

    /**
     * 修改个人信息
     *
     * @param pw
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping("/updatePersonal")
    public void updatePersonal(MultipartFile picture, PrintWriter pw,
                               HttpServletRequest request, Custom custom, Map map) {
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
        Custom oldcustom = iCustomService.selectByPrimaryKey(this.custom
                .getCustomid());
        String igName = "";
        if (oldcustom != null) {

            try {

                if (picture != null) {
                    String uploadFileName = "";

                    uploadFileName = ReadFileUtil.readWriteFile(
                            picture.getInputStream(),
                            picture.getOriginalFilename(), uploadPath);
                    imageName.add(uploadFileName);
                    igName = uploadFileName;
                }
                if (Tools.isNotNull(custom.getMailbox())
                        && Tools.isNotNull(custom.getSex())
                        && Tools.isNotNull(custom.getCustomidnumber())
                        && Tools.isNotNull(custom.getQq())
                        && Tools.isNotNull(custom.getCustomname())
                        && Tools.isNotNull(custom.getCustomphonenumber())
                        && Tools.isNotNull(custom.getCustomerusername())) {
                    custom.setCustomertypeid(oldcustom.getCustomertypeid());
                    custom.setCustompassword(oldcustom.getCustompassword());

                    if (!Tools.isNotNull(igName)) {
                        igName = oldcustom.getCustomidphoto();
                    }
                    custom.setCustomidphoto(igName);
                    map.put("CustomIDNumber", custom.getCustomidnumber());
                    map.put("unequal", custom.getCustomid());

                    List<Custom> list = iCustomService.findCustomBySQL(map);

                    if (list.size() == 0) {
                        map.put("CustomPhoneNumber",
                                custom.getCustomphonenumber());
                        map.put("unequal", custom.getCustomid());
                        List<Custom> list1 = iCustomService
                                .findCustomBySQL(map);
                        if (list1.size() == 0) {

                            if (ValidateIDCardPhotoUtil.ValidateIDPoto(
                                    uploadPath + "\\" + igName, "front",
                                    custom.getCustomidnumber())) {

                                int i = iCustomService
                                        .updateByPrimaryKey(custom);
                                if (i > 0) {
                                    jsonReturn.setMsg("修改成功！！");
                                    jsonReturn.setState(true);
                                    ChangeUtil.sessionpotting("custom", custom,
                                            true, -1, request.getSession());
                                } else {
                                    jsonReturn.setMsg("修改失败！！");
                                    jsonReturn.setState(false);
                                    Record = 1;
                                }

                            } else {
                                jsonReturn.setMsg("身份证照片号码与输入的身份证号码不一致！！");
                                jsonReturn.setState(false);
                                Record = 1;
                            }
                        } else {
                            jsonReturn.setMsg("此手机号码已注册！！");
                            jsonReturn.setState(false);
                            Record = 1;
                        }
                    } else {
                        jsonReturn.setMsg("此身份证已注册！！");
                        jsonReturn.setState(false);
                        Record = 1;
                    }

                } else {
                    jsonReturn.setMsg("请填写完整数据！！");
                    jsonReturn.setState(false);
                    Record = 1;
                }

            } catch (Exception e) {
                e.printStackTrace();
                jsonReturn.setMsg("出错啦！！");
                jsonReturn.setState(false);
                Record = 1;
            }

        } else {
            jsonReturn.setMsg("没有此客户！！");
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

    /**
     * 修改企业信息
     *
     * @param pw
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping("/updateCompany")
    public void updateCompany(MultipartFile picture, PrintWriter pw,
                              HttpServletRequest request, Custom custom, Map map) {
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
        Custom oldcustom = iCustomService.selectByPrimaryKey(this.custom
                .getCustomid());
        String igName = "";
        if (oldcustom != null) {

            try {

                if (picture != null) {
                    String uploadFileName = "";

                    uploadFileName = ReadFileUtil.readWriteFile(
                            picture.getInputStream(),
                            picture.getOriginalFilename(), uploadPath);
                    imageName.add(uploadFileName);
                    igName = uploadFileName;
                }
                if (Tools.isNotNull(custom.getMailbox())

                        && Tools.isNotNull(custom.getCustomname())
                        && Tools.isNotNull(custom.getCustomphonenumber())) {

                    custom.setCustomertypeid(oldcustom.getCustomertypeid());
                    custom.setCustompassword(oldcustom.getCustompassword());
                    custom.setRegistrationdate(oldcustom.getRegistrationdate());
                    if (!Tools.isNotNull(igName)) {
                        igName = oldcustom.getBusinesslicense();
                    }
                    custom.setBusinesslicense(igName);

                    map.put("businesslicensenumber",
                            custom.getBusinesslicensenumber());
                    map.put("unequal", custom.getCustomid());

                    List<Custom> list = iCustomService.findCustomBySQL(map);

                    if (list.size() == 0) {
                        map.put("CustomPhoneNumber",
                                custom.getCustomphonenumber());
                        map.put("unequal", custom.getCustomid());
                        List<Custom> list1 = iCustomService
                                .findCustomBySQL(map);
                        if (list1.size() == 0) {

                            if (ValidateIDCardPhotoUtil
                                    .identificationBusinessLicense(uploadPath
                                                    + "\\" + igName,
                                            custom.getBusinesslicensenumber())) {

                                custom.setSex(null);
                                int i = iCustomService
                                        .updateByPrimaryKey(custom);
                                if (i > 0) {
                                    jsonReturn.setMsg("修改成功！！");
                                    jsonReturn.setState(true);
                                    ChangeUtil.sessionpotting("custom", custom,
                                            true, -1, request.getSession());
                                } else {
                                    jsonReturn.setMsg("修改失败！！");
                                    jsonReturn.setState(false);
                                    Record = 1;
                                }

                            } else {
                                jsonReturn.setMsg("营业执照号码与营业执照图片号码不一致！！");
                                jsonReturn.setState(false);
                                Record = 1;
                            }
                        } else {
                            jsonReturn.setMsg("此手机号码已注册！！");
                            jsonReturn.setState(false);
                            Record = 1;
                        }
                    } else {
                        jsonReturn.setMsg("此公司已注册！！");
                        jsonReturn.setState(false);
                        Record = 1;
                    }

                } else {
                    jsonReturn.setMsg("请填写完整数据！！");
                    jsonReturn.setState(false);
                    Record = 1;
                }

            } catch (Exception e) {
                e.printStackTrace();
                jsonReturn.setMsg("出错啦！！");
                jsonReturn.setState(false);
                Record = 1;
            }

        } else {
            jsonReturn.setMsg("没有此客户！！");
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

    /**
     * 验证验证码
     *
     * @param wp
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping("/checkedCode")
    public void checkedCode(PrintWriter pw, HttpSession session, String code,
                            String PhoneCode, Map map, Integer customertypeid) {
        JsonReturn jsonReturn = new JsonReturn();

        if (Tools.isNotNull(PhoneCode)) {

            if (Tools.isNotNull(code)) {
                if (customertypeid > 0 && customertypeid < 3) {
                    map.put("CustomPhoneNumber", PhoneCode);
                    List<Custom> list = iCustomService.findCustomBySQL(map);
                    if (list.size() == 0) {

                        if (code.equalsIgnoreCase((String) ChangeUtil
                                .sessionpotting("identity", null, false, -1,
                                        session))) {

                            jsonReturn.setState(true);

                        } else {
                            jsonReturn.setMsg("验证码错误！！");
                            jsonReturn.setState(false);
                        }
                    } else {
                        jsonReturn.setMsg("手机号码已注册！！！");
                        jsonReturn.setState(false);
                    }
                } else if (customertypeid == 3) {

                    map.put("phonenumber", PhoneCode);
                    List<User> list = iUserService.findAll(map);
                    if (list.size() == 0) {
                        jsonReturn.setState(true);
                    } else {
                        jsonReturn.setMsg("手机号码已注册！！！");
                        jsonReturn.setState(false);
                    }

                } else {
                    jsonReturn.setMsg("请选择注册类型！！！");
                    jsonReturn.setState(false);
                }
            } else {
                jsonReturn.setMsg("验证码不能够为空");
                jsonReturn.setState(false);
            }

        } else {
            jsonReturn.setMsg("手机号码不能够为空");
            jsonReturn.setState(false);
        }

        RMessage.returnMessage(pw, jsonReturn, null, null);

    }

    /**
     * 客户注册信息
     *
     * @param picture
     * @param pw
     * @param request
     * @param custom
     * @param map
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    @RequestMapping("/insertCustom")
    public void insertCustom(PrintWriter pw, HttpServletRequest request,
                             Custom custom, Map map, String confirmPassword, String companyname) {
        JsonReturn jsonReturn = new JsonReturn();

        if (custom != null) {

            try {
                map.put("CustomPhoneNumber", custom.getCustomphonenumber());
                map.put("unequal", custom.getCustomid());
                List<Custom> list1 = iCustomService.findCustomBySQL(map);

                if (list1.size() == 0) {

                    if (custom.getCustompassword().equals(confirmPassword)) {
                        custom.setCustompassword(MD5Util
                                .getMD5(confirmPassword));

                        custom.setRegistrationdate(GetTimeUtil
                                .changeStrToTime(GetTimeUtil.getNowTime()));
                        if (!Tools.isNotNull(companyname)) {
                            if (Tools.isNotNull(custom.getSex())
                                    && Tools.isNotNull(custom
                                    .getCustomidnumber())
                                    && Tools.isNotNull(custom.getCustomname())
                                    && Tools.isNotNull(custom
                                    .getCustomphonenumber())
                                    && Tools.isNotNull(custom
                                    .getCustomerusername())) {
                                map.clear();
                                map.put("CustomIDNumber",
                                        custom.getCustomidnumber());
                                map.put("unequal", custom.getCustomid());
                                List<Custom> list = iCustomService
                                        .findCustomBySQL(map);
                                if (list.size() == 0) {

                                    int r = iCustomService.insert(custom);
                                    if (r > 0) {
                                        jsonReturn.setMsg("注冊成功！！");
                                        jsonReturn.setState(true);

                                    } else {
                                        jsonReturn.setMsg("注冊失败！！");
                                        jsonReturn.setState(false);

                                    }

                                } else {
                                    jsonReturn.setMsg("此身份证已注册！！");
                                    jsonReturn.setState(false);

                                }
                            } else {
                                jsonReturn.setMsg("请填写完整数据！！");
                                jsonReturn.setState(false);

                            }
                        } else {

                            if (Tools.isNotNull(custom.getCompanyadress())
                                    && Tools.isNotNull(custom
                                    .getTelephonenumber())
                                    && Tools.isNotNull(custom
                                    .getCustompassword())
                                    && Tools.isNotNull(custom
                                    .getCorporaterepresentative())) {

                                custom.setCustomname(companyname);

                                int r = iCustomService.insert(custom);
                                if (r > 0) {
                                    jsonReturn.setMsg("注冊成功！！");
                                    jsonReturn.setState(true);

                                } else {
                                    jsonReturn.setMsg("注冊失败！！");
                                    jsonReturn.setState(false);

                                }

                            } else {
                                jsonReturn.setMsg("请填写完整数据！！");
                                jsonReturn.setState(false);

                            }

                        }
                    } else {
                        jsonReturn.setMsg("两次密码不对应！！");
                        jsonReturn.setState(false);

                    }
                } else {
                    jsonReturn.setMsg("此手机号码已注册！！");
                    jsonReturn.setState(false);

                }

            } catch (Exception e) {
                e.printStackTrace();
                jsonReturn.setMsg("出错啦！！");
                jsonReturn.setState(false);

            }
        } else {
            jsonReturn.setMsg("数据丢失，请刷新界面再进行注册！！");
            jsonReturn.setState(false);

        }

        RMessage.returnMessage(pw, jsonReturn, null, null);
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
            @SuppressWarnings("rawtypes") Map map, String Sex)
            throws IOException {
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

        if (myFile.length >= 3) {
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
                    if (imageName.size() >= 3) {
                        newuser.setIdphoto(imageName.get(0));
                        newuser.setPhoto(imageName.get(1));
                        newuser.setDrivinglicencephoto(imageName.get(2));

                        if (imageName.size() > 3) {
                            newuser.setMancarphoto(imageName.get(3));
                        }

                        if (Tools.isNotNull(newuser.getAddress())
                                && Tools.isNotNull(newuser.getIdnumber())
                                && Tools.isNotNull(newuser.getUsername())
                                && Tools.isNotNull(newuser.getPhonenumber())
                                && Tools.isNotNull(newuser.getPhoto())
                                && Tools.isNotNull(newuser.getIdphoto())
                                && Tools.isNotNull(Sex)
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
                            newuser.setStatusid(2);
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
                                                    newuser.setSex(Sex);

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
        } else {
            jsonReturn.setMsg("请选择图片");
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

    /**
     * 修改密码
     *
     * @param pw
     * @param session
     */

    @RequestMapping("/updatePassword")
    public void updatePassword(PrintWriter pw, HttpSession session,
                               String originalpassword, String PhoneNumber, String Code,
                               String newpassword, String confirmpassword) {
        JsonReturn jsonReturn = new JsonReturn();
        Custom custom = iCustomService.selectByPrimaryKey(this.custom
                .getCustomid());
        if (custom != null) {
            if (Tools.isNotNull(originalpassword)
                    && Tools.isNotNull(newpassword)
                    && Tools.isNotNull(confirmpassword)) {

                if (newpassword.equals(confirmpassword)) {

                    if (custom.getCustompassword().equals(
                            MD5Util.getMD5(originalpassword))) {
                        custom.setCustompassword(MD5Util
                                .getMD5(confirmpassword));
                        int r = iCustomService.updateByPrimaryKey(custom);
                        if (r > 0) {
                            jsonReturn.setMsg("修改成功！！！");
                            jsonReturn.setState(true);
                        } else {
                            jsonReturn.setMsg("修改失败！！！");
                            jsonReturn.setState(false);
                        }
                    } else {
                        jsonReturn.setMsg("原密码错误！！！");
                        jsonReturn.setState(false);
                    }

                } else {
                    jsonReturn.setMsg("两次新密码不一致！！");
                    jsonReturn.setState(false);
                }
            } else {
                if (Tools.isNotNull(PhoneNumber) && Tools.isNotNull(Code)
                        && Tools.isNotNull(confirmpassword)
                        && Tools.isNotNull(newpassword)) {
                    if (ChangeUtil.sessionpotting("PHCODE", null, false, 0,
                            session).equals(Code)) {
                        if (confirmpassword.equalsIgnoreCase(newpassword)) {
                            custom.setCustompassword(MD5Util
                                    .getMD5(newpassword));
                            int r = iCustomService.updateByPrimaryKey(custom);
                            if (r > 0) {
                                jsonReturn.setMsg("修改成功！！！");
                                jsonReturn.setState(true);
                            } else {
                                jsonReturn.setMsg("修改失败！！！");
                                jsonReturn.setState(false);
                            }
                        } else {
                            jsonReturn.setMsg("两次密码不一致！！");
                            jsonReturn.setState(false);
                        }

                    } else {
                        jsonReturn.setMsg("验证码错误！！");
                        jsonReturn.setState(false);
                    }

                } else {

                    jsonReturn.setMsg("请填写完成数据！！");
                    jsonReturn.setState(false);
                }

            }
        } else {
            jsonReturn.setMsg("没有此数据！！");
            jsonReturn.setState(false);
        }
        RMessage.returnMessage(pw, jsonReturn, null, null);

    }

    /**
     * 收钱
     *
     * @param pw
     * @param money
     */
    @SuppressWarnings("unused")
    @RequestMapping("/collectMoney")
    private void collectMoney(PrintWriter pw, String money, Integer OrderID) {

        JsonReturn jsonReturn = new JsonReturn();
        if (Tools.isNotNull(money) && OrderID > 0) {
            Receivables receivables = new Receivables();

            receivables.setMoney(Float.valueOf(money));
            receivables.setOrderformid(OrderID);
            receivables.setPaymenttypeid(3);
            receivables.setReceivablescontent("缴纳的违约金");
            receivables.setReceivablestime(GetTimeUtil
                    .changeStrToTime(GetTimeUtil.getNowTime()));
            int r = iReceivablesService.insert(receivables);
            if (r > 0) {
                jsonReturn.setMsg("收钱成功");
                jsonReturn.setState(true);
            } else {
                jsonReturn.setMsg("收钱成功");
                jsonReturn.setState(false);
            }
        } else {
            jsonReturn.setMsg("请刷新界面");
            jsonReturn.setState(false);
        }
        RMessage.returnMessage(pw, jsonReturn, null, null);
    }

}
