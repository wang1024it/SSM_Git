package com.logistics.service;

import com.logistics.entity.BUser;
import java.util.List;

/**
 * (BUser)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BUserService {

    /**
     * 通过ID查询单条数据
     *
     * @param userid 主键
     * @return 实例对象
     */
    BUser queryById(Integer userid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BUser> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bUser 实例对象
     * @return 实例对象
     */
    BUser insert(BUser bUser);

    /**
     * 修改数据
     *
     * @param bUser 实例对象
     * @return 实例对象
     */
    BUser update(BUser bUser);

    /**
     * 通过主键删除数据
     *
     * @param userid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer userid);

}