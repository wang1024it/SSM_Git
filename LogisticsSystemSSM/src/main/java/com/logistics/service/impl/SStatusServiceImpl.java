package com.logistics.service.impl;

import com.logistics.entity.SStatus;
import com.logistics.dao.SStatusDao;
import com.logistics.service.SStatusService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SStatus)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
@Service("sStatusService")
public class SStatusServiceImpl implements SStatusService {
    @Resource
    private SStatusDao sStatusDao;

    /**
     * 通过ID查询单条数据
     *
     * @param statusid 主键
     * @return 实例对象
     */
    @Override
    public SStatus queryById(Integer statusid) {
        return this.sStatusDao.queryById(statusid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SStatus> queryAllByLimit(int offset, int limit) {
        return this.sStatusDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sStatus 实例对象
     * @return 实例对象
     */
    @Override
    public SStatus insert(SStatus sStatus) {
        this.sStatusDao.insert(sStatus);
        return sStatus;
    }

    /**
     * 修改数据
     *
     * @param sStatus 实例对象
     * @return 实例对象
     */
    @Override
    public SStatus update(SStatus sStatus) {
        this.sStatusDao.update(sStatus);
        return this.queryById(sStatus.getStatusid());
    }

    /**
     * 通过主键删除数据
     *
     * @param statusid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer statusid) {
        return this.sStatusDao.deleteById(statusid) > 0;
    }
}