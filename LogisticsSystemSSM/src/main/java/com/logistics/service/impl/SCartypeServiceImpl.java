package com.logistics.service.impl;

import com.logistics.entity.SCartype;
import com.logistics.dao.SCartypeDao;
import com.logistics.service.SCartypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SCartype)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("sCartypeService")
public class SCartypeServiceImpl implements SCartypeService {
    @Resource
    private SCartypeDao sCartypeDao;

    /**
     * 通过ID查询单条数据
     *
     * @param cartypeid 主键
     * @return 实例对象
     */
    @Override
    public SCartype queryById(Integer cartypeid) {
        return this.sCartypeDao.queryById(cartypeid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SCartype> queryAllByLimit(int offset, int limit) {
        return this.sCartypeDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sCartype 实例对象
     * @return 实例对象
     */
    @Override
    public SCartype insert(SCartype sCartype) {
        this.sCartypeDao.insert(sCartype);
        return sCartype;
    }

    /**
     * 修改数据
     *
     * @param sCartype 实例对象
     * @return 实例对象
     */
    @Override
    public SCartype update(SCartype sCartype) {
        this.sCartypeDao.update(sCartype);
        return this.queryById(sCartype.getCartypeid());
    }

    /**
     * 通过主键删除数据
     *
     * @param cartypeid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer cartypeid) {
        return this.sCartypeDao.deleteById(cartypeid) > 0;
    }
}