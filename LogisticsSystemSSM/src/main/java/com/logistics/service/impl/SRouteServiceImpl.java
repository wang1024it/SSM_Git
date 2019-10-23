package com.logistics.service.impl;

import com.logistics.entity.SRoute;
import com.logistics.dao.SRouteDao;
import com.logistics.service.SRouteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SRoute)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
@Service("sRouteService")
public class SRouteServiceImpl implements SRouteService {
    @Resource
    private SRouteDao sRouteDao;

    /**
     * 通过ID查询单条数据
     *
     * @param routeid 主键
     * @return 实例对象
     */
    @Override
    public SRoute queryById(Integer routeid) {
        return this.sRouteDao.queryById(routeid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SRoute> queryAllByLimit(int offset, int limit) {
        return this.sRouteDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sRoute 实例对象
     * @return 实例对象
     */
    @Override
    public SRoute insert(SRoute sRoute) {
        this.sRouteDao.insert(sRoute);
        return sRoute;
    }

    /**
     * 修改数据
     *
     * @param sRoute 实例对象
     * @return 实例对象
     */
    @Override
    public SRoute update(SRoute sRoute) {
        this.sRouteDao.update(sRoute);
        return this.queryById(sRoute.getRouteid());
    }

    /**
     * 通过主键删除数据
     *
     * @param routeid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer routeid) {
        return this.sRouteDao.deleteById(routeid) > 0;
    }
}