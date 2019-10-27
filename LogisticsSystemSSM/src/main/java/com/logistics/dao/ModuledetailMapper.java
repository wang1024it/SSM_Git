package com.logistics.dao;

import com.logistics.po.Moduledetail;

public interface ModuledetailMapper {
    int deleteByPrimaryKey(Integer moduledetailid);

    int insert(Moduledetail record);

    int insertSelective(Moduledetail record);

    Moduledetail selectByPrimaryKey(Integer moduledetailid);

    int updateByPrimaryKeySelective(Moduledetail record);

    int updateByPrimaryKey(Moduledetail record);
}