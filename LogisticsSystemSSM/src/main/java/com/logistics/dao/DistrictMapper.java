package com.logistics.dao;

import com.logistics.po.District;

public interface DistrictMapper {
    int deleteByPrimaryKey(Integer disid);

    int insert(District record);

    int insertSelective(District record);

    District selectByPrimaryKey(Integer disid);

    int updateByPrimaryKeySelective(District record);

    int updateByPrimaryKey(District record);
}