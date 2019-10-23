package com.logistics.service.impl;

import com.logistics.entity.BTeammembers;
import com.logistics.dao.BTeammembersDao;
import com.logistics.service.BTeammembersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BTeammembers)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bTeammembersService")
public class BTeammembersServiceImpl implements BTeammembersService {
    @Resource
    private BTeammembersDao bTeammembersDao;

    /**
     * 通过ID查询单条数据
     *
     * @param teammembersid 主键
     * @return 实例对象
     */
    @Override
    public BTeammembers queryById(Integer teammembersid) {
        return this.bTeammembersDao.queryById(teammembersid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BTeammembers> queryAllByLimit(int offset, int limit) {
        return this.bTeammembersDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bTeammembers 实例对象
     * @return 实例对象
     */
    @Override
    public BTeammembers insert(BTeammembers bTeammembers) {
        this.bTeammembersDao.insert(bTeammembers);
        return bTeammembers;
    }

    /**
     * 修改数据
     *
     * @param bTeammembers 实例对象
     * @return 实例对象
     */
    @Override
    public BTeammembers update(BTeammembers bTeammembers) {
        this.bTeammembersDao.update(bTeammembers);
        return this.queryById(bTeammembers.getTeammembersid());
    }

    /**
     * 通过主键删除数据
     *
     * @param teammembersid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer teammembersid) {
        return this.bTeammembersDao.deleteById(teammembersid) > 0;
    }
}