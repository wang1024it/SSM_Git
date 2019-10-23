package com.logistics.dao;

import com.logistics.entity.SModule;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (SModule)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SModuleDao {

    /**
     * 通过ID查询单条数据
     *
     * @param moduleid 主键
     * @return 实例对象
     */
    SModule queryById(Integer moduleid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SModule> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param sModule 实例对象
     * @return 对象列表
     */
    List<SModule> queryAll(SModule sModule);

    /**
     * 新增数据
     *
     * @param sModule 实例对象
     * @return 影响行数
     */
    int insert(SModule sModule);

    /**
     * 修改数据
     *
     * @param sModule 实例对象
     * @return 影响行数
     */
    int update(SModule sModule);

    /**
     * 通过主键删除数据
     *
     * @param moduleid 主键
     * @return 影响行数
     */
    int deleteById(Integer moduleid);

}