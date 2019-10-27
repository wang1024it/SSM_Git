package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Cancel;
import com.logistics.vo.CancelVo;

public interface CancelMapper {
	int deleteByPrimaryKey(Integer cancelid);

	int insert(Cancel record);

	int insertSelective(Cancel record);

	Cancel selectByPrimaryKey(Integer cancelid);

	int updateByPrimaryKeySelective(Cancel record);

	int updateByPrimaryKey(Cancel record);

	@SuppressWarnings("rawtypes")
	public List<Cancel> findCancelBySQL(Map map);

	public List<CancelVo> findCancelVo(@SuppressWarnings("rawtypes") Map map);
}