package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.UserMapper;
import com.logistics.po.User;
import com.logistics.service.IUserService;
import com.logistics.util.MD5Util;
import com.logistics.vo.UserVo;

@Transactional
@Service("iUsersService")
public class UserServiceImpl implements IUserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public User login(String PhoneNumber, String Password) {
		Password = MD5Util.getMD5(Password);
		return userMapper.login(PhoneNumber, Password);
	}

	@Override
	public int deleteByPrimaryKey(Integer userid) {

		return userMapper.deleteByPrimaryKey(userid);
	}

	@Override
	public int insert(User record) {

		return userMapper.insert(record);
	}

	@Override
	public int insertSelective(User record) {

		return userMapper.insertSelective(record);
	}

	@Override
	public User selectByPrimaryKey(Integer userid) {

		return userMapper.selectByPrimaryKey(userid);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {

		return userMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(User record) {

		return userMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<UserVo> findUserBySQL(@SuppressWarnings("rawtypes") Map map) {

		return userMapper.findUserBySQL(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<User> findAllBySql(Map map) {

		return userMapper.findAllBySql(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<User> findPage(Map map) {

		return userMapper.findPage(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalRow(Map map) {

		return userMapper.getTotalRow(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<User> findAll(Map map) {

		return userMapper.findAll(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<UserVo> findPageUserVo(Map map) {

		return userMapper.findPageUserVo(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalRowUserVo(Map map) {
		return userMapper.getTotalRowUserVo(map);
	}

	@Override
	public int insertReturnID(User record) {

		return userMapper.insertReturnID(record);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<UserVo> findUserCar(Map map) {

		return userMapper.findUserCar(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public UserVo findUserInFor(Map map) {

		return userMapper.findUserInFor(map);
	}

}
