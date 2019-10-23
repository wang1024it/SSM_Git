package com.logistics.service;

import com.logistics.entity.SCustomertype;
import java.util.List;

/**
 * (SCustomertype)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SCustomertypeService {

    /**
     * 通过ID查询单条数据
     *
     * @param customertypeid 主键
     * @return 实例对象
     */
    SCustomertype queryById(Integer customertypeid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SCustomertype> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sCustomertype 实例对象
     * @return 实例对象
     */
    SCustomertype insert(SCustomertype sCustomertype);

    /**
     * 修改数据
     *
     * @param sCustomertype 实例对象
     * @return 实例对象
     */
    SCustomertype update(SCustomertype sCustomertype);

    /**
     * 通过主键删除数据
     *
     * @param customertypeid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer customertypeid);

}