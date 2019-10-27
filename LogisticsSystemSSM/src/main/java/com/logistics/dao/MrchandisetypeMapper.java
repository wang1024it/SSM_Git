package com.logistics.dao;

import java.util.List;

import com.logistics.po.Mrchandisetype;

public interface MrchandisetypeMapper {
	int deleteByPrimaryKey(Integer mrchandisetypeid);

	int insert(Mrchandisetype record);

	int insertSelective(Mrchandisetype record);

	Mrchandisetype selectByPrimaryKey(Integer mrchandisetypeid);

	int updateByPrimaryKeySelective(Mrchandisetype record);

	int updateByPrimaryKey(Mrchandisetype record);

	public List<Mrchandisetype> findAll();
}