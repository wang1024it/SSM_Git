package com.logistics.util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/chat/{loginName}")
public class Server {// 自定义一个服务端 名字随便
	private Session session;

	/**
	 * 开始连接websocket
	 * 
	 * @param session
	 * @param loginName
	 *            当前登录账号
	 */
	@OnOpen
	public void open(Session session, @PathParam("loginName") String loginName)
			throws ServletException {
		this.session = session;
		if (com.lj.util.Tools.isNotNull(loginName)) {

			com.lj.util.UserChat.user.put(loginName, this);// 保存当前的对象，用于发送或接收消息

		}

	}

	/**
	 * 发送消息
	 * 
	 * @param message
	 *            发送消息
	 * @throws IOException
	 */
	@OnMessage
	public void message(String message) throws IOException {

		try {

			if (message.split("▂")[0] != "") {
				String msg = "私聊▍" + message;

				com.lj.util.UserChat.user.get(message.split("▂")[1]).session
						.getBasicRemote().sendText(msg);
				com.lj.util.UserChat.user.get(message.split("▂")[0]).session
						.getBasicRemote().sendText(msg);
			}

		} catch (Exception e) {
			// 发送给全部人
			for (Server server : com.lj.util.UserChat.user.values()) {
				// 全部发送消息
				server.session.getBasicRemote().sendText(message);
				// server.session.getBasicRemote().sendText(LoginName);

			}

		}

		/*
		 * 如果是一对一发送消息的话 User.user中只获取发消息和接收消息的对象 不用获取全部 比如：光头强 发给 熊大
		 * User.user.get("光头强").session.getBasicRemote().sendText(msg);
		 * User.user.get("熊大").session.getBasicRemote().sendText(msg);
		 */
	}

	/**
	 * 关闭
	 * 
	 * @param session
	 * @throws IOException
	 */
	@OnClose
	public void close(Session session) throws ServletException, IOException {

		System.out.println("Close");
	}

	/**
	 * 出错
	 * 
	 * @param t
	 * @param session
	 */
	@OnError
	public void error(Throwable t, Session session) throws ServletException {
		

		System.out.println(t.getMessage());

		System.out.println("Error");
	}
}
