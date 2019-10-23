package com.logistics.service.impl;

import com.logistics.entity.SModuledetail;
import com.logistics.dao.SModuledetailDao;
import com.logistics.service.SModuledetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SModuledetail)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sModuledetailService")
public class SModuledetailServiceImpl implements SModuledetailService {
    @Resource
    private SModuledetailDao sModuledetailDao;

    /**
     * 通过ID查询单条数据
     *
     * @param moduledetailid 主键
     * @return 实例对象
     */
    @Override
    public SModuledetail queryById(Integer moduledetailid) {
        return this.sModuledetailDao.queryById(moduledetailid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SModuledetail> queryAllByLimit(int offset, int limit) {
        return this.sModuledetailDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sModuledetail 实例对象
     * @return 实例对象
     */
    @Override
    public SModuledetail insert(SModuledetail sModuledetail) {
        this.sModuledetailDao.insert(sModuledetail);
        return sModuledetail;
    }

    /**
     * 修改数据
     *
     * @param sModuledetail 实例对象
     * @return 实例对象
     */
    @Override
    public SModuledetail update(SModuledetail sModuledetail) {
        this.sModuledetailDao.update(sModuledetail);
        return this.queryById(sModuledetail.getModuledetailid());
    }

    /**
     * 通过主键删除数据
     *
     * @param moduledetailid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer moduledetailid) {
        return this.sModuledetailDao.deleteById(moduledetailid) > 0;
    }
}