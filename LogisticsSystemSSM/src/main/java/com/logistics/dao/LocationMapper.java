package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Location;
import com.logistics.vo.LocationVo;

public interface LocationMapper {
	int deleteByPrimaryKey(Integer locationid);

	int insert(Location record);

	int insertSelective(Location record);

	Location selectByPrimaryKey(Integer locationid);

	int updateByPrimaryKeySelective(Location record);

	int updateByPrimaryKey(Location record);

	public List<LocationVo> findPage(@SuppressWarnings("rawtypes") Map map);

	public int getRowTotal(@SuppressWarnings("rawtypes") Map map);

	public Location findLocationSQL(@SuppressWarnings("rawtypes") Map map);

}