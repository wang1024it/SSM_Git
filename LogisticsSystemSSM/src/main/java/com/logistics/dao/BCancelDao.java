package com.logistics.dao;

import com.logistics.entity.BCancel;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BCancel)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BCancelDao {

    /**
     * 通过ID查询单条数据
     *
     * @param cancelid 主键
     * @return 实例对象
     */
    BCancel queryById(Integer cancelid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BCancel> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bCancel 实例对象
     * @return 对象列表
     */
    List<BCancel> queryAll(BCancel bCancel);

    /**
     * 新增数据
     *
     * @param bCancel 实例对象
     * @return 影响行数
     */
    int insert(BCancel bCancel);

    /**
     * 修改数据
     *
     * @param bCancel 实例对象
     * @return 影响行数
     */
    int update(BCancel bCancel);

    /**
     * 通过主键删除数据
     *
     * @param cancelid 主键
     * @return 影响行数
     */
    int deleteById(Integer cancelid);

}