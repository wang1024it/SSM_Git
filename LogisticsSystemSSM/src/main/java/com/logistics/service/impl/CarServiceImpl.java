package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.CarMapper;
import com.logistics.po.Car;
import com.logistics.service.ICarService;
import com.logistics.vo.CarVo;

@Transactional
@Service("carService")
public class CarServiceImpl implements ICarService {

	@Autowired
	CarMapper carMapper;

	@Override
	public int deleteByPrimaryKey(Integer carid) {

		return carMapper.deleteByPrimaryKey(carid);
	}

	@Override
	public int insert(Car record) {

		return carMapper.insert(record);
	}

	@Override
	public int insertSelective(Car record) {

		return carMapper.insertSelective(record);
	}

	@Override
	public Car selectByPrimaryKey(Integer carid) {

		return carMapper.selectByPrimaryKey(carid);
	}

	@Override
	public int updateByPrimaryKeySelective(Car record) {

		return carMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Car record) {

		return carMapper.updateByPrimaryKey(record);
	}

	@Override
	public CarVo findByUserID(int UserID) {

		return carMapper.findByUserID(UserID);
	}

	@Override
	public List<Car> findAll() {

		return carMapper.findAll();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Car> findPage(Map map) {

		return carMapper.findPage(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalRow(Map map) {

		return carMapper.getTotalRow(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<CarVo> findPageBySQL(Map map) {

		return carMapper.findPageBySQL(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalRowBySQL(Map map) {

		return carMapper.getTotalRowBySQL(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Car findCar(Map map) {

		return carMapper.findCar(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public CarVo findCarSql(Map map) {

		return carMapper.findCarSql(map);
	}

}
