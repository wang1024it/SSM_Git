package com.logistics.service;

import com.logistics.entity.BCar;
import java.util.List;

/**
 * (BCar)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BCarService {

    /**
     * 通过ID查询单条数据
     *
     * @param carid 主键
     * @return 实例对象
     */
    BCar queryById(Integer carid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BCar> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bCar 实例对象
     * @return 实例对象
     */
    BCar insert(BCar bCar);

    /**
     * 修改数据
     *
     * @param bCar 实例对象
     * @return 实例对象
     */
    BCar update(BCar bCar);

    /**
     * 通过主键删除数据
     *
     * @param carid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer carid);

}