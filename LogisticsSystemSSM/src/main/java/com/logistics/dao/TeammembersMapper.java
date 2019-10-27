package com.logistics.dao;

import java.util.Map;

import com.logistics.po.Teammembers;

public interface TeammembersMapper {
	int deleteByPrimaryKey(Integer teammembersid);

	int insert(Teammembers record);

	int insertSelective(Teammembers record);

	Teammembers selectByPrimaryKey(Integer teammembersid);

	int updateByPrimaryKeySelective(Teammembers record);

	int updateByPrimaryKey(Teammembers record);

	@SuppressWarnings("rawtypes")
	public Teammembers findBySQL(Map map);
}