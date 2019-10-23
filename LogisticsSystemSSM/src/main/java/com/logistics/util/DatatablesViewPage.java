package com.logistics.util;

import java.util.List;

public class DatatablesViewPage<T> {
	private List<T> aaData; // aaData 与datatales 加载的“dataSrc"对应
	private int iTotalDisplayRecords;
	private int iTotalRecords;

	public DatatablesViewPage() {

	}

	/**
	 * @return the aaData
	 */
	public List<T> getAaData() {
		return aaData;
	}

	/**
	 * @param aaData
	 *            the aaData to set
	 */
	public void setAaData(List<T> aaData) {
		this.aaData = aaData;
	}

	/**
	 * @return the iTotalDisplayRecords
	 */
	public int getiTotalDisplayRecords() {
		return iTotalDisplayRecords;
	}

	/**
	 * @param iTotalDisplayRecords
	 *            the iTotalDisplayRecords to set
	 */
	public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
		this.iTotalDisplayRecords = iTotalDisplayRecords;
	}

	/**
	 * @return the iTotalRecords
	 */
	public int getiTotalRecords() {
		return iTotalRecords;
	}

	/**
	 * @param iTotalRecords
	 *            the iTotalRecords to set
	 */
	public void setiTotalRecords(int iTotalRecords) {
		this.iTotalRecords = iTotalRecords;
	}

}
