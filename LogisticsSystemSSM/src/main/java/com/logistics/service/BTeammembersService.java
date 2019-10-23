package com.logistics.service;

import com.logistics.entity.BTeammembers;
import java.util.List;

/**
 * (BTeammembers)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BTeammembersService {

    /**
     * 通过ID查询单条数据
     *
     * @param teammembersid 主键
     * @return 实例对象
     */
    BTeammembers queryById(Integer teammembersid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BTeammembers> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bTeammembers 实例对象
     * @return 实例对象
     */
    BTeammembers insert(BTeammembers bTeammembers);

    /**
     * 修改数据
     *
     * @param bTeammembers 实例对象
     * @return 实例对象
     */
    BTeammembers update(BTeammembers bTeammembers);

    /**
     * 通过主键删除数据
     *
     * @param teammembersid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer teammembersid);

}