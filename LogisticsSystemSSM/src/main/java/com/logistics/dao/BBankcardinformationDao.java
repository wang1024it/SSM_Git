package com.logistics.dao;

import com.logistics.entity.BBankcardinformation;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BBankcardinformation)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BBankcardinformationDao {

    /**
     * 通过ID查询单条数据
     *
     * @param bankcardinformationid 主键
     * @return 实例对象
     */
    BBankcardinformation queryById(Integer bankcardinformationid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BBankcardinformation> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bBankcardinformation 实例对象
     * @return 对象列表
     */
    List<BBankcardinformation> queryAll(BBankcardinformation bBankcardinformation);

    /**
     * 新增数据
     *
     * @param bBankcardinformation 实例对象
     * @return 影响行数
     */
    int insert(BBankcardinformation bBankcardinformation);

    /**
     * 修改数据
     *
     * @param bBankcardinformation 实例对象
     * @return 影响行数
     */
    int update(BBankcardinformation bBankcardinformation);

    /**
     * 通过主键删除数据
     *
     * @param bankcardinformationid 主键
     * @return 影响行数
     */
    int deleteById(Integer bankcardinformationid);

}