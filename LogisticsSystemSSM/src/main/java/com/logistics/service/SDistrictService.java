package com.logistics.service;

import com.logistics.entity.SDistrict;
import java.util.List;

/**
 * (SDistrict)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SDistrictService {

    /**
     * 通过ID查询单条数据
     *
     * @param disid 主键
     * @return 实例对象
     */
    SDistrict queryById(Integer disid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SDistrict> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sDistrict 实例对象
     * @return 实例对象
     */
    SDistrict insert(SDistrict sDistrict);

    /**
     * 修改数据
     *
     * @param sDistrict 实例对象
     * @return 实例对象
     */
    SDistrict update(SDistrict sDistrict);

    /**
     * 通过主键删除数据
     *
     * @param disid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer disid);

}