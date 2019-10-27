package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.DotMapper;
import com.logistics.po.Dot;
import com.logistics.service.IDotService;
import com.logistics.vo.DotVo;

@Transactional
@Service("dotService")
public class DotServiceImpl implements IDotService {
	@Autowired
	DotMapper dotMapper;

	@Override
	public int deleteByPrimaryKey(Integer dotid) {

		return dotMapper.deleteByPrimaryKey(dotid);
	}

	@Override
	public int insert(Dot record) {

		return dotMapper.insert(record);
	}

	@Override
	public int insertSelective(Dot record) {

		return dotMapper.insertSelective(record);
	}

	@Override
	public Dot selectByPrimaryKey(Integer dotid) {

		return dotMapper.selectByPrimaryKey(dotid);
	}

	@Override
	public int updateByPrimaryKeySelective(Dot record) {

		return dotMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Dot record) {

		return dotMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<DotVo> findPage(@SuppressWarnings("rawtypes") Map map) {

		return dotMapper.findPage(map);
	}

	@Override
	public int getTotalRow(@SuppressWarnings("rawtypes") Map map) {

		return dotMapper.getTotalRow(map);
	}

}
