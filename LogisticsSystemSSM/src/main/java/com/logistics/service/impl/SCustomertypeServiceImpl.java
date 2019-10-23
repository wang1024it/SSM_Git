package com.logistics.service.impl;

import com.logistics.entity.SCustomertype;
import com.logistics.dao.SCustomertypeDao;
import com.logistics.service.SCustomertypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SCustomertype)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sCustomertypeService")
public class SCustomertypeServiceImpl implements SCustomertypeService {
    @Resource
    private SCustomertypeDao sCustomertypeDao;

    /**
     * 通过ID查询单条数据
     *
     * @param customertypeid 主键
     * @return 实例对象
     */
    @Override
    public SCustomertype queryById(Integer customertypeid) {
        return this.sCustomertypeDao.queryById(customertypeid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SCustomertype> queryAllByLimit(int offset, int limit) {
        return this.sCustomertypeDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sCustomertype 实例对象
     * @return 实例对象
     */
    @Override
    public SCustomertype insert(SCustomertype sCustomertype) {
        this.sCustomertypeDao.insert(sCustomertype);
        return sCustomertype;
    }

    /**
     * 修改数据
     *
     * @param sCustomertype 实例对象
     * @return 实例对象
     */
    @Override
    public SCustomertype update(SCustomertype sCustomertype) {
        this.sCustomertypeDao.update(sCustomertype);
        return this.queryById(sCustomertype.getCustomertypeid());
    }

    /**
     * 通过主键删除数据
     *
     * @param customertypeid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer customertypeid) {
        return this.sCustomertypeDao.deleteById(customertypeid) > 0;
    }
}