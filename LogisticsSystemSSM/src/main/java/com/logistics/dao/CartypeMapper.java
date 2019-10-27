package com.logistics.dao;

import java.util.List;

import com.logistics.po.Cartype;

public interface CartypeMapper {
	int deleteByPrimaryKey(Integer cartypeid);

	int insert(Cartype record);

	int insertSelective(Cartype record);

	Cartype selectByPrimaryKey(Integer cartypeid);

	int updateByPrimaryKeySelective(Cartype record);

	int updateByPrimaryKey(Cartype record);

	public List<Cartype> findAll();
}