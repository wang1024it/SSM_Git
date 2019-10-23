package com.logistics.service.impl;

import com.logistics.entity.BMrchandise;
import com.logistics.dao.BMrchandiseDao;
import com.logistics.service.BMrchandiseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BMrchandise)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bMrchandiseService")
public class BMrchandiseServiceImpl implements BMrchandiseService {
    @Resource
    private BMrchandiseDao bMrchandiseDao;

    /**
     * 通过ID查询单条数据
     *
     * @param mrchandiseid 主键
     * @return 实例对象
     */
    @Override
    public BMrchandise queryById(Integer mrchandiseid) {
        return this.bMrchandiseDao.queryById(mrchandiseid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BMrchandise> queryAllByLimit(int offset, int limit) {
        return this.bMrchandiseDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bMrchandise 实例对象
     * @return 实例对象
     */
    @Override
    public BMrchandise insert(BMrchandise bMrchandise) {
        this.bMrchandiseDao.insert(bMrchandise);
        return bMrchandise;
    }

    /**
     * 修改数据
     *
     * @param bMrchandise 实例对象
     * @return 实例对象
     */
    @Override
    public BMrchandise update(BMrchandise bMrchandise) {
        this.bMrchandiseDao.update(bMrchandise);
        return this.queryById(bMrchandise.getMrchandiseid());
    }

    /**
     * 通过主键删除数据
     *
     * @param mrchandiseid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer mrchandiseid) {
        return this.bMrchandiseDao.deleteById(mrchandiseid) > 0;
    }
}