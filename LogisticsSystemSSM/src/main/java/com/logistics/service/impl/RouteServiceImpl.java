package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.RouteMapper;
import com.logistics.po.Route;
import com.logistics.service.IRouteService;
import com.logistics.vo.RouteVo;

@Transactional
@Service("routeService")
public class RouteServiceImpl implements IRouteService {
	@Autowired
	RouteMapper routeMapper;

	@Override
	public int deleteByPrimaryKey(Integer routeid) {

		return routeMapper.deleteByPrimaryKey(routeid);
	}

	@Override
	public int insert(Route record) {

		return routeMapper.insert(record);
	}

	@Override
	public int insertSelective(Route record) {

		return routeMapper.insertSelective(record);
	}

	@Override
	public Route selectByPrimaryKey(Integer routeid) {

		return routeMapper.selectByPrimaryKey(routeid);
	}

	@Override
	public int updateByPrimaryKeySelective(Route record) {

		return routeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Route record) {

		return routeMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<RouteVo> findPage(@SuppressWarnings("rawtypes") Map map) {

		return routeMapper.findPage(map);
	}

	@Override
	public int getTatolRow(@SuppressWarnings("rawtypes") Map map) {

		return routeMapper.getTatolRow(map);
	}

}
