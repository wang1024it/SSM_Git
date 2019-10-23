package com.logistics.service.impl;

import com.logistics.entity.SModule;
import com.logistics.dao.SModuleDao;
import com.logistics.service.SModuleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SModule)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sModuleService")
public class SModuleServiceImpl implements SModuleService {
    @Resource
    private SModuleDao sModuleDao;

    /**
     * 通过ID查询单条数据
     *
     * @param moduleid 主键
     * @return 实例对象
     */
    @Override
    public SModule queryById(Integer moduleid) {
        return this.sModuleDao.queryById(moduleid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SModule> queryAllByLimit(int offset, int limit) {
        return this.sModuleDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sModule 实例对象
     * @return 实例对象
     */
    @Override
    public SModule insert(SModule sModule) {
        this.sModuleDao.insert(sModule);
        return sModule;
    }

    /**
     * 修改数据
     *
     * @param sModule 实例对象
     * @return 实例对象
     */
    @Override
    public SModule update(SModule sModule) {
        this.sModuleDao.update(sModule);
        return this.queryById(sModule.getModuleid());
    }

    /**
     * 通过主键删除数据
     *
     * @param moduleid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer moduleid) {
        return this.sModuleDao.deleteById(moduleid) > 0;
    }
}