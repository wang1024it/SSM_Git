package com.logistics.dao;

import com.logistics.entity.BApprovalrecord;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (BApprovalrecord)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:32:55
 */
public interface BApprovalrecordDao {

    /**
     * 通过ID查询单条数据
     *
     * @param approvalrecordid 主键
     * @return 实例对象
     */
    BApprovalrecord queryById(Integer approvalrecordid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BApprovalrecord> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param bApprovalrecord 实例对象
     * @return 对象列表
     */
    List<BApprovalrecord> queryAll(BApprovalrecord bApprovalrecord);

    /**
     * 新增数据
     *
     * @param bApprovalrecord 实例对象
     * @return 影响行数
     */
    int insert(BApprovalrecord bApprovalrecord);

    /**
     * 修改数据
     *
     * @param bApprovalrecord 实例对象
     * @return 影响行数
     */
    int update(BApprovalrecord bApprovalrecord);

    /**
     * 通过主键删除数据
     *
     * @param approvalrecordid 主键
     * @return 影响行数
     */
    int deleteById(Integer approvalrecordid);

}