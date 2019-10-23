package com.logistics.service.impl;

import com.logistics.entity.SDot;
import com.logistics.dao.SDotDao;
import com.logistics.service.SDotService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SDot)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sDotService")
public class SDotServiceImpl implements SDotService {
    @Resource
    private SDotDao sDotDao;

    /**
     * 通过ID查询单条数据
     *
     * @param dotid 主键
     * @return 实例对象
     */
    @Override
    public SDot queryById(Integer dotid) {
        return this.sDotDao.queryById(dotid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SDot> queryAllByLimit(int offset, int limit) {
        return this.sDotDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sDot 实例对象
     * @return 实例对象
     */
    @Override
    public SDot insert(SDot sDot) {
        this.sDotDao.insert(sDot);
        return sDot;
    }

    /**
     * 修改数据
     *
     * @param sDot 实例对象
     * @return 实例对象
     */
    @Override
    public SDot update(SDot sDot) {
        this.sDotDao.update(sDot);
        return this.queryById(sDot.getDotid());
    }

    /**
     * 通过主键删除数据
     *
     * @param dotid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer dotid) {
        return this.sDotDao.deleteById(dotid) > 0;
    }
}