package com.logistics.service;

import com.logistics.entity.BLocation;
import java.util.List;

/**
 * (BLocation)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BLocationService {

    /**
     * 通过ID查询单条数据
     *
     * @param locationid 主键
     * @return 实例对象
     */
    BLocation queryById(Integer locationid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BLocation> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bLocation 实例对象
     * @return 实例对象
     */
    BLocation insert(BLocation bLocation);

    /**
     * 修改数据
     *
     * @param bLocation 实例对象
     * @return 实例对象
     */
    BLocation update(BLocation bLocation);

    /**
     * 通过主键删除数据
     *
     * @param locationid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer locationid);

}