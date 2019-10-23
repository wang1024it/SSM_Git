package com.logistics.service.impl;

import com.logistics.entity.BApprovalrecord;
import com.logistics.dao.BApprovalrecordDao;
import com.logistics.service.BApprovalrecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BApprovalrecord)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:55
 */
@Service("bApprovalrecordService")
public class BApprovalrecordServiceImpl implements BApprovalrecordService {
    @Resource
    private BApprovalrecordDao bApprovalrecordDao;

    /**
     * 通过ID查询单条数据
     *
     * @param approvalrecordid 主键
     * @return 实例对象
     */
    @Override
    public BApprovalrecord queryById(Integer approvalrecordid) {
        return this.bApprovalrecordDao.queryById(approvalrecordid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BApprovalrecord> queryAllByLimit(int offset, int limit) {
        return this.bApprovalrecordDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bApprovalrecord 实例对象
     * @return 实例对象
     */
    @Override
    public BApprovalrecord insert(BApprovalrecord bApprovalrecord) {
        this.bApprovalrecordDao.insert(bApprovalrecord);
        return bApprovalrecord;
    }

    /**
     * 修改数据
     *
     * @param bApprovalrecord 实例对象
     * @return 实例对象
     */
    @Override
    public BApprovalrecord update(BApprovalrecord bApprovalrecord) {
        this.bApprovalrecordDao.update(bApprovalrecord);
        return this.queryById(bApprovalrecord.getApprovalrecordid());
    }

    /**
     * 通过主键删除数据
     *
     * @param approvalrecordid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer approvalrecordid) {
        return this.bApprovalrecordDao.deleteById(approvalrecordid) > 0;
    }
}