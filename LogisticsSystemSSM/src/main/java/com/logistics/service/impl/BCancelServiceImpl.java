package com.logistics.service.impl;

import com.logistics.entity.BCancel;
import com.logistics.dao.BCancelDao;
import com.logistics.service.BCancelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BCancel)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@Service("bCancelService")
public class BCancelServiceImpl implements BCancelService {
    @Resource
    private BCancelDao bCancelDao;

    /**
     * 通过ID查询单条数据
     *
     * @param cancelid 主键
     * @return 实例对象
     */
    @Override
    public BCancel queryById(Integer cancelid) {
        return this.bCancelDao.queryById(cancelid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BCancel> queryAllByLimit(int offset, int limit) {
        return this.bCancelDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bCancel 实例对象
     * @return 实例对象
     */
    @Override
    public BCancel insert(BCancel bCancel) {
        this.bCancelDao.insert(bCancel);
        return bCancel;
    }

    /**
     * 修改数据
     *
     * @param bCancel 实例对象
     * @return 实例对象
     */
    @Override
    public BCancel update(BCancel bCancel) {
        this.bCancelDao.update(bCancel);
        return this.queryById(bCancel.getCancelid());
    }

    /**
     * 通过主键删除数据
     *
     * @param cancelid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer cancelid) {
        return this.bCancelDao.deleteById(cancelid) > 0;
    }
}