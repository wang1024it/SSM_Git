package com.logistics.util;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

@SuppressWarnings("deprecation")
public class ExportImportUtil {

//	/**
//	 * 导出Excel
//	 *
//	 * @param TitleName
//	 *            excel的名称
//	 * @param columnNumber
//	 *            株数
//	 * @param columnWidth
//	 *            每个单元格的宽度 例如{10,20,30 }
//	 * @param columnName
//	 *            每个单元格的名称 例如{"订单号","收货人名称"，"...",...}
//	 * @param dataList
//	 *            导出的内容{{"00001","张三"},{"0002","李四"}}
//	 * @param response
//	 * @throws Exception
//	 */
//	public static void Export(String TitleName, int columnNumber,
//			int[] columnWidth, String[] columnName, String[][] dataList,
//			HttpServletResponse response) throws Exception {
//		ExportWithResponse(TitleName, TitleName, TitleName, columnNumber,
//				columnWidth, columnName, dataList, response);
//
//	}
//
//	private static void ExportWithResponse(String sheetName, String titleName,
//			String fileName, int columnNumber, int[] columnWidth,
//			String[] columnName, String[][] dataList,
//			HttpServletResponse response) throws Exception {
//		if (columnNumber == columnWidth.length
//				&& columnWidth.length == columnName.length) {
//			// 第一步，创建一个webbook，对应一个Excel文件
//			HSSFWorkbook wb = new HSSFWorkbook();
//			// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
//			HSSFSheet sheet = wb.createSheet(sheetName);
//			// sheet.setDefaultColumnWidth(15); //统一设置列宽
//			for (int i = 0; i < columnNumber; i++) {
//				for (int j = 0; j <= i; j++) {
//					if (i == j) {
//						sheet.setColumnWidth(i, columnWidth[j] * 256); // 单独设置每列的宽
//					}
//				}
//			}
//			// 创建第0行 也就是标题
//			HSSFRow row1 = sheet.createRow((int) 0);
//			row1.setHeightInPoints(50);// 设备标题的高度
//										// 第三步创建标题的单元格样式style2以及字体样式headerFont1
//			HSSFCellStyle style2 = wb.createCellStyle();
//			style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
//			style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
//			style2.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index);
//			style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
//			HSSFFont headerFont1 = (HSSFFont) wb.createFont(); // 创建字体样式
//			headerFont1.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 字体加粗
//			headerFont1.setFontName("黑体"); // 设置字体类型
//			headerFont1.setFontHeightInPoints((short) 15); // 设置字体大小
//			style2.setFont(headerFont1); // 为标题样式设置字体样式
//
//			HSSFCell cell1 = row1.createCell(0);// 创建标题第一列
//			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0,
//					columnNumber - 1)); // 合并列标题
//			cell1.setCellValue(titleName); // 设置值标题
//			cell1.setCellStyle(style2); // 设置标题样式
//
//			// 创建第1行 也就是表头
//			HSSFRow row = sheet.createRow((int) 1);
//			row.setHeightInPoints(37);// 设置表头高度
//
//			// 第四步，创建表头单元格样式 以及表头的字体样式
//			HSSFCellStyle style = wb.createCellStyle();
//			style.setWrapText(true);// 设置自动换行
//			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
//			style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 创建一个居中格式
//
//			style.setBottomBorderColor(HSSFColor.BLACK.index);
//			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
//			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
//			style.setBorderRight(HSSFCellStyle.BORDER_THIN);
//			style.setBorderTop(HSSFCellStyle.BORDER_THIN);
//
//			HSSFFont headerFont = (HSSFFont) wb.createFont(); // 创建字体样式
//			headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 字体加粗
//			headerFont.setFontName("黑体"); // 设置字体类型
//			headerFont.setFontHeightInPoints((short) 10); // 设置字体大小
//			style.setFont(headerFont); // 为标题样式设置字体样式
//
//			// 第四.一步，创建表头的列
//			for (int i = 0; i < columnNumber; i++) {
//				HSSFCell cell = row.createCell(i);
//				cell.setCellValue(columnName[i]);
//				cell.setCellStyle(style);
//			}
//
//			// 第五步，创建单元格，并设置值
//			for (int i = 0; i < dataList.length; i++) {
//				row = sheet.createRow((int) i + 2);
//				// 为数据内容设置特点新单元格样式1 自动换行 上下居中
//				HSSFCellStyle zidonghuanhang = wb.createCellStyle();
//				zidonghuanhang.setWrapText(true);// 设置自动换行
//				zidonghuanhang
//						.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 创建一个居中格式
//
//				// 设置边框
//				zidonghuanhang.setBottomBorderColor(HSSFColor.BLACK.index);
//				zidonghuanhang.setBorderBottom(HSSFCellStyle.BORDER_THIN);
//				zidonghuanhang.setBorderLeft(HSSFCellStyle.BORDER_THIN);
//				zidonghuanhang.setBorderRight(HSSFCellStyle.BORDER_THIN);
//				zidonghuanhang.setBorderTop(HSSFCellStyle.BORDER_THIN);
//
//				// 为数据内容设置特点新单元格样式2 自动换行 上下居中左右也居中
//				HSSFCellStyle zidonghuanhang2 = wb.createCellStyle();
//				zidonghuanhang2.setWrapText(true);// 设置自动换行
//				zidonghuanhang2
//						.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); // 创建一个上下居中格式
//				zidonghuanhang2.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
//
//				// 设置边框
//				zidonghuanhang2.setBottomBorderColor(HSSFColor.BLACK.index);
//				zidonghuanhang2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
//				zidonghuanhang2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
//				zidonghuanhang2.setBorderRight(HSSFCellStyle.BORDER_THIN);
//				zidonghuanhang2.setBorderTop(HSSFCellStyle.BORDER_THIN);
//				HSSFCell datacell = null;
//				for (int j = 0; j < columnNumber; j++) {
//					datacell = row.createCell(j);
//					datacell.setCellValue(dataList[i][j]);
//					datacell.setCellStyle(zidonghuanhang2);
//				}
//			}
//
//			// 第六步，将文件存到浏览器设置的下载位置
//			String filename = fileName + ".xls";
//			response.setContentType("application/ms-excel;charset=UTF-8");
//			response.setHeader("Content-Disposition",
//					"attachment;filename=".concat(String.valueOf(URLEncoder
//							.encode(filename, "UTF-8"))));
//			OutputStream out = response.getOutputStream();
//			try {
//				wb.write(out);// 将数据写出去
//
//			} catch (Exception e) {
//				e.printStackTrace();
//
//			} finally {
//				out.close();
//			}
//
//		} else {
//			System.out.println("列数目长度名称三个数组长度要一致");
//		}
//
//	}
//
//	/*
//	 * ================================================导入========================
//	 */
//
//	/**
//	 *
//	 * @param in
//	 *            InputStream 流 例如 InputStream inputStream=new InputStream(new
//	 *            file( 文件的路径))
//	 * @param column
//	 *            有多少列
//	 * @param field
//	 *            Excel文档的每列的title 例如 { "序号", "订单编号",......}
//	 * @return
//	 * @throws Exception
//	 */
//	public static Object Import(InputStream in, int column, String[] field)
//			throws Exception {
//		return getDataFromExcel(in, column, field);
//
//	}
//
//	private static Object getDataFromExcel(InputStream in, int column,
//			String[] field) {
//
//		Workbook wookbook = null;
//		try {
//
//			wookbook = new HSSFWorkbook(in);// 得到工作簿
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		int flag = 0;
//		// 得到一个工作表
//		Sheet sheet = wookbook.getSheetAt(0);
//
//		// 获得表头
//		Row rowHead = sheet.getRow(0);
//
//		// 根据不同的data放置不同的表头
//		Map<Object, Integer> headMap = new HashMap<Object, Integer>();
//		int i = 1;
//		if (rowHead.getPhysicalNumberOfCells() == column) {
//			rowHead = sheet.getRow(0);
//		} else {
//			rowHead = sheet.getRow(1);
//			i = 2;
//		}
//
//		try {
//			// ----------------这里根据你的表格有多少列
//			while (flag < column) {
//
//				Cell cell = rowHead.getCell(flag);
//				if (getCellValue(cell).toString().equals(field[flag])) {
//					headMap.put(field[flag], flag);
//				}
//
//				flag++;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//
//		}
//
//		// 获得数据的总行数
//		int totalRowNum = sheet.getLastRowNum();
//
//		if (0 == totalRowNum) {
//			return "Excel内没有数据！";
//
//		}
//
//		List<Object> list = new ArrayList<Object>();
//
//		// 获得所有数据
//		for (; i <= totalRowNum; i++) {
//
//			// 获得第i行对象
//			Row row = sheet.getRow(i);
//			Map<String, Object> map = new HashMap<String, Object>();
//			for (int j = 0; j < field.length; j++) {
//				map.put(field[j], row.getCell(headMap.get(field[j])));
//			}
//
//			list.add(map);
//
//		}
//		return list;
//
//	}
//
//	/**
//	 * 描述：对表格中数值进行格式化
//	 *
//	 * @param cell
//	 * @return
//	 */
//	private static Object getCellValue(Cell cell) {
//		Object value = null;
//		DecimalFormat df = new DecimalFormat("0"); // 格式化number String字符
//		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd"); // 日期格式化
//		DecimalFormat df2 = new DecimalFormat("0"); // 格式化数字
//
//		switch (cell.getCellType()) {
//		case Cell.CELL_TYPE_STRING:
//			value = cell.getRichStringCellValue().getString();
//			break;
//		case Cell.CELL_TYPE_NUMERIC:
//			if ("General".equals(cell.getCellStyle().getDataFormatString())) {
//				value = df.format(cell.getNumericCellValue());
//			} else if ("m/d/yy".equals(cell.getCellStyle()
//					.getDataFormatString())) {
//				value = sdf.format(cell.getDateCellValue());
//			} else {
//				value = df2.format(cell.getNumericCellValue());
//			}
//			break;
//		case Cell.CELL_TYPE_BOOLEAN:
//			value = cell.getBooleanCellValue();
//			break;
//		case Cell.CELL_TYPE_BLANK:
//			value = "";
//			break;
//		default:
//			break;
//		}
//		return value;
//	}

}
