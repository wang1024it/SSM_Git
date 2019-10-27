package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.ReceivablesMapper;
import com.logistics.po.Receivables;
import com.logistics.service.IReceivablesService;

@Transactional
@Service("receivablesService")
public class ReceivablesServiceImpl implements IReceivablesService {
	@Autowired
	ReceivablesMapper receivablesMapper;

	@Override
	public int deleteByPrimaryKey(Integer receivablesid) {

		return receivablesMapper.deleteByPrimaryKey(receivablesid);
	}

	@Override
	public int insert(Receivables record) {

		return receivablesMapper.insert(record);
	}

	@Override
	public int insertSelective(Receivables record) {

		return receivablesMapper.insertSelective(record);
	}

	@Override
	public Receivables selectByPrimaryKey(Integer receivablesid) {

		return receivablesMapper.selectByPrimaryKey(receivablesid);
	}

	@Override
	public int updateByPrimaryKeySelective(Receivables record) {

		return receivablesMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Receivables record) {

		return receivablesMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Receivables> findAllSQL(Map<String, String> map) {

		return receivablesMapper.findAllSQL(map);
	}

}
