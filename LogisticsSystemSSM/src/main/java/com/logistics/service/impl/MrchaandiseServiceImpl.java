package com.logistics.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.MrchandiseMapper;
import com.logistics.po.Mrchandise;
import com.logistics.service.IMrchandiseService;

@Transactional
@Service("mrchaandiseService")
public class MrchaandiseServiceImpl implements IMrchandiseService {
	@Autowired
	MrchandiseMapper mrchandiseMapper;

	@Override
	public int deleteByPrimaryKey(Integer mrchandiseid) {

		return mrchandiseMapper.deleteByPrimaryKey(mrchandiseid);
	}

	@Override
	public int insert(Mrchandise record) {

		return mrchandiseMapper.insert(record);
	}

	@Override
	public int insertSelective(Mrchandise record) {

		return mrchandiseMapper.insertSelective(record);
	}

	@Override
	public Mrchandise selectByPrimaryKey(Integer mrchandiseid) {

		return mrchandiseMapper.selectByPrimaryKey(mrchandiseid);
	}

	@Override
	public int updateByPrimaryKeySelective(Mrchandise record) {

		return mrchandiseMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Mrchandise record) {

		return mrchandiseMapper.updateByPrimaryKey(record);
	}

	@Override
	public int insertReturnID(Mrchandise record) {
		
		return mrchandiseMapper.insertReturnID(record);
	}

	

}
