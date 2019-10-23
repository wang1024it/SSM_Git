package com.logistics.dao;

import com.logistics.entity.BFundrecord;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BFundrecord)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BFundrecordDao {

    /**
     * 通过ID查询单条数据
     *
     * @param fundrecordid 主键
     * @return 实例对象
     */
    BFundrecord queryById(Integer fundrecordid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BFundrecord> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bFundrecord 实例对象
     * @return 对象列表
     */
    List<BFundrecord> queryAll(BFundrecord bFundrecord);

    /**
     * 新增数据
     *
     * @param bFundrecord 实例对象
     * @return 影响行数
     */
    int insert(BFundrecord bFundrecord);

    /**
     * 修改数据
     *
     * @param bFundrecord 实例对象
     * @return 影响行数
     */
    int update(BFundrecord bFundrecord);

    /**
     * 通过主键删除数据
     *
     * @param fundrecordid 主键
     * @return 影响行数
     */
    int deleteById(Integer fundrecordid);

}