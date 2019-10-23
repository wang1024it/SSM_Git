package com.logistics.dao;

import com.logistics.entity.BLogisticstracking;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BLogisticstracking)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BLogisticstrackingDao {

    /**
     * 通过ID查询单条数据
     *
     * @param logisticstrackingid 主键
     * @return 实例对象
     */
    BLogisticstracking queryById(Integer logisticstrackingid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BLogisticstracking> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bLogisticstracking 实例对象
     * @return 对象列表
     */
    List<BLogisticstracking> queryAll(BLogisticstracking bLogisticstracking);

    /**
     * 新增数据
     *
     * @param bLogisticstracking 实例对象
     * @return 影响行数
     */
    int insert(BLogisticstracking bLogisticstracking);

    /**
     * 修改数据
     *
     * @param bLogisticstracking 实例对象
     * @return 影响行数
     */
    int update(BLogisticstracking bLogisticstracking);

    /**
     * 通过主键删除数据
     *
     * @param logisticstrackingid 主键
     * @return 影响行数
     */
    int deleteById(Integer logisticstrackingid);

}