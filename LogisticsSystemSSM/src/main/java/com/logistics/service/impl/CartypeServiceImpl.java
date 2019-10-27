package com.logistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.CartypeMapper;
import com.logistics.po.Cartype;
import com.logistics.service.ICartypeService;

@Transactional
@Service("cartypeService")
public class CartypeServiceImpl implements ICartypeService {
	@Autowired
	CartypeMapper cartypeMapper;

	@Override
	public int deleteByPrimaryKey(Integer cartypeid) {

		return cartypeMapper.deleteByPrimaryKey(cartypeid);
	}

	@Override
	public int insert(Cartype record) {

		return cartypeMapper.insert(record);
	}

	@Override
	public int insertSelective(Cartype record) {

		return cartypeMapper.insertSelective(record);
	}

	@Override
	public Cartype selectByPrimaryKey(Integer cartypeid) {

		return cartypeMapper.selectByPrimaryKey(cartypeid);
	}

	@Override
	public int updateByPrimaryKeySelective(Cartype record) {

		return cartypeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Cartype record) {

		return cartypeMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Cartype> findAll() {

		return cartypeMapper.findAll();
	}

}
