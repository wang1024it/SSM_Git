package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.OrderformMapper;
import com.logistics.po.Orderform;
import com.logistics.service.IOrderformService;
import com.logistics.vo.OrderformVo;

@Transactional
@Service("orderformService")
public class OrderformServiceImpl implements IOrderformService {

	@Autowired
	OrderformMapper orderformMapper;

	@Override
	public int deleteByPrimaryKey(Integer orderformid) {

		return orderformMapper.deleteByPrimaryKey(orderformid);
	}

	@Override
	public int insert(Orderform record) {

		return orderformMapper.insert(record);
	}

	@Override
	public int insertSelective(Orderform record) {

		return orderformMapper.insertSelective(record);
	}

	@Override
	public Orderform selectByPrimaryKey(Integer orderformid) {

		return orderformMapper.selectByPrimaryKey(orderformid);
	}

	@Override
	public int updateByPrimaryKeySelective(Orderform record) {

		return orderformMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Orderform record) {

		return orderformMapper.updateByPrimaryKey(record);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Orderform> findOrderformBySQL(Map map) {

		return orderformMapper.findOrderformBySQL(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<OrderformVo> findPage(Map map) {

		return orderformMapper.findPage(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalRow(Map map) {

		return orderformMapper.getTotalRow(map);
	}

	@Override
	public List<OrderformVo> findPageOrder(@SuppressWarnings("rawtypes") Map map) {

		return orderformMapper.findPageOrder(map);
	}

	@Override
	public int getTotalRowOrder(@SuppressWarnings("rawtypes") Map map) {

		return orderformMapper.getTotalRowOrder(map);
	}

	@Override
	public int insertReturnID(Orderform orderform) {

		return orderformMapper.insertReturnID(orderform);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public OrderformVo findByOrderformID(Map map) {

		return orderformMapper.findByOrderformID(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<OrderformVo> findOrderBySql(Map map) {

		return orderformMapper.findOrderBySql(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<OrderformVo> findTimeAndCount(Map map) {

		return orderformMapper.findTimeAndCount(map);
	}

	@Override
	public OrderformVo findOrderVo(@SuppressWarnings("rawtypes") Map map) {

		return orderformMapper.findOrderVo(map);
	}

	@Override
	public List<Orderform> selectOrderNumber() {

		return orderformMapper.selectOrderNumber();
	}
}
