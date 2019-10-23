package com.logistics.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class ChangeUtil {
	/**
	 * 将传进来的数据变成json数据
	 * 
	 * @param Name
	 *            名称
	 * @param Value
	 *            值
	 * @return
	 */
	public static String changeJson(Object Name, Object Value) {
		String Json = "";

		Json = "\"" + Name + "\":" + "\"" + Value + "\"";
		return Json;
	}

	/**
	 * session值的获取新建还是获取
	 * 
	 * @param sessionName
	 *            设置session的名称
	 * @param object
	 *            传入session的对象或者变量
	 * @param New
	 *            新建还是查找
	 * @param deadTime
	 *            设置session的有效时间
	 * @return
	 */
	public static Object sessionpotting(String sessionName, Object object,
			boolean New, int deadTime, HttpSession session) {

		if (New) {
			session.setAttribute(sessionName, object);
			session.setMaxInactiveInterval(deadTime);
			return "成功";
		} else {

			return session.getAttribute(sessionName);

		}

	}

	/**
	 * 销毁session
	 * 
	 * @param session
	 *            HttpSession session
	 * @param sessionName
	 *            session的名称
	 */
	public static void destroySession(HttpSession session, String sessionName) {

		session.removeAttribute(sessionName);
		// session.invalidate();
	}

	/**
	 * 上传文件一部分
	 * 
	 * @param request
	 * @param jsonReturn
	 *            返回的jsonturn的错误信息
	 * @param uploadPath
	 *            上传的路径
	 * @param sizeThresehold
	 *            设置内存的临界值
	 * @param fileSizeMAX
	 *            设置单个文件的最大大小
	 * @param sizeMax
	 *            设置请求的最大大小
	 * @return
	 */
	public static Object uploadFile(HttpServletRequest request,
			String uploadPath, int sizeThresehold, int fileSizeMAX, int sizeMax) {

		// 判断请求的头中是否还有enctype="multipart/form-data"
		if (!ServletFileUpload.isMultipartContent(request)) {
			// jsonReturn.setMsg("Error:表单中必须包含enctype=\"multipart/form-data\"");
		} else {

			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 当文件超过设置的值时就写入到临时文件夹，否则就保存在内存
			factory.setSizeThreshold(sizeThresehold);
			// 设置DiskFileItemFactory的临时文件夹
			// java.io.tmpdir 代表系统的temp目录

			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			// 设置编码
			fileUpload.setHeaderEncoding("utf-8");
			// 设置单个文件的最大大小
			fileUpload.setFileSizeMax(fileSizeMAX);
			// 设置请求的最大大小
			fileUpload.setSizeMax(sizeMax);
			// 构建上传目录的路径
			// String uploadPath = "D:\\Temp";

			File uploadDir = new File(uploadPath);
			// 如果目录不存在就创建
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			return fileUpload;
		}
		return "";

	}

	/***
	 * 循环遍历参数
	 * 
	 * @param fileItem
	 * @return
	 */
	public static String duQuLiuCanShu(FileItem fileItem) {
		String StrValue = "";
		String fieldName = "";
		InputStream in;
		try {
			in = fileItem.getInputStream();
			InputStreamReader reader = new InputStreamReader(in, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(reader);
			StrValue = bufferedReader.readLine();// 字段的值
			fieldName = fileItem.getFieldName();// 获取字段名称

		} catch (IOException e) {

			e.printStackTrace();
		}

		return StrValue + "_" + fieldName;

	}

	/***
	 * 上传文件下部分
	 * 
	 * @param fileItem
	 * @param uploadPath
	 *            路径
	 * @return
	 */
	public static String filePath(FileItem fileItem, String uploadPath) {

		// 获取原来的扩展名
		String oldName = new File(fileItem.getName()).getName();
		String extensionName = ".jpg";
		if ((oldName != null) && (oldName.length() > 0)) {
			int dot = oldName.lastIndexOf(".");
			if ((dot > -1) && (dot < (oldName.length() - 1))) {
				extensionName = oldName.substring(dot);
			}

		}

		// 构建文件的名称
		String fileName = System.currentTimeMillis() + extensionName;
		String filePath = uploadPath + File.separator + fileName;

		// 保存文件
		try {

			fileItem.write(new File(filePath));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return fileName;
	}

}
