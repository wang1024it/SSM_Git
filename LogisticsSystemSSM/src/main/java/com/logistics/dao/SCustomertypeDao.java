package com.logistics.dao;

import com.logistics.entity.SCustomertype;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (SCustomertype)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SCustomertypeDao {

    /**
     * 通过ID查询单条数据
     *
     * @param customertypeid 主键
     * @return 实例对象
     */
    SCustomertype queryById(Integer customertypeid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SCustomertype> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param sCustomertype 实例对象
     * @return 对象列表
     */
    List<SCustomertype> queryAll(SCustomertype sCustomertype);

    /**
     * 新增数据
     *
     * @param sCustomertype 实例对象
     * @return 影响行数
     */
    int insert(SCustomertype sCustomertype);

    /**
     * 修改数据
     *
     * @param sCustomertype 实例对象
     * @return 影响行数
     */
    int update(SCustomertype sCustomertype);

    /**
     * 通过主键删除数据
     *
     * @param customertypeid 主键
     * @return 影响行数
     */
    int deleteById(Integer customertypeid);

}