package com.logistics.dao;

import com.logistics.entity.BUser;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BUser)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BUserDao {

    /**
     * 通过ID查询单条数据
     *
     * @param userid 主键
     * @return 实例对象
     */
    BUser queryById(Integer userid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BUser> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bUser 实例对象
     * @return 对象列表
     */
    List<BUser> queryAll(BUser bUser);

    /**
     * 新增数据
     *
     * @param bUser 实例对象
     * @return 影响行数
     */
    int insert(BUser bUser);

    /**
     * 修改数据
     *
     * @param bUser 实例对象
     * @return 影响行数
     */
    int update(BUser bUser);

    /**
     * 通过主键删除数据
     *
     * @param userid 主键
     * @return 影响行数
     */
    int deleteById(Integer userid);

}