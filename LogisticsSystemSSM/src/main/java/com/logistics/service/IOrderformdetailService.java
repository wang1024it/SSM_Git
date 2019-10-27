package com.logistics.service;

import java.util.List;
import java.util.Map;

import com.logistics.po.Orderformdetail;
import com.logistics.vo.OrderformDetailVo;

public interface IOrderformdetailService {
	int deleteByPrimaryKey(Integer orderformdetailid);

	int insert(Orderformdetail record);

	int insertSelective(Orderformdetail record);

	Orderformdetail selectByPrimaryKey(Integer orderformdetailid);

	int updateByPrimaryKeySelective(Orderformdetail record);

	int updateByPrimaryKey(Orderformdetail record);

	public List<OrderformDetailVo> findBySQL(Map<String, String> map);

	public int deleteByOrderformID(Integer orderformID);
}
