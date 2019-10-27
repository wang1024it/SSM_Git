package com.logistics.service;

import java.util.List;
import java.util.Map;

import com.logistics.po.Car;
import com.logistics.vo.CarVo;

public interface ICarService {

	int deleteByPrimaryKey(Integer carid);

	int insert(Car record);

	int insertSelective(Car record);

	Car selectByPrimaryKey(Integer carid);

	int updateByPrimaryKeySelective(Car record);

	int updateByPrimaryKey(Car record);

	public CarVo findByUserID(int UserID);

	public List<Car> findAll();

	@SuppressWarnings("rawtypes")
	public List<Car> findPage(Map map);

	@SuppressWarnings("rawtypes")
	public int getTotalRow(Map map);

	@SuppressWarnings("rawtypes")
	public List<CarVo> findPageBySQL(Map map);

	@SuppressWarnings("rawtypes")
	public int getTotalRowBySQL(Map map);

	@SuppressWarnings("rawtypes")
	public Car findCar(Map Map);

	public CarVo findCarSql(@SuppressWarnings("rawtypes") Map map);
}
