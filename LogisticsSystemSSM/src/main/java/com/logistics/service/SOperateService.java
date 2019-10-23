package com.logistics.service;

import com.logistics.entity.SOperate;
import java.util.List;

/**
 * (SOperate)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SOperateService {

    /**
     * 通过ID查询单条数据
     *
     * @param operateid 主键
     * @return 实例对象
     */
    SOperate queryById(Integer operateid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SOperate> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sOperate 实例对象
     * @return 实例对象
     */
    SOperate insert(SOperate sOperate);

    /**
     * 修改数据
     *
     * @param sOperate 实例对象
     * @return 实例对象
     */
    SOperate update(SOperate sOperate);

    /**
     * 通过主键删除数据
     *
     * @param operateid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer operateid);

}