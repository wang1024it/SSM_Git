package com.logistics.service;

import com.logistics.entity.SProvince;
import java.util.List;

/**
 * (SProvince)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SProvinceService {

    /**
     * 通过ID查询单条数据
     *
     * @param proid 主键
     * @return 实例对象
     */
    SProvince queryById(Integer proid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SProvince> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sProvince 实例对象
     * @return 实例对象
     */
    SProvince insert(SProvince sProvince);

    /**
     * 修改数据
     *
     * @param sProvince 实例对象
     * @return 实例对象
     */
    SProvince update(SProvince sProvince);

    /**
     * 通过主键删除数据
     *
     * @param proid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer proid);

}