package com.logistics.dao;

import java.util.List;

import com.logistics.po.Institutionalorganization;

public interface InstitutionalorganizationMapper {
	int deleteByPrimaryKey(Integer institutionalorganizationid);

	int insert(Institutionalorganization record);

	int insertSelective(Institutionalorganization record);

	Institutionalorganization selectByPrimaryKey(
            Integer institutionalorganizationid);

	int updateByPrimaryKeySelective(Institutionalorganization record);

	int updateByPrimaryKey(Institutionalorganization record);

	public List<Institutionalorganization> findAll();
}