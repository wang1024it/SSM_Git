package com.logistics.dao;

import java.util.List;

import com.logistics.po.Usertype;

public interface UsertypeMapper {
	int deleteByPrimaryKey(Integer usertypeid);

	int insert(Usertype record);

	int insertSelective(Usertype record);

	Usertype selectByPrimaryKey(Integer usertypeid);

	int updateByPrimaryKeySelective(Usertype record);

	int updateByPrimaryKey(Usertype record);

	public List<Usertype> findAll();
}