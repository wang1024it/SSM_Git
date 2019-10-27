package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.OrderproblemMapper;
import com.logistics.po.Orderproblem;
import com.logistics.service.IOrderproblemService;
import com.logistics.vo.OrderproblemVo;

@Transactional
@Service("orderprobleService")
public class OrderprobleServiceImpl implements IOrderproblemService {
	@Autowired
	OrderproblemMapper orderproblemMapper;

	@Override
	public int deleteByPrimaryKey(Integer orderproblemid) {

		return orderproblemMapper.deleteByPrimaryKey(orderproblemid);
	}

	@Override
	public int insert(Orderproblem record) {

		return orderproblemMapper.insert(record);
	}

	@Override
	public int insertSelective(Orderproblem record) {

		return orderproblemMapper.insertSelective(record);
	}

	@Override
	public Orderproblem selectByPrimaryKey(Integer orderproblemid) {

		return orderproblemMapper.selectByPrimaryKey(orderproblemid);
	}

	@Override
	public int updateByPrimaryKeySelective(Orderproblem record) {

		return orderproblemMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Orderproblem record) {

		return orderproblemMapper.updateByPrimaryKey(record);
	}

	@SuppressWarnings({ "rawtypes" })
	@Override
	public OrderproblemVo findByProbleSQL(Map map) {

		return orderproblemMapper.findByProbleSQL(map);
	}

	@Override
	public List<Orderproblem> findOrderProSQL(
			@SuppressWarnings("rawtypes") Map map) {

		return orderproblemMapper.findOrderProSQL(map);
	}

}
