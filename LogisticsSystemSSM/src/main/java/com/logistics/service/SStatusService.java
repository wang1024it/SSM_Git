package com.logistics.service;

import com.logistics.entity.SStatus;
import java.util.List;

/**
 * (SStatus)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
public interface SStatusService {

    /**
     * 通过ID查询单条数据
     *
     * @param statusid 主键
     * @return 实例对象
     */
    SStatus queryById(Integer statusid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SStatus> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sStatus 实例对象
     * @return 实例对象
     */
    SStatus insert(SStatus sStatus);

    /**
     * 修改数据
     *
     * @param sStatus 实例对象
     * @return 实例对象
     */
    SStatus update(SStatus sStatus);

    /**
     * 通过主键删除数据
     *
     * @param statusid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer statusid);

}