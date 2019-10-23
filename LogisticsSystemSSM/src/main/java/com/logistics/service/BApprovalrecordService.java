package com.logistics.service;

import com.logistics.entity.BApprovalrecord;
import java.util.List;

/**
 * (BApprovalrecord)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:55
 */
public interface BApprovalrecordService {

    /**
     * 通过ID查询单条数据
     *
     * @param approvalrecordid 主键
     * @return 实例对象
     */
    BApprovalrecord queryById(Integer approvalrecordid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BApprovalrecord> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bApprovalrecord 实例对象
     * @return 实例对象
     */
    BApprovalrecord insert(BApprovalrecord bApprovalrecord);

    /**
     * 修改数据
     *
     * @param bApprovalrecord 实例对象
     * @return 实例对象
     */
    BApprovalrecord update(BApprovalrecord bApprovalrecord);

    /**
     * 通过主键删除数据
     *
     * @param approvalrecordid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer approvalrecordid);

}