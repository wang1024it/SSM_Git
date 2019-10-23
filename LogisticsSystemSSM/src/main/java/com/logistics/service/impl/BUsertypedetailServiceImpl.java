package com.logistics.service.impl;

import com.logistics.entity.BUsertypedetail;
import com.logistics.dao.BUsertypedetailDao;
import com.logistics.service.BUsertypedetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BUsertypedetail)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bUsertypedetailService")
public class BUsertypedetailServiceImpl implements BUsertypedetailService {
    @Resource
    private BUsertypedetailDao bUsertypedetailDao;

    /**
     * 通过ID查询单条数据
     *
     * @param usertypedetailid 主键
     * @return 实例对象
     */
    @Override
    public BUsertypedetail queryById(Integer usertypedetailid) {
        return this.bUsertypedetailDao.queryById(usertypedetailid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BUsertypedetail> queryAllByLimit(int offset, int limit) {
        return this.bUsertypedetailDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bUsertypedetail 实例对象
     * @return 实例对象
     */
    @Override
    public BUsertypedetail insert(BUsertypedetail bUsertypedetail) {
        this.bUsertypedetailDao.insert(bUsertypedetail);
        return bUsertypedetail;
    }

    /**
     * 修改数据
     *
     * @param bUsertypedetail 实例对象
     * @return 实例对象
     */
    @Override
    public BUsertypedetail update(BUsertypedetail bUsertypedetail) {
        this.bUsertypedetailDao.update(bUsertypedetail);
        return this.queryById(bUsertypedetail.getUsertypedetailid());
    }

    /**
     * 通过主键删除数据
     *
     * @param usertypedetailid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer usertypedetailid) {
        return this.bUsertypedetailDao.deleteById(usertypedetailid) > 0;
    }
}