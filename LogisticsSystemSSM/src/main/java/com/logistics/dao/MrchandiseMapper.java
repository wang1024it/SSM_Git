package com.logistics.dao;

import com.logistics.po.Mrchandise;

public interface MrchandiseMapper {
	int deleteByPrimaryKey(Integer mrchandiseid);

	int insert(Mrchandise record);

	int insertSelective(Mrchandise record);

	Mrchandise selectByPrimaryKey(Integer mrchandiseid);

	int updateByPrimaryKeySelective(Mrchandise record);

	int updateByPrimaryKey(Mrchandise record);

	public int insertReturnID(Mrchandise record);


}