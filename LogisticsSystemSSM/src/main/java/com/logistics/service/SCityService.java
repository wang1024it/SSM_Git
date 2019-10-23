package com.logistics.service;

import com.logistics.entity.SCity;
import java.util.List;

/**
 * (SCity)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SCityService {

    /**
     * 通过ID查询单条数据
     *
     * @param cityid 主键
     * @return 实例对象
     */
    SCity queryById(Integer cityid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SCity> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sCity 实例对象
     * @return 实例对象
     */
    SCity insert(SCity sCity);

    /**
     * 修改数据
     *
     * @param sCity 实例对象
     * @return 实例对象
     */
    SCity update(SCity sCity);

    /**
     * 通过主键删除数据
     *
     * @param cityid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer cityid);

}