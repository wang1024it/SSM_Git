package com.logistics.service;

import com.logistics.entity.BReceivables;
import java.util.List;

/**
 * (BReceivables)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BReceivablesService {

    /**
     * 通过ID查询单条数据
     *
     * @param receivablesid 主键
     * @return 实例对象
     */
    BReceivables queryById(Integer receivablesid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BReceivables> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bReceivables 实例对象
     * @return 实例对象
     */
    BReceivables insert(BReceivables bReceivables);

    /**
     * 修改数据
     *
     * @param bReceivables 实例对象
     * @return 实例对象
     */
    BReceivables update(BReceivables bReceivables);

    /**
     * 通过主键删除数据
     *
     * @param receivablesid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer receivablesid);

}