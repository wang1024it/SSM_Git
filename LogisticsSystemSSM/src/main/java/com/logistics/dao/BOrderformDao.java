package com.logistics.dao;

import com.logistics.entity.BOrderform;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BOrderform)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BOrderformDao {

    /**
     * 通过ID查询单条数据
     *
     * @param orderformid 主键
     * @return 实例对象
     */
    BOrderform queryById(Integer orderformid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BOrderform> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bOrderform 实例对象
     * @return 对象列表
     */
    List<BOrderform> queryAll(BOrderform bOrderform);

    /**
     * 新增数据
     *
     * @param bOrderform 实例对象
     * @return 影响行数
     */
    int insert(BOrderform bOrderform);

    /**
     * 修改数据
     *
     * @param bOrderform 实例对象
     * @return 影响行数
     */
    int update(BOrderform bOrderform);

    /**
     * 通过主键删除数据
     *
     * @param orderformid 主键
     * @return 影响行数
     */
    int deleteById(Integer orderformid);

}