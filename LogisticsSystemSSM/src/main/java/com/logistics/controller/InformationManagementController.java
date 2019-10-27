package com.logistics.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.logistics.po.Information;
import com.logistics.po.User;
import com.logistics.service.IInformationService;
import com.logistics.util.ChangeUtil;
import com.logistics.util.DatatablesViewPage;
import com.logistics.util.FormListObjectUtil;
import com.logistics.util.JsonReturn;
import com.logistics.util.RMessage;
import com.logistics.util.ReadFileUtil;
import com.logistics.util.Tools;

@Controller
@RequestMapping("/InformationManagementController")
public class InformationManagementController {
	@Autowired
	IInformationService iInformationService;
	User user = null;

	@RequestMapping("/informationManagement")
	public ModelAndView informationManagement(HttpSession session) {
		ModelAndView mv = null;
		user = (User) session.getAttribute("USERINFO");
		if (user != null) {
			mv = new ModelAndView("InformationManagement");

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
	 * @param pw
	 * @param map
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	@ResponseBody
	protected DatatablesViewPage<Information> getList(Integer length,
			Integer start, Map map) {

		DatatablesViewPage<Information> view = new DatatablesViewPage<Information>();
		if (length > 0 && start >= 0) {

			map.put("startIndex", start);
			map.put("pageSize", length);
			List<Information> list = iInformationService.findPage(map);

			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {

					list.get(i).setInformationcontent(
							"标题1："
									+ list.get(i).getInformationcontent()
											.split("@")[0].split("/")[0]
									+ "；  内容1："
									+ list.get(i).getInformationcontent()
											.split("@")[0].split("/")[1]
									+ "。  标题2："
									+ list.get(i).getInformationcontent()
											.split("@")[1].split("/")[0]
									+ "；  内容2："
									+ list.get(i).getInformationcontent()
											.split("@")[1].split("/")[1]
									+ "。  标题3："
									+ list.get(i).getInformationcontent()
											.split("@")[2].split("/")[0]
									+ "；  内容3："
									+ list.get(i).getInformationcontent()
											.split("@")[2].split("/")[1]);
				}
			}

			int totalRows = iInformationService.getTotalRow(map);
			view.setiTotalDisplayRecords(totalRows);
			view.setiTotalRecords(totalRows);

			view.setAaData(list);
			return view;
		}
		return null;
	}

	/**
	 * 新增资讯信息
	 * 
	 * @param request
	 * @param pw
	 * @param list
	 * @param newinformation
	 * @param myFile
	 * @throws FileNotFoundException
	 * @throws IOException
	 */

	@RequestMapping("/insertinformation")
	protected void insertinformation(HttpServletRequest request,
			PrintWriter pw, FormListObjectUtil list,
			Information newinformation,
			@RequestParam(value = "picture") List<MultipartFile> myFile)
			throws FileNotFoundException, IOException {
		JsonReturn jsonReturn = new JsonReturn();
		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp";
		File uploadDir = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir.exists()) {
			uploadDir.mkdir();

		}
		int Record = 0;
		String pictureOne = "";
		String pictureTow = "";
		String pictureThree = "";
		String content = "";

		List<String> imageName = new ArrayList<String>();
		if (myFile != null && myFile.size() > 0) {

			String uploadFileName = "";
			int k = 0;
			for (MultipartFile multipartFile : myFile) {
				uploadFileName = ReadFileUtil.readWriteFile(
						multipartFile.getInputStream(),
						multipartFile.getOriginalFilename(), uploadPath);
				imageName.add(uploadFileName);
				if (k == 0) {
					pictureOne = uploadFileName;
				} else if (k == 1) {
					pictureTow = uploadFileName;
				} else {
					pictureThree = uploadFileName;
				}
				k++;
			}

			for (int i = 0; i < list.getContentList().size(); i++) {

				if (Tools.isNotNull(list.getContentList().get(i))
						&& Tools.isNotNull(list.getTitleList().get(i))) {
					content += list.getTitleList().get(i) + "/"
							+ list.getContentList().get(i) + "@";

				} else {

					jsonReturn.setMsg("请填写完整数据！！");
					jsonReturn.setState(false);
					Record = 1;
					break;
				}

			}
			if (Tools.isNotNull(content) && Tools.isNotNull(pictureOne)
					&& Tools.isNotNull(pictureTow)
					&& Tools.isNotNull(pictureThree)) {
				newinformation.setInformationcontent(content);
				newinformation.setInformationpicture(pictureOne + "@"
						+ pictureTow + "@" + pictureThree);
				newinformation.setIsenableno(false);
				int r = iInformationService.insert(newinformation);
				if (r > 0) {
					jsonReturn.setMsg("新增成功！！");
					jsonReturn.setState(true);

				} else {
					jsonReturn.setMsg("新增失败！！");
					jsonReturn.setState(false);
					Record = 1;
				}

			} else {
				jsonReturn.setMsg("请填写完整数据！！");
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
	 * 修改资讯信息
	 * 
	 * @param request
	 * @param pw
	 * @param list
	 * @param newinformation
	 * @param myFile
	 * @throws FileNotFoundException
	 * @throws IOException
	 */

	@RequestMapping("/updateinformation")
	protected void updateinformation(HttpServletRequest request,
			PrintWriter pw, FormListObjectUtil list,
			Information newinformation,
			@RequestParam(value = "picture") List<MultipartFile> myFile)
			throws FileNotFoundException, IOException {
		JsonReturn jsonReturn = new JsonReturn();
		Information oldInformation = iInformationService
				.selectByPrimaryKey(newinformation.getInformationid());
		List<String> oldphoto = new ArrayList<String>();

		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp";
		File uploadDir = new File(uploadPath);
		// 如果目录不存在就创建
		if (!uploadDir.exists()) {
			uploadDir.mkdir();

		}
		int Record = 0;
		String pictureOne = "";
		String pictureTow = "";
		String pictureThree = "";
		String content = "";

		List<String> imageName = new ArrayList<String>();
		if (myFile != null && myFile.size() > 0) {

			String uploadFileName = "";
			for (MultipartFile multipartFile : myFile) {
				uploadFileName = ReadFileUtil.readWriteFile(
						multipartFile.getInputStream(),
						multipartFile.getOriginalFilename(), uploadPath);
				imageName.add(uploadFileName);

				for (int i = 0; i < list.getFilelist().size(); i++) {

					if (list.getFilelist().get(i).equals("one")) {

						pictureOne = uploadFileName;
						list.getFilelist().remove(i);
						i--;

						break;
					} else if (list.getFilelist().get(i).equals("two")) {
						pictureTow = uploadFileName;
						list.getFilelist().remove(i);
						i--;
						break;
					} else if (list.getFilelist().get(i).equals("three")) {
						pictureThree = uploadFileName;
						list.getFilelist().remove(i);
						i--;
						break;
					}
					if (i < 0) {
						i = 0;
					}

				}

			}
		}
		if (!Tools.isNotNull(pictureOne)) {
			pictureOne = oldInformation.getInformationpicture().split("@")[0];
		} else {
			oldphoto.add(oldInformation.getInformationpicture().split("@")[0]);

		}
		if (!Tools.isNotNull(pictureTow)) {
			pictureTow = oldInformation.getInformationpicture().split("@")[1];
		} else {
			oldphoto.add(oldInformation.getInformationpicture().split("@")[1]);

		}
		if (!Tools.isNotNull(pictureThree)) {
			pictureThree = oldInformation.getInformationpicture().split("@")[2];
		} else {
			oldphoto.add(oldInformation.getInformationpicture().split("@")[2]);
		}

		for (int i = 0; i < list.getContentList().size(); i++) {

			if (Tools.isNotNull(list.getContentList().get(i))
					&& Tools.isNotNull(list.getTitleList().get(i))) {
				content += list.getTitleList().get(i) + "/"
						+ list.getContentList().get(i) + "@";

			} else {

				jsonReturn.setMsg("请填写完整数据！！");
				jsonReturn.setState(false);
				Record = 1;
				break;
			}

		}
		if (Tools.isNotNull(content) && Tools.isNotNull(pictureOne)
				&& Tools.isNotNull(pictureTow) && Tools.isNotNull(pictureThree)) {
			newinformation.setInformationcontent(content);
			newinformation.setInformationpicture(pictureOne + "@" + pictureTow
					+ "@" + pictureThree);
			newinformation.setIsenableno(oldInformation.getIsenableno());
			int r = iInformationService.updateByPrimaryKey(newinformation);
			if (r > 0) {
				jsonReturn.setMsg("修改成功！！");
				jsonReturn.setState(true);
				for (int i = 0; i < oldphoto.size(); i++) {
					File oldFile = new File(uploadPath + "\\" + oldphoto.get(i));
					if (oldFile.exists() && oldFile.isFile()) {
						oldFile.delete();
					}
				}
			} else {
				jsonReturn.setMsg("修改失败！！");
				jsonReturn.setState(false);
				Record = 1;
			}

		} else {
			jsonReturn.setMsg("请填写完整数据！！");
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
	 * 查询资讯信息
	 * 
	 * @param informationID
	 * @param pw
	 */
	@RequestMapping("/selectinformation")
	protected void selectinformation(Integer informationID, PrintWriter pw) {

		String json = "";
		if ((informationID) > 0) {
			Information information = iInformationService
					.selectByPrimaryKey(informationID);
			json = "{"
					+ ChangeUtil.changeJson("title1",
							information.getInformationcontent().split("@")[0]
									.split("/")[0])
					+ ","
					+ ChangeUtil.changeJson("content",
							information.getInformationcontent().split("@")[0]
									.split("/")[1])
					+ ","
					+ ChangeUtil.changeJson("title2",
							information.getInformationcontent().split("@")[1]
									.split("/")[0])
					+ ","
					+ ChangeUtil.changeJson("content2",
							information.getInformationcontent().split("@")[1]
									.split("/")[1])
					+ ","
					+ ChangeUtil.changeJson("title3",
							information.getInformationcontent().split("@")[2]
									.split("/")[0])
					+ ","
					+ ChangeUtil.changeJson("content3",
							information.getInformationcontent().split("@")[2]
									.split("/")[1])
					+ ","
					+ ChangeUtil.changeJson("image", information
							.getInformationpicture().split("@")[0])
					+ ","
					+ ChangeUtil.changeJson("image1", information
							.getInformationpicture().split("@")[1])
					+ ","
					+ ChangeUtil.changeJson("image2", information
							.getInformationpicture().split("@")[2]) + "}";

		}

		RMessage.returnMessage(pw, null, null, json);
	}

	/**
	 * 删除资讯
	 * 
	 * @param request
	 * @param pw
	 * @param informationID
	 */
	@RequestMapping("/deleteinformation")
	protected void deleteinformation(HttpServletRequest request,
			PrintWriter pw, Integer informationID) {
		JsonReturn jsonReturn = new JsonReturn();
		String uploadPath = request.getServletContext().getRealPath("/")
				+ "\\Temp";

		if ((informationID) > 0) {

			Information information = iInformationService
					.selectByPrimaryKey(Integer.valueOf(informationID));
			if (information != null) {
				if (information.getIsenableno() == false) {

					if (Tools.isNotNull(information.getInformationpicture())) {
						// 不为空 上传图片，删除旧的图片
						for (int i = 0; i < 3; i++) {

							String oldFilePath = uploadPath
									+ File.separator
									+ information.getInformationpicture()
											.split("@")[i];
							File oldFile = new File(oldFilePath);
							if (oldFile.exists() && oldFile.isFile()) {
								oldFile.delete();
							}
						}
					}
					int b = iInformationService.deleteByPrimaryKey(Integer
							.valueOf(informationID));
					if (b > 0) {
						jsonReturn.setMsg("删除成功！！");
						jsonReturn.setState(true);
					} else {
						jsonReturn.setMsg("删除失败！！");
						jsonReturn.setState(false);
					}
				} else {
					jsonReturn.setMsg("启用中，不可以删除！！");
					jsonReturn.setState(false);
				}
			} else {
				jsonReturn.setMsg("没有此数据！！");
				jsonReturn.setState(false);
			}

		} else {
			jsonReturn.setMsg("请选择数据！！");
			jsonReturn.setState(false);
		}
		RMessage.returnMessage(pw, jsonReturn, null, null);

	}

	/**
	 * 启用资讯
	 * 
	 * @param informationID
	 * @param pw
	 */
	@RequestMapping("/applyinformation")
	protected void applyinformation(Integer informationID, PrintWriter pw) {
		JsonReturn jsonReturn = new JsonReturn();
		if ((informationID) > 0) {

			Information information = iInformationService
					.selectByPrimaryKey(Integer.valueOf(informationID));

			Information oldinformation = iInformationService.findInformation();
			int Count = 0;
			if (oldinformation != null) {

				oldinformation.setIsenableno(false);

				int bol = iInformationService
						.updateByPrimaryKey(oldinformation);
				if (bol > 0) {
					Count = 1;
				} else {
					Count = 2;
				}
			}
			if (Count == 1 || Count == 0) {

				Information newInformation = new Information();

				newInformation.setIsenableno(true);
				newInformation.setInformationcontent(information
						.getInformationcontent());
				newInformation.setInformationid(Integer.valueOf(informationID));
				newInformation.setInformationpicture(information
						.getInformationpicture());
				int b = iInformationService.updateByPrimaryKey(newInformation);
				if (b > 0) {
					jsonReturn.setMsg("启用成功！！");
					jsonReturn.setState(true);
				} else {
					jsonReturn.setMsg("启用失败！！");
					jsonReturn.setState(false);
				}
			} else {
				jsonReturn.setMsg("启用失败！！");
				jsonReturn.setState(false);
			}

			RMessage.returnMessage(pw, jsonReturn, null, null);

		}

	}
}
