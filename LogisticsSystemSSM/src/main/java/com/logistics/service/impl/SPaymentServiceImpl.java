package com.logistics.service.impl;

import com.logistics.entity.SPayment;
import com.logistics.dao.SPaymentDao;
import com.logistics.service.SPaymentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SPayment)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sPaymentService")
public class SPaymentServiceImpl implements SPaymentService {
    @Resource
    private SPaymentDao sPaymentDao;

    /**
     * 通过ID查询单条数据
     *
     * @param paymentid 主键
     * @return 实例对象
     */
    @Override
    public SPayment queryById(Integer paymentid) {
        return this.sPaymentDao.queryById(paymentid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SPayment> queryAllByLimit(int offset, int limit) {
        return this.sPaymentDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sPayment 实例对象
     * @return 实例对象
     */
    @Override
    public SPayment insert(SPayment sPayment) {
        this.sPaymentDao.insert(sPayment);
        return sPayment;
    }

    /**
     * 修改数据
     *
     * @param sPayment 实例对象
     * @return 实例对象
     */
    @Override
    public SPayment update(SPayment sPayment) {
        this.sPaymentDao.update(sPayment);
        return this.queryById(sPayment.getPaymentid());
    }

    /**
     * 通过主键删除数据
     *
     * @param paymentid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer paymentid) {
        return this.sPaymentDao.deleteById(paymentid) > 0;
    }
}