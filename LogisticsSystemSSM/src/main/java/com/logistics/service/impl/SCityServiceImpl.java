package com.logistics.service.impl;

import com.logistics.entity.SCity;
import com.logistics.dao.SCityDao;
import com.logistics.service.SCityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SCity)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sCityService")
public class SCityServiceImpl implements SCityService {
    @Resource
    private SCityDao sCityDao;

    /**
     * 通过ID查询单条数据
     *
     * @param cityid 主键
     * @return 实例对象
     */
    @Override
    public SCity queryById(Integer cityid) {
        return this.sCityDao.queryById(cityid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SCity> queryAllByLimit(int offset, int limit) {
        return this.sCityDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sCity 实例对象
     * @return 实例对象
     */
    @Override
    public SCity insert(SCity sCity) {
        this.sCityDao.insert(sCity);
        return sCity;
    }

    /**
     * 修改数据
     *
     * @param sCity 实例对象
     * @return 实例对象
     */
    @Override
    public SCity update(SCity sCity) {
        this.sCityDao.update(sCity);
        return this.queryById(sCity.getCityid());
    }

    /**
     * 通过主键删除数据
     *
     * @param cityid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer cityid) {
        return this.sCityDao.deleteById(cityid) > 0;
    }
}