package com.logistics.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class ReadFileUtil {
	/**
	 * 读取文件信息
	 * 
	 * @param filePath
	 *            文件路径
	 * @return
	 * @throws IOException
	 */
	public static List<String> duQuWenJian(String filePath) throws IOException {
		File file = new File(filePath);
		InputStream inputStream = new FileInputStream(file);
		List<String> list = new ArrayList<String>();

		BufferedReader bufferedReader = new BufferedReader(
				new InputStreamReader(inputStream));
		String str = null;
		while ((str = bufferedReader.readLine()) != null) {
			// 如果有空格、去掉空格
			// if (str.contains(" ")) {
			// Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			// Matcher m = p.matcher(str);
			// str = m.replaceAll("");
			// }
			// 如果不是空串、添加到list、然后提交
			if (!str.equals("")) {

				list.add(str);
				/**
				 * 可以在添加到list后、根据需求操作文件中第一条数据
				 */

			}
			str = "";
			// Str += new String(b, 0, b.length, "GBK");
		}
		bufferedReader.close();

		inputStream.close();
		return list;
	}

	/**
	 * 写入文件信息
	 * 
	 * @param filePath
	 *            文件路径
	 * @param NeiRong
	 *            文件内容
	 * @throws IOException
	 */
	public static void xieRuWenKJi(String filePath, String NeiRong)
			throws IOException {
		File file = new File(filePath);
		if (!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {

				e.printStackTrace();
			}
		}

		OutputStream outputStream = new FileOutputStream(filePath);

		byte[] b1 = NeiRong.getBytes("GBK");
		outputStream.write(b1, 0, b1.length);
		outputStream.close();

	}

	/**
	 * 读取文件信息
	 * 
	 * @param filePath
	 *            文件路径
	 * @return
	 * @throws IOException
	 */
	public static String duQuWenJianEr(String filePath) throws IOException {

		File file = new File(filePath);
		if (file.exists()) {

		} else {

			try {
				file.createNewFile();
			} catch (IOException e) {

				e.printStackTrace();
			}
		}

		InputStream inputStream = new FileInputStream(file);

		byte[] b = new byte[1024];
		int count = 0;
		String str = "";
		while (-1 != (count = inputStream.read(b, 0, b.length))) {
			str += new String(b, 0, count);
			// 如果有空格、去掉空格
			// if (str.contains(" ")) {
			// Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			// Matcher m = p.matcher(str);
			// str = m.replaceAll("");
			// }
			// 如果不是空串、添加到list、然后提交
			if (!str.equals("")) {

				/**
				 * 可以在添加到list后、根据需求操作文件中第一条数据
				 */

			}

			// Str += new String(b, 0, b.length, "GBK");
		}

		inputStream.close();
		return str;
	}

	/**
	 * 读取文件和写入文件
	 * 
	 * @param in
	 *            需要的读取的文件的inputstream
	 * @param fileName
	 *            文件的名称
	 * @param uploadPath
	 *            上传路径
	 * @return
	 * @throws FileNotFoundException
	 */
	public static String readWriteFile(InputStream in, String fileName,
			String uploadPath) throws FileNotFoundException {

		try {
			String name = String.valueOf(System.nanoTime() + fileName);
			OutputStream out = new FileOutputStream(new File(uploadPath, name));
			byte[] b = new byte[1024];
			int count = 0;

			while (-1 != (count = in.read(b, 0, b.length))) {
				out.write(b, 0, count);
			}
			in.close();
			out.close();
			return name;
		} catch (Exception e) {

			e.printStackTrace();
		}

		return "";
	}
}
