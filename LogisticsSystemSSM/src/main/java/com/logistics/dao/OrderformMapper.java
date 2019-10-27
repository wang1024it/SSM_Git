package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Orderform;
import com.logistics.vo.OrderformVo;

public interface OrderformMapper {
	int deleteByPrimaryKey(Integer orderformid);

	int insert(Orderform record);

	int insertSelective(Orderform record);

	Orderform selectByPrimaryKey(Integer orderformid);

	int updateByPrimaryKeySelective(Orderform record);

	int updateByPrimaryKey(Orderform record);

	public List<Orderform> findOrderformBySQL(
            @SuppressWarnings("rawtypes") Map map);

	public List<OrderformVo> findPage(@SuppressWarnings("rawtypes") Map map);

	public int getTotalRow(@SuppressWarnings("rawtypes") Map map);

	public List<OrderformVo> findPageOrder(@SuppressWarnings("rawtypes") Map map);

	public int getTotalRowOrder(@SuppressWarnings("rawtypes") Map map);

	public int insertReturnID(Orderform orderform);

	@SuppressWarnings("rawtypes")
	public OrderformVo findByOrderformID(Map map);

	public List<OrderformVo> findOrderBySql(
            @SuppressWarnings("rawtypes") Map map);

	public List<OrderformVo> findTimeAndCount(
            @SuppressWarnings("rawtypes") Map map);

	public OrderformVo findOrderVo(@SuppressWarnings("rawtypes") Map map);

	public List<Orderform> selectOrderNumber();
}