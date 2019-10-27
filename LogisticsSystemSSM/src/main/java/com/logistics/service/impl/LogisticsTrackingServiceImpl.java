package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.LogisticstrackingMapper;
import com.logistics.po.Logisticstracking;
import com.logistics.service.ILogisticsTrackingService;

@Transactional
@Service("logisticsTrackingService")
public class LogisticsTrackingServiceImpl implements ILogisticsTrackingService {

	@Autowired
	LogisticstrackingMapper logisticstrackingMapper;

	@Override
	public int deleteByPrimaryKey(Integer logisticstrackingid) {

		return logisticstrackingMapper.deleteByPrimaryKey(logisticstrackingid);
	}

	@Override
	public int insert(Logisticstracking record) {

		return logisticstrackingMapper.insert(record);
	}

	@Override
	public int insertSelective(Logisticstracking record) {

		return logisticstrackingMapper.insertSelective(record);
	}

	@Override
	public Logisticstracking selectByPrimaryKey(Integer logisticstrackingid) {

		return logisticstrackingMapper.selectByPrimaryKey(logisticstrackingid);
	}

	@Override
	public int updateByPrimaryKeySelective(Logisticstracking record) {

		return logisticstrackingMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Logisticstracking record) {

		return logisticstrackingMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Logisticstracking> findLogBySQL(
			@SuppressWarnings("rawtypes") Map map) {

		return logisticstrackingMapper.findLogBySQL(map);
	}

}
