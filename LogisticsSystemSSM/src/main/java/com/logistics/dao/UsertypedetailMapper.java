package com.logistics.dao;

import com.logistics.po.Usertypedetail;

public interface UsertypedetailMapper {
    int deleteByPrimaryKey(Integer usertypedetailid);

    int insert(Usertypedetail record);

    int insertSelective(Usertypedetail record);

    Usertypedetail selectByPrimaryKey(Integer usertypedetailid);

    int updateByPrimaryKeySelective(Usertypedetail record);

    int updateByPrimaryKey(Usertypedetail record);
}