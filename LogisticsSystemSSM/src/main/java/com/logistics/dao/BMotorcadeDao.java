package com.logistics.dao;

import com.logistics.entity.BMotorcade;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BMotorcade)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BMotorcadeDao {

    /**
     * 通过ID查询单条数据
     *
     * @param motorcadeid 主键
     * @return 实例对象
     */
    BMotorcade queryById(Integer motorcadeid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BMotorcade> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bMotorcade 实例对象
     * @return 对象列表
     */
    List<BMotorcade> queryAll(BMotorcade bMotorcade);

    /**
     * 新增数据
     *
     * @param bMotorcade 实例对象
     * @return 影响行数
     */
    int insert(BMotorcade bMotorcade);

    /**
     * 修改数据
     *
     * @param bMotorcade 实例对象
     * @return 影响行数
     */
    int update(BMotorcade bMotorcade);

    /**
     * 通过主键删除数据
     *
     * @param motorcadeid 主键
     * @return 影响行数
     */
    int deleteById(Integer motorcadeid);

}