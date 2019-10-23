package com.logistics.service.impl;

import com.logistics.entity.BReceivables;
import com.logistics.dao.BReceivablesDao;
import com.logistics.service.BReceivablesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BReceivables)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bReceivablesService")
public class BReceivablesServiceImpl implements BReceivablesService {
    @Resource
    private BReceivablesDao bReceivablesDao;

    /**
     * 通过ID查询单条数据
     *
     * @param receivablesid 主键
     * @return 实例对象
     */
    @Override
    public BReceivables queryById(Integer receivablesid) {
        return this.bReceivablesDao.queryById(receivablesid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BReceivables> queryAllByLimit(int offset, int limit) {
        return this.bReceivablesDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bReceivables 实例对象
     * @return 实例对象
     */
    @Override
    public BReceivables insert(BReceivables bReceivables) {
        this.bReceivablesDao.insert(bReceivables);
        return bReceivables;
    }

    /**
     * 修改数据
     *
     * @param bReceivables 实例对象
     * @return 实例对象
     */
    @Override
    public BReceivables update(BReceivables bReceivables) {
        this.bReceivablesDao.update(bReceivables);
        return this.queryById(bReceivables.getReceivablesid());
    }

    /**
     * 通过主键删除数据
     *
     * @param receivablesid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer receivablesid) {
        return this.bReceivablesDao.deleteById(receivablesid) > 0;
    }
}