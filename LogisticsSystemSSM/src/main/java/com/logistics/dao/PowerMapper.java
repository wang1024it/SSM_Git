package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Power;
import com.logistics.vo.PowerVo;

public interface PowerMapper {
	int deleteByPrimaryKey(Integer powerid);

	int insert(Power record);

	int insertSelective(Power record);

	Power selectByPrimaryKey(Integer powerid);

	int updateByPrimaryKeySelective(Power record);

	int updateByPrimaryKey(Power record);

	public List<PowerVo> findPower(@SuppressWarnings("rawtypes") Map map);

	@SuppressWarnings("rawtypes")
	public int deleteBySql(Map map);
}