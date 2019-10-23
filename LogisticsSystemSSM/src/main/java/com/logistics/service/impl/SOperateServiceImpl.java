package com.logistics.service.impl;

import com.logistics.entity.SOperate;
import com.logistics.dao.SOperateDao;
import com.logistics.service.SOperateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (SOperate)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@Service("sOperateService")
public class SOperateServiceImpl implements SOperateService {
    @Resource
    private SOperateDao sOperateDao;

    /**
     * 通过ID查询单条数据
     *
     * @param operateid 主键
     * @return 实例对象
     */
    @Override
    public SOperate queryById(Integer operateid) {
        return this.sOperateDao.queryById(operateid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<SOperate> queryAllByLimit(int offset, int limit) {
        return this.sOperateDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param sOperate 实例对象
     * @return 实例对象
     */
    @Override
    public SOperate insert(SOperate sOperate) {
        this.sOperateDao.insert(sOperate);
        return sOperate;
    }

    /**
     * 修改数据
     *
     * @param sOperate 实例对象
     * @return 实例对象
     */
    @Override
    public SOperate update(SOperate sOperate) {
        this.sOperateDao.update(sOperate);
        return this.queryById(sOperate.getOperateid());
    }

    /**
     * 通过主键删除数据
     *
     * @param operateid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer operateid) {
        return this.sOperateDao.deleteById(operateid) > 0;
    }
}