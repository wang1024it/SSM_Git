package com.logistics.dao;

import java.util.List;

import com.logistics.po.Customertype;

public interface CustomertypeMapper {
	int deleteByPrimaryKey(Integer customertypeid);

	int insert(Customertype record);

	int insertSelective(Customertype record);

	Customertype selectByPrimaryKey(Integer customertypeid);

	int updateByPrimaryKeySelective(Customertype record);

	int updateByPrimaryKey(Customertype record);

	public List<Customertype> findAll();
}