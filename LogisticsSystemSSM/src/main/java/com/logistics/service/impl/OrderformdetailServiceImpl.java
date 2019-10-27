package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.OrderformdetailMapper;
import com.logistics.po.Orderformdetail;
import com.logistics.service.IOrderformdetailService;
import com.logistics.vo.OrderformDetailVo;

@Transactional
@Service("orderformdetailService")
public class OrderformdetailServiceImpl implements IOrderformdetailService {
	@Autowired
	OrderformdetailMapper orderformdetailMapper;

	@Override
	public int deleteByPrimaryKey(Integer orderformdetailid) {
		 
		return orderformdetailMapper.deleteByPrimaryKey(orderformdetailid);
	}

	@Override
	public int insert(Orderformdetail record) {
		 
		return orderformdetailMapper.insert(record);
	}

	@Override
	public int insertSelective(Orderformdetail record) {
		 
		return orderformdetailMapper.insertSelective(record);
	}

	@Override
	public Orderformdetail selectByPrimaryKey(Integer orderformdetailid) {
		 
		return orderformdetailMapper.selectByPrimaryKey(orderformdetailid);
	}

	@Override
	public int updateByPrimaryKeySelective(Orderformdetail record) {
		 
		return orderformdetailMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Orderformdetail record) {
		 
		return orderformdetailMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<OrderformDetailVo> findBySQL(Map<String, String> map) {
		
		return orderformdetailMapper.findBySQL(map);
	}

	@Override
	public int deleteByOrderformID(Integer orderformID) {
		
		return orderformdetailMapper.deleteByOrderformID(orderformID);
	}

}
