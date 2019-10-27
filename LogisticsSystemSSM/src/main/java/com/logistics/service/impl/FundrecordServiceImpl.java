package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.FundrecordMapper;
import com.logistics.po.Fundrecord;
import com.logistics.service.IFundrecordService;
import com.logistics.vo.FundRecordVo;

@Transactional
@Service("fundrecordService")
public class FundrecordServiceImpl implements IFundrecordService {
	@Autowired
	FundrecordMapper fundrecordMapper;

	@Override
	public int deleteByPrimaryKey(Integer fundrecordid) {

		return fundrecordMapper.deleteByPrimaryKey(fundrecordid);
	}

	@Override
	public int insert(Fundrecord record) {

		return fundrecordMapper.insert(record);
	}

	@Override
	public int insertSelective(Fundrecord record) {

		return fundrecordMapper.insertSelective(record);
	}

	@Override
	public Fundrecord selectByPrimaryKey(Integer fundrecordid) {

		return fundrecordMapper.selectByPrimaryKey(fundrecordid);
	}

	@Override
	public int updateByPrimaryKeySelective(Fundrecord record) {

		return fundrecordMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Fundrecord record) {

		return fundrecordMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Fundrecord> findAllByUserID(Integer userid) {

		return fundrecordMapper.findAllByUserID(userid);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<FundRecordVo> findPage(Map map) {

		return fundrecordMapper.findPage(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalRows(Map map) {

		return fundrecordMapper.getTotalRows(map);
	}

}
