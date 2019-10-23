package com.logistics.service;

import com.logistics.entity.BLogisticstracking;
import java.util.List;

/**
 * (BLogisticstracking)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BLogisticstrackingService {

    /**
     * 通过ID查询单条数据
     *
     * @param logisticstrackingid 主键
     * @return 实例对象
     */
    BLogisticstracking queryById(Integer logisticstrackingid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BLogisticstracking> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bLogisticstracking 实例对象
     * @return 实例对象
     */
    BLogisticstracking insert(BLogisticstracking bLogisticstracking);

    /**
     * 修改数据
     *
     * @param bLogisticstracking 实例对象
     * @return 实例对象
     */
    BLogisticstracking update(BLogisticstracking bLogisticstracking);

    /**
     * 通过主键删除数据
     *
     * @param logisticstrackingid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer logisticstrackingid);

}