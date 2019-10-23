package com.logistics.service.impl;

import com.logistics.entity.SProvince;
import com.logistics.dao.SProvinceDao;
import com.logistics.service.SProvinceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SProvince)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sProvinceService")
public class SProvinceServiceImpl implements SProvinceService {
    @Resource
    private SProvinceDao sProvinceDao;

    /**
     * 通过ID查询单条数据
     *
     * @param proid 主键
     * @return 实例对象
     */
    @Override
    public SProvince queryById(Integer proid) {
        return this.sProvinceDao.queryById(proid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SProvince> queryAllByLimit(int offset, int limit) {
        return this.sProvinceDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sProvince 实例对象
     * @return 实例对象
     */
    @Override
    public SProvince insert(SProvince sProvince) {
        this.sProvinceDao.insert(sProvince);
        return sProvince;
    }

    /**
     * 修改数据
     *
     * @param sProvince 实例对象
     * @return 实例对象
     */
    @Override
    public SProvince update(SProvince sProvince) {
        this.sProvinceDao.update(sProvince);
        return this.queryById(sProvince.getProid());
    }

    /**
     * 通过主键删除数据
     *
     * @param proid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer proid) {
        return this.sProvinceDao.deleteById(proid) > 0;
    }
}