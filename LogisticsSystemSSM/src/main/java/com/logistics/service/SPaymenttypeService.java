package com.logistics.service;

import com.logistics.entity.SPaymenttype;
import java.util.List;

/**
 * (SPaymenttype)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SPaymenttypeService {

    /**
     * 通过ID查询单条数据
     *
     * @param paymenttypeid 主键
     * @return 实例对象
     */
    SPaymenttype queryById(Integer paymenttypeid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SPaymenttype> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sPaymenttype 实例对象
     * @return 实例对象
     */
    SPaymenttype insert(SPaymenttype sPaymenttype);

    /**
     * 修改数据
     *
     * @param sPaymenttype 实例对象
     * @return 实例对象
     */
    SPaymenttype update(SPaymenttype sPaymenttype);

    /**
     * 通过主键删除数据
     *
     * @param paymenttypeid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer paymenttypeid);

}