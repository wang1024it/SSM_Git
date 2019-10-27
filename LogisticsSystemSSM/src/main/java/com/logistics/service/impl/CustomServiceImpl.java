package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.CustomMapper;
import com.logistics.po.Custom;
import com.logistics.service.ICustomService;
import com.logistics.vo.CustomVo;

@Transactional
@Service("customService")
public class CustomServiceImpl implements ICustomService {
	@Autowired
	CustomMapper customMapper;

	@Override
	public int deleteByPrimaryKey(Integer customid) {

		return customMapper.deleteByPrimaryKey(customid);
	}

	@Override
	public int insert(Custom record) {

		return customMapper.insert(record);
	}

	@Override
	public int insertSelective(Custom record) {

		return customMapper.insertSelective(record);
	}

	@Override
	public Custom selectByPrimaryKey(Integer customid) {

		return customMapper.selectByPrimaryKey(customid);
	}

	@Override
	public int updateByPrimaryKeySelective(Custom record) {

		return customMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Custom record) {

		return customMapper.updateByPrimaryKey(record);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Custom> findCustomBySQL(Map map) {

		return customMapper.findCustomBySQL(map);
	}

	@Override
	public List<Custom> findAll() {

		return customMapper.findAll();
	}

	@Override
	public Custom login(String phonenumber, String loginpassword) {

		return customMapper.login(phonenumber, loginpassword);
	}

	@Override
	public CustomVo findCustomInformation(@SuppressWarnings("rawtypes") Map map) {

		return customMapper.findCustomInformation(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<CustomVo> findPage(Map map) {

		return customMapper.findPage(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalRow(Map map) {

		return customMapper.getTotalRow(map);
	}

}
