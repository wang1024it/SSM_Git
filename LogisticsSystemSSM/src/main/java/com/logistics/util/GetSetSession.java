package com.logistics.util;

import javax.servlet.http.HttpServletRequest;

public class GetSetSession {
	/**
	 * 获取session
	 * 
	 * @param request
	 *            请求
	 * @param sessionName
	 *            session的名称
	 * @return
	 */
	public static Object getSession(HttpServletRequest request,
			String sessionName) {

		return request.getAttribute(sessionName);
	}
	
	
	
	
	
}
