package com.logistics.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.logistics.po.Mrchandise;
import com.logistics.po.Orderformdetail;

public class FormListObjectUtil implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 4166898122430943886L;

	private List<String> titleList;

	private List<String> contentList;

	private ArrayList<Mrchandise> Mrchlist;

	private List<Orderformdetail> orderformdetaillist;

	private List<String> filelist;

	public FormListObjectUtil() {

		Mrchlist = new ArrayList<Mrchandise>();
		orderformdetaillist = new ArrayList<Orderformdetail>();
	}

	/**
	 * @return the mrchlist
	 */
	public ArrayList<Mrchandise> getMrchlist() {
		return Mrchlist;
	}

	/**
	 * @param mrchlist
	 *            the mrchlist to set
	 */
	public void setMrchlist(ArrayList<Mrchandise> mrchlist) {
		Mrchlist = mrchlist;
	}

	/**
	 * @return the orderformdetaillist
	 */
	public List<Orderformdetail> getOrderformdetaillist() {
		return orderformdetaillist;
	}

	/**
	 * @param orderformdetaillist
	 *            the orderformdetaillist to set
	 */
	public void setOrderformdetaillist(List<Orderformdetail> orderformdetaillist) {
		this.orderformdetaillist = orderformdetaillist;
	}

	/**
	 * @return the filelist
	 */
	public List<String> getFilelist() {
		return filelist;
	}

	/**
	 * @param filelist
	 *            the filelist to set
	 */
	public void setFilelist(List<String> filelist) {
		this.filelist = filelist;
	}

	/**
	 * @return the titleList
	 */
	public List<String> getTitleList() {
		return titleList;
	}

	/**
	 * @param titleList
	 *            the titleList to set
	 */
	public void setTitleList(List<String> titleList) {
		this.titleList = titleList;
	}

	/**
	 * @return the contentList
	 */
	public List<String> getContentList() {
		return contentList;
	}

	/**
	 * @param contentList
	 *            the contentList to set
	 */
	public void setContentList(List<String> contentList) {
		this.contentList = contentList;
	}

}
