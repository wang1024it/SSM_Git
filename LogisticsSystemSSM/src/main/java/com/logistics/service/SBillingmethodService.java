package com.logistics.service;

import com.logistics.entity.SBillingmethod;
import java.util.List;

/**
 * (SBillingmethod)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface SBillingmethodService {

    /**
     * 通过ID查询单条数据
     *
     * @param billingmethodid 主键
     * @return 实例对象
     */
    SBillingmethod queryById(Integer billingmethodid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SBillingmethod> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sBillingmethod 实例对象
     * @return 实例对象
     */
    SBillingmethod insert(SBillingmethod sBillingmethod);

    /**
     * 修改数据
     *
     * @param sBillingmethod 实例对象
     * @return 实例对象
     */
    SBillingmethod update(SBillingmethod sBillingmethod);

    /**
     * 通过主键删除数据
     *
     * @param billingmethodid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer billingmethodid);

}