package com.logistics.dao;

import com.logistics.entity.SModuledetail;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (SModuledetail)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SModuledetailDao {

    /**
     * 通过ID查询单条数据
     *
     * @param moduledetailid 主键
     * @return 实例对象
     */
    SModuledetail queryById(Integer moduledetailid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SModuledetail> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param sModuledetail 实例对象
     * @return 对象列表
     */
    List<SModuledetail> queryAll(SModuledetail sModuledetail);

    /**
     * 新增数据
     *
     * @param sModuledetail 实例对象
     * @return 影响行数
     */
    int insert(SModuledetail sModuledetail);

    /**
     * 修改数据
     *
     * @param sModuledetail 实例对象
     * @return 影响行数
     */
    int update(SModuledetail sModuledetail);

    /**
     * 通过主键删除数据
     *
     * @param moduledetailid 主键
     * @return 影响行数
     */
    int deleteById(Integer moduledetailid);

}