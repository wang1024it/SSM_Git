package com.logistics.service.impl;

import com.logistics.entity.BLogisticstracking;
import com.logistics.dao.BLogisticstrackingDao;
import com.logistics.service.BLogisticstrackingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BLogisticstracking)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@Service("bLogisticstrackingService")
public class BLogisticstrackingServiceImpl implements BLogisticstrackingService {
    @Resource
    private BLogisticstrackingDao bLogisticstrackingDao;

    /**
     * 通过ID查询单条数据
     *
     * @param logisticstrackingid 主键
     * @return 实例对象
     */
    @Override
    public BLogisticstracking queryById(Integer logisticstrackingid) {
        return this.bLogisticstrackingDao.queryById(logisticstrackingid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BLogisticstracking> queryAllByLimit(int offset, int limit) {
        return this.bLogisticstrackingDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bLogisticstracking 实例对象
     * @return 实例对象
     */
    @Override
    public BLogisticstracking insert(BLogisticstracking bLogisticstracking) {
        this.bLogisticstrackingDao.insert(bLogisticstracking);
        return bLogisticstracking;
    }

    /**
     * 修改数据
     *
     * @param bLogisticstracking 实例对象
     * @return 实例对象
     */
    @Override
    public BLogisticstracking update(BLogisticstracking bLogisticstracking) {
        this.bLogisticstrackingDao.update(bLogisticstracking);
        return this.queryById(bLogisticstracking.getLogisticstrackingid());
    }

    /**
     * 通过主键删除数据
     *
     * @param logisticstrackingid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer logisticstrackingid) {
        return this.bLogisticstrackingDao.deleteById(logisticstrackingid) > 0;
    }
}