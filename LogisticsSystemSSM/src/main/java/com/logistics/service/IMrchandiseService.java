package com.logistics.service;

import com.logistics.po.Mrchandise;

public interface IMrchandiseService {
	int deleteByPrimaryKey(Integer mrchandiseid);

	int insert(Mrchandise record);

	int insertSelective(Mrchandise record);

	Mrchandise selectByPrimaryKey(Integer mrchandiseid);

	int updateByPrimaryKeySelective(Mrchandise record);

	int updateByPrimaryKey(Mrchandise record);

	public int insertReturnID(Mrchandise record);


}
