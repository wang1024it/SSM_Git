package com.logistics.dao;

import java.util.List;

import com.logistics.po.Transportmode;

public interface TransportmodeMapper {
	int deleteByPrimaryKey(Integer transportmodeid);

	int insert(Transportmode record);

	int insertSelective(Transportmode record);

	Transportmode selectByPrimaryKey(Integer transportmodeid);

	int updateByPrimaryKeySelective(Transportmode record);

	int updateByPrimaryKey(Transportmode record);

	public List<Transportmode> findAll();

}