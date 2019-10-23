package com.logistics.dao;

import com.logistics.entity.BOrderproblem;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BOrderproblem)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BOrderproblemDao {

    /**
     * 通过ID查询单条数据
     *
     * @param orderproblemid 主键
     * @return 实例对象
     */
    BOrderproblem queryById(Integer orderproblemid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BOrderproblem> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bOrderproblem 实例对象
     * @return 对象列表
     */
    List<BOrderproblem> queryAll(BOrderproblem bOrderproblem);

    /**
     * 新增数据
     *
     * @param bOrderproblem 实例对象
     * @return 影响行数
     */
    int insert(BOrderproblem bOrderproblem);

    /**
     * 修改数据
     *
     * @param bOrderproblem 实例对象
     * @return 影响行数
     */
    int update(BOrderproblem bOrderproblem);

    /**
     * 通过主键删除数据
     *
     * @param orderproblemid 主键
     * @return 影响行数
     */
    int deleteById(Integer orderproblemid);

}