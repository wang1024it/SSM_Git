package com.logistics.service;

import com.logistics.entity.BCancel;
import java.util.List;

/**
 * (BCancel)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BCancelService {

    /**
     * 通过ID查询单条数据
     *
     * @param cancelid 主键
     * @return 实例对象
     */
    BCancel queryById(Integer cancelid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BCancel> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bCancel 实例对象
     * @return 实例对象
     */
    BCancel insert(BCancel bCancel);

    /**
     * 修改数据
     *
     * @param bCancel 实例对象
     * @return 实例对象
     */
    BCancel update(BCancel bCancel);

    /**
     * 通过主键删除数据
     *
     * @param cancelid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer cancelid);

}