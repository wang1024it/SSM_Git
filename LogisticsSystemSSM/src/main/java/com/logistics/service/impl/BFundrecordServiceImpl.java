package com.logistics.service.impl;

import com.logistics.entity.BFundrecord;
import com.logistics.dao.BFundrecordDao;
import com.logistics.service.BFundrecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BFundrecord)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@Service("bFundrecordService")
public class BFundrecordServiceImpl implements BFundrecordService {
    @Resource
    private BFundrecordDao bFundrecordDao;

    /**
     * 通过ID查询单条数据
     *
     * @param fundrecordid 主键
     * @return 实例对象
     */
    @Override
    public BFundrecord queryById(Integer fundrecordid) {
        return this.bFundrecordDao.queryById(fundrecordid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BFundrecord> queryAllByLimit(int offset, int limit) {
        return this.bFundrecordDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bFundrecord 实例对象
     * @return 实例对象
     */
    @Override
    public BFundrecord insert(BFundrecord bFundrecord) {
        this.bFundrecordDao.insert(bFundrecord);
        return bFundrecord;
    }

    /**
     * 修改数据
     *
     * @param bFundrecord 实例对象
     * @return 实例对象
     */
    @Override
    public BFundrecord update(BFundrecord bFundrecord) {
        this.bFundrecordDao.update(bFundrecord);
        return this.queryById(bFundrecord.getFundrecordid());
    }

    /**
     * 通过主键删除数据
     *
     * @param fundrecordid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer fundrecordid) {
        return this.bFundrecordDao.deleteById(fundrecordid) > 0;
    }
}