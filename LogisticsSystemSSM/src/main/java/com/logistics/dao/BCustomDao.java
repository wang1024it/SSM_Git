package com.logistics.dao;

import com.logistics.entity.BCustom;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BCustom)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BCustomDao {

    /**
     * 通过ID查询单条数据
     *
     * @param customid 主键
     * @return 实例对象
     */
    BCustom queryById(Integer customid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BCustom> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bCustom 实例对象
     * @return 对象列表
     */
    List<BCustom> queryAll(BCustom bCustom);

    /**
     * 新增数据
     *
     * @param bCustom 实例对象
     * @return 影响行数
     */
    int insert(BCustom bCustom);

    /**
     * 修改数据
     *
     * @param bCustom 实例对象
     * @return 影响行数
     */
    int update(BCustom bCustom);

    /**
     * 通过主键删除数据
     *
     * @param customid 主键
     * @return 影响行数
     */
    int deleteById(Integer customid);

}