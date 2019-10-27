package com.logistics.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.ApprovalrecordMapper;
import com.logistics.po.Approvalrecord;
import com.logistics.service.IApprovalrecordService;

@Transactional
@Service("approvalrecordService")
public class ApprovalrecordServiceImpl implements IApprovalrecordService {

	@Autowired
	ApprovalrecordMapper approvalrecordMapper;

	@Override
	public int deleteByPrimaryKey(Integer approvalrecordid) {

		return approvalrecordMapper.deleteByPrimaryKey(approvalrecordid);
	}

	@Override
	public int insert(Approvalrecord record) {

		return approvalrecordMapper.insert(record);
	}

	@Override
	public int insertSelective(Approvalrecord record) {

		return approvalrecordMapper.insertSelective(record);
	}

	@Override
	public Approvalrecord selectByPrimaryKey(Integer approvalrecordid) {

		return approvalrecordMapper.selectByPrimaryKey(approvalrecordid);
	}

	@Override
	public int updateByPrimaryKeySelective(Approvalrecord record) {

		return approvalrecordMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Approvalrecord record) {

		return approvalrecordMapper.updateByPrimaryKey(record);
	}

	@Override
	public int deleteByPrimaryorderID(Integer orderformid) {

		return approvalrecordMapper.deleteByPrimaryorderID(orderformid);
	}

}
