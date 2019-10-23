package com.logistics.service.impl;

import com.logistics.entity.BCustom;
import com.logistics.dao.BCustomDao;
import com.logistics.service.BCustomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BCustom)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@Service("bCustomService")
public class BCustomServiceImpl implements BCustomService {
    @Resource
    private BCustomDao bCustomDao;

    /**
     * 通过ID查询单条数据
     *
     * @param customid 主键
     * @return 实例对象
     */
    @Override
    public BCustom queryById(Integer customid) {
        return this.bCustomDao.queryById(customid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BCustom> queryAllByLimit(int offset, int limit) {
        return this.bCustomDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bCustom 实例对象
     * @return 实例对象
     */
    @Override
    public BCustom insert(BCustom bCustom) {
        this.bCustomDao.insert(bCustom);
        return bCustom;
    }

    /**
     * 修改数据
     *
     * @param bCustom 实例对象
     * @return 实例对象
     */
    @Override
    public BCustom update(BCustom bCustom) {
        this.bCustomDao.update(bCustom);
        return this.queryById(bCustom.getCustomid());
    }

    /**
     * 通过主键删除数据
     *
     * @param customid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer customid) {
        return this.bCustomDao.deleteById(customid) > 0;
    }
}