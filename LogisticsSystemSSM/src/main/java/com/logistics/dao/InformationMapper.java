package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Information;

public interface InformationMapper {
	int deleteByPrimaryKey(Integer informationid);

	int insert(Information record);

	int insertSelective(Information record);

	Information selectByPrimaryKey(Integer informationid);

	int updateByPrimaryKeySelective(Information record);

	int updateByPrimaryKey(Information record);

	public Information findInformation();

	@SuppressWarnings("rawtypes")
	public List<Information> findPage(Map map);

	@SuppressWarnings("rawtypes")
	public int getTotalRow(Map map);

	@SuppressWarnings("rawtypes")
	public List<Information> findBySQL(Map map);

}