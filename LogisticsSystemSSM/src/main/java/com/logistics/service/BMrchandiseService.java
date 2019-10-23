package com.logistics.service;

import com.logistics.entity.BMrchandise;
import java.util.List;

/**
 * (BMrchandise)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BMrchandiseService {

    /**
     * 通过ID查询单条数据
     *
     * @param mrchandiseid 主键
     * @return 实例对象
     */
    BMrchandise queryById(Integer mrchandiseid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BMrchandise> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bMrchandise 实例对象
     * @return 实例对象
     */
    BMrchandise insert(BMrchandise bMrchandise);

    /**
     * 修改数据
     *
     * @param bMrchandise 实例对象
     * @return 实例对象
     */
    BMrchandise update(BMrchandise bMrchandise);

    /**
     * 通过主键删除数据
     *
     * @param mrchandiseid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer mrchandiseid);

}