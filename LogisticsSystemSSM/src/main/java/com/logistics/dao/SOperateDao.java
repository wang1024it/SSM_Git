package com.logistics.dao;

import com.logistics.entity.SOperate;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (SOperate)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SOperateDao {

    /**
     * 通过ID查询单条数据
     *
     * @param operateid 主键
     * @return 实例对象
     */
    SOperate queryById(Integer operateid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SOperate> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param sOperate 实例对象
     * @return 对象列表
     */
    List<SOperate> queryAll(SOperate sOperate);

    /**
     * 新增数据
     *
     * @param sOperate 实例对象
     * @return 影响行数
     */
    int insert(SOperate sOperate);

    /**
     * 修改数据
     *
     * @param sOperate 实例对象
     * @return 影响行数
     */
    int update(SOperate sOperate);

    /**
     * 通过主键删除数据
     *
     * @param operateid 主键
     * @return 影响行数
     */
    int deleteById(Integer operateid);

}