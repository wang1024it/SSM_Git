package com.logistics.service.impl;

import com.logistics.entity.BOrderformdetail;
import com.logistics.dao.BOrderformdetailDao;
import com.logistics.service.BOrderformdetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BOrderformdetail)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bOrderformdetailService")
public class BOrderformdetailServiceImpl implements BOrderformdetailService {
    @Resource
    private BOrderformdetailDao bOrderformdetailDao;

    /**
     * 通过ID查询单条数据
     *
     * @param orderformdetailid 主键
     * @return 实例对象
     */
    @Override
    public BOrderformdetail queryById(Integer orderformdetailid) {
        return this.bOrderformdetailDao.queryById(orderformdetailid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BOrderformdetail> queryAllByLimit(int offset, int limit) {
        return this.bOrderformdetailDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bOrderformdetail 实例对象
     * @return 实例对象
     */
    @Override
    public BOrderformdetail insert(BOrderformdetail bOrderformdetail) {
        this.bOrderformdetailDao.insert(bOrderformdetail);
        return bOrderformdetail;
    }

    /**
     * 修改数据
     *
     * @param bOrderformdetail 实例对象
     * @return 实例对象
     */
    @Override
    public BOrderformdetail update(BOrderformdetail bOrderformdetail) {
        this.bOrderformdetailDao.update(bOrderformdetail);
        return this.queryById(bOrderformdetail.getOrderformdetailid());
    }

    /**
     * 通过主键删除数据
     *
     * @param orderformdetailid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer orderformdetailid) {
        return this.bOrderformdetailDao.deleteById(orderformdetailid) > 0;
    }
}