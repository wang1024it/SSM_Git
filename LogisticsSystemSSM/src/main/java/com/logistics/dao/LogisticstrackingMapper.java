package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Logisticstracking;

public interface LogisticstrackingMapper {
	int deleteByPrimaryKey(Integer logisticstrackingid);

	int insert(Logisticstracking record);

	int insertSelective(Logisticstracking record);

	Logisticstracking selectByPrimaryKey(Integer logisticstrackingid);

	int updateByPrimaryKeySelective(Logisticstracking record);

	int updateByPrimaryKey(Logisticstracking record);

	public List<Logisticstracking> findLogBySQL(
            @SuppressWarnings("rawtypes") Map map);
}