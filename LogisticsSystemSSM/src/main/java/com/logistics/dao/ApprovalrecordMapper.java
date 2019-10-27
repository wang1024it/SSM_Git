package com.logistics.dao;

import com.logistics.po.Approvalrecord;

public interface ApprovalrecordMapper {
	int deleteByPrimaryKey(Integer approvalrecordid);

	int insert(Approvalrecord record);

	int insertSelective(Approvalrecord record);

	Approvalrecord selectByPrimaryKey(Integer approvalrecordid);

	int updateByPrimaryKeySelective(Approvalrecord record);

	int updateByPrimaryKey(Approvalrecord record);

	public int deleteByPrimaryorderID(Integer orderformid);
}