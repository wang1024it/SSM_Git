package com.logistics.service.impl;

import com.logistics.entity.SBillingmethod;
import com.logistics.dao.SBillingmethodDao;
import com.logistics.service.SBillingmethodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SBillingmethod)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("sBillingmethodService")
public class SBillingmethodServiceImpl implements SBillingmethodService {
    @Resource
    private SBillingmethodDao sBillingmethodDao;

    /**
     * 通过ID查询单条数据
     *
     * @param billingmethodid 主键
     * @return 实例对象
     */
    @Override
    public SBillingmethod queryById(Integer billingmethodid) {
        return this.sBillingmethodDao.queryById(billingmethodid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SBillingmethod> queryAllByLimit(int offset, int limit) {
        return this.sBillingmethodDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sBillingmethod 实例对象
     * @return 实例对象
     */
    @Override
    public SBillingmethod insert(SBillingmethod sBillingmethod) {
        this.sBillingmethodDao.insert(sBillingmethod);
        return sBillingmethod;
    }

    /**
     * 修改数据
     *
     * @param sBillingmethod 实例对象
     * @return 实例对象
     */
    @Override
    public SBillingmethod update(SBillingmethod sBillingmethod) {
        this.sBillingmethodDao.update(sBillingmethod);
        return this.queryById(sBillingmethod.getBillingmethodid());
    }

    /**
     * 通过主键删除数据
     *
     * @param billingmethodid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer billingmethodid) {
        return this.sBillingmethodDao.deleteById(billingmethodid) > 0;
    }
}