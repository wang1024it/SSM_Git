package com.logistics.service;

import com.logistics.entity.SCartype;
import java.util.List;

/**
 * (SCartype)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface SCartypeService {

    /**
     * 通过ID查询单条数据
     *
     * @param cartypeid 主键
     * @return 实例对象
     */
    SCartype queryById(Integer cartypeid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SCartype> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sCartype 实例对象
     * @return 实例对象
     */
    SCartype insert(SCartype sCartype);

    /**
     * 修改数据
     *
     * @param sCartype 实例对象
     * @return 实例对象
     */
    SCartype update(SCartype sCartype);

    /**
     * 通过主键删除数据
     *
     * @param cartypeid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer cartypeid);

}