package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Dot;
import com.logistics.vo.DotVo;

public interface DotMapper {
	int deleteByPrimaryKey(Integer dotid);

	int insert(Dot record);

	int insertSelective(Dot record);

	Dot selectByPrimaryKey(Integer dotid);

	int updateByPrimaryKeySelective(Dot record);

	int updateByPrimaryKey(Dot record);

	public List<DotVo> findPage(@SuppressWarnings("rawtypes") Map map);

	public int getTotalRow(@SuppressWarnings("rawtypes") Map map);
}