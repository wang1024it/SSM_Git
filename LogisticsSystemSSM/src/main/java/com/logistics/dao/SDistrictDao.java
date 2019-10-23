package com.logistics.dao;

import com.logistics.entity.SDistrict;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (SDistrict)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SDistrictDao {

    /**
     * 通过ID查询单条数据
     *
     * @param disid 主键
     * @return 实例对象
     */
    SDistrict queryById(Integer disid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SDistrict> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param sDistrict 实例对象
     * @return 对象列表
     */
    List<SDistrict> queryAll(SDistrict sDistrict);

    /**
     * 新增数据
     *
     * @param sDistrict 实例对象
     * @return 影响行数
     */
    int insert(SDistrict sDistrict);

    /**
     * 修改数据
     *
     * @param sDistrict 实例对象
     * @return 影响行数
     */
    int update(SDistrict sDistrict);

    /**
     * 通过主键删除数据
     *
     * @param disid 主键
     * @return 影响行数
     */
    int deleteById(Integer disid);

}