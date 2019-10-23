package com.logistics.service.impl;

import com.logistics.entity.SMrchandisetype;
import com.logistics.dao.SMrchandisetypeDao;
import com.logistics.service.SMrchandisetypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SMrchandisetype)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sMrchandisetypeService")
public class SMrchandisetypeServiceImpl implements SMrchandisetypeService {
    @Resource
    private SMrchandisetypeDao sMrchandisetypeDao;

    /**
     * 通过ID查询单条数据
     *
     * @param mrchandisetypeid 主键
     * @return 实例对象
     */
    @Override
    public SMrchandisetype queryById(Integer mrchandisetypeid) {
        return this.sMrchandisetypeDao.queryById(mrchandisetypeid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SMrchandisetype> queryAllByLimit(int offset, int limit) {
        return this.sMrchandisetypeDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sMrchandisetype 实例对象
     * @return 实例对象
     */
    @Override
    public SMrchandisetype insert(SMrchandisetype sMrchandisetype) {
        this.sMrchandisetypeDao.insert(sMrchandisetype);
        return sMrchandisetype;
    }

    /**
     * 修改数据
     *
     * @param sMrchandisetype 实例对象
     * @return 实例对象
     */
    @Override
    public SMrchandisetype update(SMrchandisetype sMrchandisetype) {
        this.sMrchandisetypeDao.update(sMrchandisetype);
        return this.queryById(sMrchandisetype.getMrchandisetypeid());
    }

    /**
     * 通过主键删除数据
     *
     * @param mrchandisetypeid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer mrchandisetypeid) {
        return this.sMrchandisetypeDao.deleteById(mrchandisetypeid) > 0;
    }
}