package com.logistics.dao;

import com.logistics.entity.BUsertypedetail;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BUsertypedetail)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BUsertypedetailDao {

    /**
     * 通过ID查询单条数据
     *
     * @param usertypedetailid 主键
     * @return 实例对象
     */
    BUsertypedetail queryById(Integer usertypedetailid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BUsertypedetail> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bUsertypedetail 实例对象
     * @return 对象列表
     */
    List<BUsertypedetail> queryAll(BUsertypedetail bUsertypedetail);

    /**
     * 新增数据
     *
     * @param bUsertypedetail 实例对象
     * @return 影响行数
     */
    int insert(BUsertypedetail bUsertypedetail);

    /**
     * 修改数据
     *
     * @param bUsertypedetail 实例对象
     * @return 影响行数
     */
    int update(BUsertypedetail bUsertypedetail);

    /**
     * 通过主键删除数据
     *
     * @param usertypedetailid 主键
     * @return 影响行数
     */
    int deleteById(Integer usertypedetailid);

}