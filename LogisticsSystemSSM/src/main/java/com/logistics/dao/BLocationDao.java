package com.logistics.dao;

import com.logistics.entity.BLocation;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BLocation)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BLocationDao {

    /**
     * 通过ID查询单条数据
     *
     * @param locationid 主键
     * @return 实例对象
     */
    BLocation queryById(Integer locationid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BLocation> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bLocation 实例对象
     * @return 对象列表
     */
    List<BLocation> queryAll(BLocation bLocation);

    /**
     * 新增数据
     *
     * @param bLocation 实例对象
     * @return 影响行数
     */
    int insert(BLocation bLocation);

    /**
     * 修改数据
     *
     * @param bLocation 实例对象
     * @return 影响行数
     */
    int update(BLocation bLocation);

    /**
     * 通过主键删除数据
     *
     * @param locationid 主键
     * @return 影响行数
     */
    int deleteById(Integer locationid);

}