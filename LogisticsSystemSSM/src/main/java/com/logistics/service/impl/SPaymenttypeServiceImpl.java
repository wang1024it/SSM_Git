package com.logistics.service.impl;

import com.logistics.entity.SPaymenttype;
import com.logistics.dao.SPaymenttypeDao;
import com.logistics.service.SPaymenttypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SPaymenttype)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sPaymenttypeService")
public class SPaymenttypeServiceImpl implements SPaymenttypeService {
    @Resource
    private SPaymenttypeDao sPaymenttypeDao;

    /**
     * 通过ID查询单条数据
     *
     * @param paymenttypeid 主键
     * @return 实例对象
     */
    @Override
    public SPaymenttype queryById(Integer paymenttypeid) {
        return this.sPaymenttypeDao.queryById(paymenttypeid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SPaymenttype> queryAllByLimit(int offset, int limit) {
        return this.sPaymenttypeDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sPaymenttype 实例对象
     * @return 实例对象
     */
    @Override
    public SPaymenttype insert(SPaymenttype sPaymenttype) {
        this.sPaymenttypeDao.insert(sPaymenttype);
        return sPaymenttype;
    }

    /**
     * 修改数据
     *
     * @param sPaymenttype 实例对象
     * @return 实例对象
     */
    @Override
    public SPaymenttype update(SPaymenttype sPaymenttype) {
        this.sPaymenttypeDao.update(sPaymenttype);
        return this.queryById(sPaymenttype.getPaymenttypeid());
    }

    /**
     * 通过主键删除数据
     *
     * @param paymenttypeid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer paymenttypeid) {
        return this.sPaymenttypeDao.deleteById(paymenttypeid) > 0;
    }
}