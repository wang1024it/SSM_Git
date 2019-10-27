package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Route;
import com.logistics.vo.RouteVo;

public interface RouteMapper {
	int deleteByPrimaryKey(Integer routeid);

	int insert(Route record);

	int insertSelective(Route record);

	Route selectByPrimaryKey(Integer routeid);

	int updateByPrimaryKeySelective(Route record);

	int updateByPrimaryKey(Route record);

	public List<RouteVo> findPage(@SuppressWarnings("rawtypes") Map map);

	public int getTatolRow(@SuppressWarnings("rawtypes") Map map);
}