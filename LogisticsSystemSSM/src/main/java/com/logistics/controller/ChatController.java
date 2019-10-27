package com.logistics.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.User;
import com.logistics.util.ChangeUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.RMessage;
import com.logistics.util.ReadFileUtil;
import com.logistics.util.Tools;
import com.logistics.util.UserChat;

@Controller
@RequestMapping("/ChatController")
public class ChatController {
	User user = null;

	@RequestMapping("/chat")
	public ModelAndView chat(HttpSession session) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("Chat");
			mv.addObject("user", user);
			String loginName = "";
			for (String key : UserChat.user.keySet()) {
				if (Tools.isNotNull(key)) {
					loginName += key + "/";
				}

			}
			if (loginName == "") {
				loginName = user.getUsername();
			}
			ChangeUtil.sessionpotting("loginName", user.getUsername(), false,
					-1, session);

			mv.addObject("name", user.getUsername());
			mv.addObject("loginName", loginName);

			String Photo = user.getUsername() + ":" + user.getPhoto() + "/";
			UserChat.userPhoto.put(user.getUsername(), user.getPhoto());

			mv.addObject("Photo", Photo);

		} else {
			mv = new ModelAndView("/../index");
		}
		return mv;

	}

	/**
	 * 聊天界面记录
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */

	@RequestMapping("/chatRecordJsp")
	protected ModelAndView chatRecordJsp(HttpServletRequest request)
			throws IOException {
		ModelAndView mv = null;
		mv = new ModelAndView("ChatRecord");
		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp\\聊天记录.txt";
		String NeiRong = ReadFileUtil.duQuWenJianEr(uploadPath);
		mv.addObject("NeiRong", NeiRong);

		return mv;
	}

	/**
	 * 刷新上线的用户照片和名称
	 */
	@RequestMapping("/refurbish")
	protected void refurbish() {

		if (user != null && Tools.isNotNull(user.getPhoto())) {
			UserChat.userPhoto.put(user.getUsername(), user.getPhoto());
		}
	}

	/**
	 * 查询用户头像
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/selectPhoto")
	protected void selectPhoto(PrintWriter pw) {

		String Photo = "";
		for (String key : UserChat.userPhoto.keySet()) {
			if (Tools.isNotNull(key)) {
				Photo += key + ":" + UserChat.userPhoto.get(key) + "/";
			}

		}
		pw.write(Photo);

		pw.close();
	}

	/**
	 * 上传文件
	 * 
	 * @param myFile
	 * @param request
	 * @param pw
	 * @throws IOException
	 */
	@RequestMapping("/uploadFile")
	public void uploadFile(
			@RequestParam(value = "file", required = true) MultipartFile myFile,
			HttpServletRequest request, PrintWriter pw) throws IOException {

		// 获取本地路径
		String uploadPath = request.getServletContext().getRealPath("\\Temp");

		File uploadDir = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir.exists()) {
			uploadDir.mkdir();

		}
		uploadPath = uploadPath + "\\ChatTemp";
		File uploadDir1 = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir1.exists()) {
			uploadDir1.mkdir();

		}

		String uploadFileName = ReadFileUtil.readWriteFile(
				myFile.getInputStream(), myFile.getOriginalFilename(),
				uploadPath);
		pw.write("成功:" + uploadFileName);
		pw.close();
	}

	/**
	 * 查找图片
	 * 
	 * @param file
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/getPicture")
	protected void getPicture(String file, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String StrFileName = file;
		// 获取本地路径
		String uploadPath = request.getServletContext().getRealPath("\\Temp");

		File uploadDir = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir.exists()) {
			uploadDir.mkdir();

		}
		uploadPath = uploadPath + "\\ChatTemp";
		File uploadDir1 = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir1.exists()) {
			uploadDir1.mkdir();

		}
		// 构建上传目录的路径
		// String uploadPath = "D:\\JavaTest\\LogisticsSystem\\Temp";
		if (Tools.isNotNull(StrFileName)) {
			File WenJian = new File(uploadPath + File.separator + StrFileName);
			if (WenJian.exists() && WenJian.isFile()) {
				FileInputStream in = new FileInputStream(WenJian);
				ServletOutputStream out = response.getOutputStream();

				byte[] b = new byte[1024];
				int count = 0;
				while (-1 != (count = in.read(b, 0, b.length))) {
					out.write(b, 0, count);
				}
				response.setContentType("image/png");// 设置返回的文件类型
				out.flush();
				out.close();
				in.close();
			}

		}

	}

	/**
	 * 下载图片（也可以是文件）
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	@RequestMapping("/downFile")
	private void downFile(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String strFileName = request.getParameter("file");
		if (Tools.isNotNull(strFileName)) {// 检查字符串不为空

			String uploadPath = request.getServletContext().getRealPath("/")
					+ "\\Temp\\ChatTemp";
			String fileNmae = uploadPath + "\\" + strFileName;
			File file = new File(fileNmae);
			if (file.exists() && file.isFile()) {// 检查路径存在，并且是文件
				FileInputStream fis = new FileInputStream(file);

				// ******1、 设置文件的MIME类型
				response.setContentType(request.getAuthType());

				// ******2、 设置Content-Disposition 设置下载的文件名称
				response.setCharacterEncoding("utf-8");
				response.setHeader("Content-Disposition",
						"attachment;filename=" + strFileName);

				OutputStream os = response.getOutputStream();

				byte[] buf = new byte[1024];
				int count = 0;
				while ((count = fis.read(buf, 0, buf.length)) != -1) {
					os.write(buf, 0, count);
				}
				fis.close();
				os.flush();
				os.close();
			}
		}

	}

	/**
	 * 下线了
	 * 
	 * @param pw
	 */
	@RequestMapping("/outLine")
	protected void outLine(PrintWriter pw) {
		JsonReturn jsonReturn = new JsonReturn();

		UserChat.user.remove(user.getUsername());
		UserChat.userPhoto.remove(user.getUsername());
		jsonReturn.setMsg("success");
		jsonReturn.setState(true);
		RMessage.returnMessage(pw, jsonReturn, null, null);
	}

	/**
	 * 聊天记录
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/chatRecord")
	protected void chatRecord(HttpServletRequest request, String ChatRecord)
			throws IOException {

		String record = ChatRecord;
		byte bytes[] = { (byte) 0xC2, (byte) 0xA0 };
		String UTFSpace = new String(bytes, "utf-8");
		record = record.replaceAll(UTFSpace, "&nbsp;");

		if (Tools.isNotNull(record)) {

			// 获取本地路径
			String uploadPath = request.getServletContext().getRealPath(
					"\\Temp");

			File uploadDir = new File(uploadPath);
			// 如果目录不存在就创建
			if (!uploadDir.exists()) {
				uploadDir.mkdir();

			}
			uploadPath = uploadPath + "\\ChatTemp";
			File uploadDir1 = new File(uploadPath);
			// 如果目录不存在就创建
			if (!uploadDir1.exists()) {
				uploadDir1.mkdir();

			}
			uploadPath += "\\聊天记录.txt";
			String NeiRong = ReadFileUtil.duQuWenJianEr(uploadPath) + "▁"
					+ record;

			ReadFileUtil.xieRuWenKJi(uploadPath, NeiRong);
			File file = new File(uploadPath);
			if (file.exists() && file.isFile()) {

				if (file.getName().length() > 10485760) {
					file.delete();
				}
			}
		}

	}

	/**
	 * 清空服务器连接
	 * 
	 * @param pw
	 */
	@RequestMapping("/reConnect")
	protected void reConnect(PrintWriter pw) {
		JsonReturn jsonReturn = new JsonReturn();

		if (!UserChat.user.isEmpty()) {

			// UserChat.user.remove(user.getUserName());
			UserChat.user.clear();
		}
		if (!UserChat.userPhoto.isEmpty()) {

			// UserChat.userPhoto.remove(user.getUserName());
			UserChat.userPhoto.clear();
		}

		jsonReturn.setMsg("success");

		jsonReturn.setState(true);

		RMessage.returnMessage(pw, jsonReturn, null, null);

	}
}
