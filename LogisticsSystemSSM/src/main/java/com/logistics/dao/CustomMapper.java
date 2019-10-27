package com.logistics.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.logistics.po.Custom;
import com.logistics.vo.CustomVo;

public interface CustomMapper {
	int deleteByPrimaryKey(Integer customid);

	int insert(Custom record);

	int insertSelective(Custom record);

	Custom selectByPrimaryKey(Integer customid);

	int updateByPrimaryKeySelective(Custom record);

	int updateByPrimaryKey(Custom record);

	public List<Custom> findAll();

	@SuppressWarnings("rawtypes")
	public List<Custom> findCustomBySQL(Map map);

	public Custom login(@Param("phonenumber") String phonenumber,
                        @Param("loginpassword") String loginpassword);

	public CustomVo findCustomInformation(@SuppressWarnings("rawtypes") Map map);

	@SuppressWarnings("rawtypes")
	public List<CustomVo> findPage(Map map);

	@SuppressWarnings("rawtypes")
	public int getTotalRow(Map map);

}