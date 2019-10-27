package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.PowerMapper;
import com.logistics.po.Power;
import com.logistics.service.IPowerService;
import com.logistics.vo.PowerVo;

@Transactional
@Service("powerService")
public class PowerServiceImpl implements IPowerService {

	@Autowired
	PowerMapper powerMapper;

	@SuppressWarnings("rawtypes")
	@Override
	public List<PowerVo> findPower(Map map) {

		return powerMapper.findPower(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int deleteBySql(Map map) {

		return powerMapper.deleteBySql(map);
	}

	@Override
	public int deleteByPrimaryKey(Integer powerid) {

		return powerMapper.deleteByPrimaryKey(powerid);
	}

	@Override
	public int insert(Power record) {

		return powerMapper.insert(record);
	}

	@Override
	public int insertSelective(Power record) {

		return powerMapper.insertSelective(record);
	}

	@Override
	public Power selectByPrimaryKey(Integer powerid) {

		return powerMapper.selectByPrimaryKey(powerid);
	}

	@Override
	public int updateByPrimaryKeySelective(Power record) {

		return powerMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Power record) {

		return powerMapper.updateByPrimaryKey(record);
	}

}
