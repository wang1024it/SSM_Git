package com.logistics.service.impl;

import com.logistics.entity.SUsertype;
import com.logistics.dao.SUsertypeDao;
import com.logistics.service.SUsertypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SUsertype)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
@Service("sUsertypeService")
public class SUsertypeServiceImpl implements SUsertypeService {
    @Resource
    private SUsertypeDao sUsertypeDao;

    /**
     * 通过ID查询单条数据
     *
     * @param usertypeid 主键
     * @return 实例对象
     */
    @Override
    public SUsertype queryById(Integer usertypeid) {
        return this.sUsertypeDao.queryById(usertypeid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SUsertype> queryAllByLimit(int offset, int limit) {
        return this.sUsertypeDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sUsertype 实例对象
     * @return 实例对象
     */
    @Override
    public SUsertype insert(SUsertype sUsertype) {
        this.sUsertypeDao.insert(sUsertype);
        return sUsertype;
    }

    /**
     * 修改数据
     *
     * @param sUsertype 实例对象
     * @return 实例对象
     */
    @Override
    public SUsertype update(SUsertype sUsertype) {
        this.sUsertypeDao.update(sUsertype);
        return this.queryById(sUsertype.getUsertypeid());
    }

    /**
     * 通过主键删除数据
     *
     * @param usertypeid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer usertypeid) {
        return this.sUsertypeDao.deleteById(usertypeid) > 0;
    }
}