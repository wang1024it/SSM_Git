package com.logistics.dao;

import com.logistics.po.Operate;

public interface OperateMapper {
    int deleteByPrimaryKey(Integer operateid);

    int insert(Operate record);

    int insertSelective(Operate record);

    Operate selectByPrimaryKey(Integer operateid);

    int updateByPrimaryKeySelective(Operate record);

    int updateByPrimaryKey(Operate record);
}