package com.logistics.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.logistics.po.User;
import com.logistics.vo.UserVo;

public interface UserMapper {
	int deleteByPrimaryKey(Integer userid);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer userid);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);

	public int insertReturnID(User record);

	public User login(@Param("phonenumber") String phonenumber,
                      @Param("loginpassword") String loginpassword);

	@SuppressWarnings("rawtypes")
	public List<User> findAllBySql(Map map);

	@SuppressWarnings("rawtypes")
	public int getTotalRow(Map map);

	@SuppressWarnings("rawtypes")
	public List<User> findPage(Map map);

	public List<UserVo> findUserBySQL(@SuppressWarnings("rawtypes") Map map);

	public List<User> findAll(@SuppressWarnings("rawtypes") Map map);

	@SuppressWarnings("rawtypes")
	public List<UserVo> findPageUserVo(Map map);

	@SuppressWarnings("rawtypes")
	public int getTotalRowUserVo(Map map);

	@SuppressWarnings("rawtypes")
	public List<UserVo> findUserCar(Map map);

	@SuppressWarnings("rawtypes")
	public UserVo findUserInFor(Map map);
}