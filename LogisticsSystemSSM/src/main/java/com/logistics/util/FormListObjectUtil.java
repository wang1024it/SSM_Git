package com.logistics.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.logistics.entity.BMrchandise;
import com.logistics.entity.BOrderformdetail;

public class FormListObjectUtil implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 4166898122430943886L;

	private List<String> titleList;

	private List<String> contentList;

	private ArrayList<BMrchandise> Mrchlist;

	private List<BOrderformdetail> orderformdetaillist;

	private List<String> filelist;

	public FormListObjectUtil() {

		Mrchlist = new ArrayList<BMrchandise>();
		orderformdetaillist = new ArrayList<BOrderformdetail>();
	}

	/**
	 * @return the mrchlist
	 */
	public ArrayList<BMrchandise> getMrchlist() {
		return Mrchlist;
	}

	/**
	 * @param mrchlist
	 *            the mrchlist to set
	 */
	public void setMrchlist(ArrayList<BMrchandise> mrchlist) {
		Mrchlist = mrchlist;
	}

	/**
	 * @return the orderformdetaillist
	 */
	public List<BOrderformdetail> getOrderformdetaillist() {
		return orderformdetaillist;
	}

	/**
	 * @param orderformdetaillist
	 *            the orderformdetaillist to set
	 */
	public void setOrderformdetaillist(List<BOrderformdetail> orderformdetaillist) {
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
