package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.InformationMapper;
import com.logistics.po.Information;
import com.logistics.service.IInformationService;

@Transactional
@Service("informationService")
public class InformationServiceImpl implements IInformationService {

	@Autowired
	InformationMapper informationMapper;

	@Override
	public int deleteByPrimaryKey(Integer informationid) {

		return informationMapper.deleteByPrimaryKey(informationid);
	}

	@Override
	public int insert(Information record) {

		return informationMapper.insert(record);
	}

	@Override
	public int insertSelective(Information record) {

		return informationMapper.insertSelective(record);
	}

	@Override
	public Information selectByPrimaryKey(Integer informationid) {

		return informationMapper.selectByPrimaryKey(informationid);
	}

	@Override
	public int updateByPrimaryKeySelective(Information record) {

		return informationMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Information record) {

		return informationMapper.updateByPrimaryKey(record);
	}

	@Override
	public Information findInformation() {

		return informationMapper.findInformation();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Information> findPage(Map map) {

		return informationMapper.findPage(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalRow(Map map) {

		return informationMapper.getTotalRow(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Information> findBySQL(Map map) {

		return informationMapper.findBySQL(map);
	}

}
