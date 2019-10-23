package com.logistics.service.impl;

import com.logistics.entity.BLocation;
import com.logistics.dao.BLocationDao;
import com.logistics.service.BLocationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BLocation)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@Service("bLocationService")
public class BLocationServiceImpl implements BLocationService {
    @Resource
    private BLocationDao bLocationDao;

    /**
     * 通过ID查询单条数据
     *
     * @param locationid 主键
     * @return 实例对象
     */
    @Override
    public BLocation queryById(Integer locationid) {
        return this.bLocationDao.queryById(locationid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BLocation> queryAllByLimit(int offset, int limit) {
        return this.bLocationDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bLocation 实例对象
     * @return 实例对象
     */
    @Override
    public BLocation insert(BLocation bLocation) {
        this.bLocationDao.insert(bLocation);
        return bLocation;
    }

    /**
     * 修改数据
     *
     * @param bLocation 实例对象
     * @return 实例对象
     */
    @Override
    public BLocation update(BLocation bLocation) {
        this.bLocationDao.update(bLocation);
        return this.queryById(bLocation.getLocationid());
    }

    /**
     * 通过主键删除数据
     *
     * @param locationid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer locationid) {
        return this.bLocationDao.deleteById(locationid) > 0;
    }
}