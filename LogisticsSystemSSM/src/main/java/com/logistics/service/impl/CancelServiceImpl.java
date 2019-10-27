package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.CancelMapper;
import com.logistics.po.Cancel;
import com.logistics.service.ICancelService;
import com.logistics.vo.CancelVo;

@Transactional
@Service("cancelService")
public class CancelServiceImpl implements ICancelService {
	@Autowired
	CancelMapper cancelMapper;

	@Override
	public int deleteByPrimaryKey(Integer cancelid) {

		return cancelMapper.deleteByPrimaryKey(cancelid);
	}

	@Override
	public int insert(Cancel record) {

		return cancelMapper.insert(record);
	}

	@Override
	public int insertSelective(Cancel record) {

		return cancelMapper.insertSelective(record);
	}

	@Override
	public Cancel selectByPrimaryKey(Integer cancelid) {

		return cancelMapper.selectByPrimaryKey(cancelid);
	}

	@Override
	public int updateByPrimaryKeySelective(Cancel record) {

		return cancelMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Cancel record) {

		return cancelMapper.updateByPrimaryKey(record);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Cancel> findCancelBySQL(Map map) {

		return cancelMapper.findCancelBySQL(map);
	}

	@Override
	public List<CancelVo> findCancelVo(@SuppressWarnings("rawtypes") Map map) {

		return cancelMapper.findCancelVo(map);
	}

}
