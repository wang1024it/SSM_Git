package com.logistics.dao;

import com.logistics.entity.SCity;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (SCity)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface SCityDao {

    /**
     * 通过ID查询单条数据
     *
     * @param cityid 主键
     * @return 实例对象
     */
    SCity queryById(Integer cityid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SCity> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param sCity 实例对象
     * @return 对象列表
     */
    List<SCity> queryAll(SCity sCity);

    /**
     * 新增数据
     *
     * @param sCity 实例对象
     * @return 影响行数
     */
    int insert(SCity sCity);

    /**
     * 修改数据
     *
     * @param sCity 实例对象
     * @return 影响行数
     */
    int update(SCity sCity);

    /**
     * 通过主键删除数据
     *
     * @param cityid 主键
     * @return 影响行数
     */
    int deleteById(Integer cityid);

}