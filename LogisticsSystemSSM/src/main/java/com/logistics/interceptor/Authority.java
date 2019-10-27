package com.logistics.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.User;
import com.logistics.service.IPowerService;
import com.logistics.vo.PowerVo;

public class Authority implements HandlerInterceptor {
	@Autowired
	IPowerService iPowerService;
	private List<String> excludeUrls;// 不需要拦截的资源

	/**
	 * @return the excludeUrls
	 */
	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	/**
	 * @param excludeUrls
	 *            the excludeUrls to set
	 */
	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

	/**
	 * 完成页面的render后调用
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object object, Exception e)
			throws Exception {

	}

	/**
	 * 在调用controller具体方法后拦截
	 */
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object object,
			ModelAndView modelAndView) throws Exception {

	}

	/**
	 * 在调用controller具体方法前拦截
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object object) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = requestUri.substring(contextPath.length());
		if (url.indexOf("Content") > -1) {
			return true;
		}
    
		if (excludeUrls.size() > 0) {

			for (int i = 0; i < excludeUrls.size(); i++) {

				if (url.indexOf(excludeUrls.get(i)) > -1) {
					return true;
				}
			}

		}

		User user = (User) request.getSession().getAttribute("USERINFO");
		if (user == null) {
			request.getRequestDispatcher("/Jsp/Login.jsp").forward(request,
					response);
			return false;
		}
		map.put("userid", user.getUserid());
		List<PowerVo> list = iPowerService.findPower(map);

		if ((list == null)) {// 如果没有登录或登录超时
			request.setAttribute("msg", "您还没有登录或登录已超时，请重新登录，然后再刷新本功能！");
			request.getRequestDispatcher("/error/noSession.jsp").forward(
					request, response);
			return false;
		}

		if (list != null) {

			if (list.size() > 0) {
				int k = 0;
				for (int i = 0; i < list.size(); i++) {

					if (url.indexOf(list.get(i).getModuleurl()) > -1) {// 如果当前用户没有访问此资源的权限
						k++;
					}
					if (url.split("/")[1].equals(list.get(i).getModuleurl()
							.split("/")[1])) {
						k++;
					}
				}
				if (k == 0) {

					request.getRequestDispatcher("/error/noSecurity.jsp")
							.forward(request, response);
					return false;
				}

			} else {

				request.getRequestDispatcher("/error/noSecurity.jsp").forward(
						request, response);
				return false;
			}
		}
		return true;
	}
}
