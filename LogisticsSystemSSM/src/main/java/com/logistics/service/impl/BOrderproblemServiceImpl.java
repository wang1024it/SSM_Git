package com.logistics.service.impl;

import com.logistics.entity.BOrderproblem;
import com.logistics.dao.BOrderproblemDao;
import com.logistics.service.BOrderproblemService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BOrderproblem)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bOrderproblemService")
public class BOrderproblemServiceImpl implements BOrderproblemService {
    @Resource
    private BOrderproblemDao bOrderproblemDao;

    /**
     * 通过ID查询单条数据
     *
     * @param orderproblemid 主键
     * @return 实例对象
     */
    @Override
    public BOrderproblem queryById(Integer orderproblemid) {
        return this.bOrderproblemDao.queryById(orderproblemid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BOrderproblem> queryAllByLimit(int offset, int limit) {
        return this.bOrderproblemDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bOrderproblem 实例对象
     * @return 实例对象
     */
    @Override
    public BOrderproblem insert(BOrderproblem bOrderproblem) {
        this.bOrderproblemDao.insert(bOrderproblem);
        return bOrderproblem;
    }

    /**
     * 修改数据
     *
     * @param bOrderproblem 实例对象
     * @return 实例对象
     */
    @Override
    public BOrderproblem update(BOrderproblem bOrderproblem) {
        this.bOrderproblemDao.update(bOrderproblem);
        return this.queryById(bOrderproblem.getOrderproblemid());
    }

    /**
     * 通过主键删除数据
     *
     * @param orderproblemid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer orderproblemid) {
        return this.bOrderproblemDao.deleteById(orderproblemid) > 0;
    }
}