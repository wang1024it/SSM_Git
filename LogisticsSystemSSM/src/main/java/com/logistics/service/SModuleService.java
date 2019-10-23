package com.logistics.service;

import com.logistics.entity.SModule;
import java.util.List;

/**
 * (SModule)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SModuleService {

    /**
     * 通过ID查询单条数据
     *
     * @param moduleid 主键
     * @return 实例对象
     */
    SModule queryById(Integer moduleid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SModule> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sModule 实例对象
     * @return 实例对象
     */
    SModule insert(SModule sModule);

    /**
     * 修改数据
     *
     * @param sModule 实例对象
     * @return 实例对象
     */
    SModule update(SModule sModule);

    /**
     * 通过主键删除数据
     *
     * @param moduleid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer moduleid);

}