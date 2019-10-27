package com.logistics.vo;

import com.logistics.po.Orderproblem;

public class OrderproblemVo extends Orderproblem {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7301809301908954832L;
	/**
	 * 车队名称
	 */
	private String motorcadeName;
	/**
	 * 用户名称
	 */
	private String userName;
	/**
	 * 解决人名称
	 */
	private String solutionman;

	/**
	 * 车队ID
	 */
	private Integer motorcadeID;
	/**
	 * 车队成员ID
	 */
	private Integer teamMembersID;
	/**
	 * 委任ID
	 */
	private Integer procuratoryID;

	/**
	 * @return the motorcadeName
	 */
	public String getMotorcadeName() {
		return motorcadeName;
	}

	/**
	 * @param motorcadeName
	 *            the motorcadeName to set
	 */
	public void setMotorcadeName(String motorcadeName) {
		this.motorcadeName = motorcadeName;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName
	 *            the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the motorcadeID
	 */
	public Integer getMotorcadeID() {
		return motorcadeID;
	}

	/**
	 * @param motorcadeID
	 *            the motorcadeID to set
	 */
	public void setMotorcadeID(Integer motorcadeID) {
		this.motorcadeID = motorcadeID;
	}

	/**
	 * @return the teamMembersID
	 */
	public Integer getTeamMembersID() {
		return teamMembersID;
	}

	/**
	 * @param teamMembersID
	 *            the teamMembersID to set
	 */
	public void setTeamMembersID(Integer teamMembersID) {
		this.teamMembersID = teamMembersID;
	}

	/**
	 * @return the procuratoryID
	 */
	public Integer getProcuratoryID() {
		return procuratoryID;
	}

	/**
	 * @param procuratoryID
	 *            the procuratoryID to set
	 */
	public void setProcuratoryID(Integer procuratoryID) {
		this.procuratoryID = procuratoryID;
	}

	/**
	 * @return the solutionman
	 */
	public String getSolutionman() {
		return solutionman;
	}

	/**
	 * @param solutionman
	 *            the solutionman to set
	 */
	public void setSolutionman(String solutionman) {
		this.solutionman = solutionman;
	}

}
