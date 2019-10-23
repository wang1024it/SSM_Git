package com.logistics.service;

import com.logistics.entity.SPayment;
import java.util.List;

/**
 * (SPayment)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SPaymentService {

    /**
     * 通过ID查询单条数据
     *
     * @param paymentid 主键
     * @return 实例对象
     */
    SPayment queryById(Integer paymentid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SPayment> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sPayment 实例对象
     * @return 实例对象
     */
    SPayment insert(SPayment sPayment);

    /**
     * 修改数据
     *
     * @param sPayment 实例对象
     * @return 实例对象
     */
    SPayment update(SPayment sPayment);

    /**
     * 通过主键删除数据
     *
     * @param paymentid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer paymentid);

}