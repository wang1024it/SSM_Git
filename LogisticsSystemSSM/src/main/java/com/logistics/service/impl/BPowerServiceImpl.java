package com.logistics.service.impl;

import com.logistics.entity.BPower;
import com.logistics.dao.BPowerDao;
import com.logistics.service.BPowerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BPower)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bPowerService")
public class BPowerServiceImpl implements BPowerService {
    @Resource
    private BPowerDao bPowerDao;

    /**
     * 通过ID查询单条数据
     *
     * @param powerid 主键
     * @return 实例对象
     */
    @Override
    public BPower queryById(Integer powerid) {
        return this.bPowerDao.queryById(powerid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BPower> queryAllByLimit(int offset, int limit) {
        return this.bPowerDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bPower 实例对象
     * @return 实例对象
     */
    @Override
    public BPower insert(BPower bPower) {
        this.bPowerDao.insert(bPower);
        return bPower;
    }

    /**
     * 修改数据
     *
     * @param bPower 实例对象
     * @return 实例对象
     */
    @Override
    public BPower update(BPower bPower) {
        this.bPowerDao.update(bPower);
        return this.queryById(bPower.getPowerid());
    }

    /**
     * 通过主键删除数据
     *
     * @param powerid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer powerid) {
        return this.bPowerDao.deleteById(powerid) > 0;
    }
}