package com.logistics.dao;

import com.logistics.po.Province;

public interface ProvinceMapper {
    int deleteByPrimaryKey(Integer proid);

    int insert(Province record);

    int insertSelective(Province record);

    Province selectByPrimaryKey(Integer proid);

    int updateByPrimaryKeySelective(Province record);

    int updateByPrimaryKey(Province record);
}