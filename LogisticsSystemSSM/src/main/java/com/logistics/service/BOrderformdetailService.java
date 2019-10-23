package com.logistics.service;

import com.logistics.entity.BOrderformdetail;
import java.util.List;

/**
 * (BOrderformdetail)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BOrderformdetailService {

    /**
     * 通过ID查询单条数据
     *
     * @param orderformdetailid 主键
     * @return 实例对象
     */
    BOrderformdetail queryById(Integer orderformdetailid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BOrderformdetail> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bOrderformdetail 实例对象
     * @return 实例对象
     */
    BOrderformdetail insert(BOrderformdetail bOrderformdetail);

    /**
     * 修改数据
     *
     * @param bOrderformdetail 实例对象
     * @return 实例对象
     */
    BOrderformdetail update(BOrderformdetail bOrderformdetail);

    /**
     * 通过主键删除数据
     *
     * @param orderformdetailid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer orderformdetailid);

}