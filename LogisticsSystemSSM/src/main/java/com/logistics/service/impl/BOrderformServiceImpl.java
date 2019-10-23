package com.logistics.service.impl;

import com.logistics.entity.BOrderform;
import com.logistics.dao.BOrderformDao;
import com.logistics.service.BOrderformService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BOrderform)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bOrderformService")
public class BOrderformServiceImpl implements BOrderformService {
    @Resource
    private BOrderformDao bOrderformDao;

    /**
     * 通过ID查询单条数据
     *
     * @param orderformid 主键
     * @return 实例对象
     */
    @Override
    public BOrderform queryById(Integer orderformid) {
        return this.bOrderformDao.queryById(orderformid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BOrderform> queryAllByLimit(int offset, int limit) {
        return this.bOrderformDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bOrderform 实例对象
     * @return 实例对象
     */
    @Override
    public BOrderform insert(BOrderform bOrderform) {
        this.bOrderformDao.insert(bOrderform);
        return bOrderform;
    }

    /**
     * 修改数据
     *
     * @param bOrderform 实例对象
     * @return 实例对象
     */
    @Override
    public BOrderform update(BOrderform bOrderform) {
        this.bOrderformDao.update(bOrderform);
        return this.queryById(bOrderform.getOrderformid());
    }

    /**
     * 通过主键删除数据
     *
     * @param orderformid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer orderformid) {
        return this.bOrderformDao.deleteById(orderformid) > 0;
    }
}