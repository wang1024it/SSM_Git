package com.logistics.service.impl;

import com.logistics.entity.BUser;
import com.logistics.dao.BUserDao;
import com.logistics.service.BUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BUser)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bUserService")
public class BUserServiceImpl implements BUserService {
    @Resource
    private BUserDao bUserDao;

    /**
     * 通过ID查询单条数据
     *
     * @param userid 主键
     * @return 实例对象
     */
    @Override
    public BUser queryById(Integer userid) {
        return this.bUserDao.queryById(userid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BUser> queryAllByLimit(int offset, int limit) {
        return this.bUserDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bUser 实例对象
     * @return 实例对象
     */
    @Override
    public BUser insert(BUser bUser) {
        this.bUserDao.insert(bUser);
        return bUser;
    }

    /**
     * 修改数据
     *
     * @param bUser 实例对象
     * @return 实例对象
     */
    @Override
    public BUser update(BUser bUser) {
        this.bUserDao.update(bUser);
        return this.queryById(bUser.getUserid());
    }

    /**
     * 通过主键删除数据
     *
     * @param userid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer userid) {
        return this.bUserDao.deleteById(userid) > 0;
    }
}