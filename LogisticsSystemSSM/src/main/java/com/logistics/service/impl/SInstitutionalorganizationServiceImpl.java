package com.logistics.service.impl;

import com.logistics.entity.SInstitutionalorganization;
import com.logistics.dao.SInstitutionalorganizationDao;
import com.logistics.service.SInstitutionalorganizationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SInstitutionalorganization)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sInstitutionalorganizationService")
public class SInstitutionalorganizationServiceImpl implements SInstitutionalorganizationService {
    @Resource
    private SInstitutionalorganizationDao sInstitutionalorganizationDao;

    /**
     * 通过ID查询单条数据
     *
     * @param institutionalorganizationid 主键
     * @return 实例对象
     */
    @Override
    public SInstitutionalorganization queryById(Integer institutionalorganizationid) {
        return this.sInstitutionalorganizationDao.queryById(institutionalorganizationid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SInstitutionalorganization> queryAllByLimit(int offset, int limit) {
        return this.sInstitutionalorganizationDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sInstitutionalorganization 实例对象
     * @return 实例对象
     */
    @Override
    public SInstitutionalorganization insert(SInstitutionalorganization sInstitutionalorganization) {
        this.sInstitutionalorganizationDao.insert(sInstitutionalorganization);
        return sInstitutionalorganization;
    }

    /**
     * 修改数据
     *
     * @param sInstitutionalorganization 实例对象
     * @return 实例对象
     */
    @Override
    public SInstitutionalorganization update(SInstitutionalorganization sInstitutionalorganization) {
        this.sInstitutionalorganizationDao.update(sInstitutionalorganization);
        return this.queryById(sInstitutionalorganization.getInstitutionalorganizationid());
    }

    /**
     * 通过主键删除数据
     *
     * @param institutionalorganizationid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer institutionalorganizationid) {
        return this.sInstitutionalorganizationDao.deleteById(institutionalorganizationid) > 0;
    }
}