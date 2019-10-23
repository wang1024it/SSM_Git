package com.logistics.service;

import com.logistics.entity.SUsertype;
import java.util.List;

/**
 * (SUsertype)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
public interface SUsertypeService {

    /**
     * 通过ID查询单条数据
     *
     * @param usertypeid 主键
     * @return 实例对象
     */
    SUsertype queryById(Integer usertypeid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SUsertype> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sUsertype 实例对象
     * @return 实例对象
     */
    SUsertype insert(SUsertype sUsertype);

    /**
     * 修改数据
     *
     * @param sUsertype 实例对象
     * @return 实例对象
     */
    SUsertype update(SUsertype sUsertype);

    /**
     * 通过主键删除数据
     *
     * @param usertypeid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer usertypeid);

}