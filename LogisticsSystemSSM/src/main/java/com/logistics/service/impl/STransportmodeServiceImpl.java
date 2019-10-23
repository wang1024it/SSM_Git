package com.logistics.service.impl;

import com.logistics.entity.STransportmode;
import com.logistics.dao.STransportmodeDao;
import com.logistics.service.STransportmodeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (STransportmode)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
@Service("sTransportmodeService")
public class STransportmodeServiceImpl implements STransportmodeService {
    @Resource
    private STransportmodeDao sTransportmodeDao;

    /**
     * 通过ID查询单条数据
     *
     * @param transportmodeid 主键
     * @return 实例对象
     */
    @Override
    public STransportmode queryById(Integer transportmodeid) {
        return this.sTransportmodeDao.queryById(transportmodeid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<STransportmode> queryAllByLimit(int offset, int limit) {
        return this.sTransportmodeDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sTransportmode 实例对象
     * @return 实例对象
     */
    @Override
    public STransportmode insert(STransportmode sTransportmode) {
        this.sTransportmodeDao.insert(sTransportmode);
        return sTransportmode;
    }

    /**
     * 修改数据
     *
     * @param sTransportmode 实例对象
     * @return 实例对象
     */
    @Override
    public STransportmode update(STransportmode sTransportmode) {
        this.sTransportmodeDao.update(sTransportmode);
        return this.queryById(sTransportmode.getTransportmodeid());
    }

    /**
     * 通过主键删除数据
     *
     * @param transportmodeid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer transportmodeid) {
        return this.sTransportmodeDao.deleteById(transportmodeid) > 0;
    }
}