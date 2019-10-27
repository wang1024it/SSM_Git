package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Fundrecord;
import com.logistics.vo.FundRecordVo;

public interface FundrecordMapper {
	int deleteByPrimaryKey(Integer fundrecordid);

	int insert(Fundrecord record);

	int insertSelective(Fundrecord record);

	Fundrecord selectByPrimaryKey(Integer fundrecordid);

	int updateByPrimaryKeySelective(Fundrecord record);

	int updateByPrimaryKey(Fundrecord record);

	public List<Fundrecord> findAllByUserID(Integer userid);

	public List<FundRecordVo> findPage(@SuppressWarnings("rawtypes") Map map);

	public int getTotalRows(@SuppressWarnings("rawtypes") Map map);

}