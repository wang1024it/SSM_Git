package com.logistics.service.impl;

import com.logistics.entity.SDistrict;
import com.logistics.dao.SDistrictDao;
import com.logistics.service.SDistrictService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SDistrict)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sDistrictService")
public class SDistrictServiceImpl implements SDistrictService {
    @Resource
    private SDistrictDao sDistrictDao;

    /**
     * 通过ID查询单条数据
     *
     * @param disid 主键
     * @return 实例对象
     */
    @Override
    public SDistrict queryById(Integer disid) {
        return this.sDistrictDao.queryById(disid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SDistrict> queryAllByLimit(int offset, int limit) {
        return this.sDistrictDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sDistrict 实例对象
     * @return 实例对象
     */
    @Override
    public SDistrict insert(SDistrict sDistrict) {
        this.sDistrictDao.insert(sDistrict);
        return sDistrict;
    }

    /**
     * 修改数据
     *
     * @param sDistrict 实例对象
     * @return 实例对象
     */
    @Override
    public SDistrict update(SDistrict sDistrict) {
        this.sDistrictDao.update(sDistrict);
        return this.queryById(sDistrict.getDisid());
    }

    /**
     * 通过主键删除数据
     *
     * @param disid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer disid) {
        return this.sDistrictDao.deleteById(disid) > 0;
    }
}