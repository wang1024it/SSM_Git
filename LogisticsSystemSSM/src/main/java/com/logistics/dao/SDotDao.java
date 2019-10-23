package com.logistics.dao;

import com.logistics.entity.SDot;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (SDot)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SDotDao {

    /**
     * 通过ID查询单条数据
     *
     * @param dotid 主键
     * @return 实例对象
     */
    SDot queryById(Integer dotid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SDot> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param sDot 实例对象
     * @return 对象列表
     */
    List<SDot> queryAll(SDot sDot);

    /**
     * 新增数据
     *
     * @param sDot 实例对象
     * @return 影响行数
     */
    int insert(SDot sDot);

    /**
     * 修改数据
     *
     * @param sDot 实例对象
     * @return 影响行数
     */
    int update(SDot sDot);

    /**
     * 通过主键删除数据
     *
     * @param dotid 主键
     * @return 影响行数
     */
    int deleteById(Integer dotid);

}