package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Receivables;

public interface ReceivablesMapper {
	int deleteByPrimaryKey(Integer receivablesid);

	int insert(Receivables record);

	int insertSelective(Receivables record);

	Receivables selectByPrimaryKey(Integer receivablesid);

	int updateByPrimaryKeySelective(Receivables record);

	int updateByPrimaryKey(Receivables record);

	public List<Receivables> findAllSQL(Map<String, String> map);
}