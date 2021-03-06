package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Orderproblem;
import com.logistics.vo.OrderproblemVo;

public interface OrderproblemMapper {
	int deleteByPrimaryKey(Integer orderproblemid);

	int insert(Orderproblem record);

	int insertSelective(Orderproblem record);

	Orderproblem selectByPrimaryKey(Integer orderproblemid);

	int updateByPrimaryKeySelective(Orderproblem record);

	int updateByPrimaryKey(Orderproblem record);

	public OrderproblemVo findByProbleSQL(@SuppressWarnings("rawtypes") Map map);

	public List<Orderproblem> findOrderProSQL(
            @SuppressWarnings("rawtypes") Map map);
}