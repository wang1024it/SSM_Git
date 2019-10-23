package com.logistics.service.impl;

import com.logistics.entity.BProcuratory;
import com.logistics.dao.BProcuratoryDao;
import com.logistics.service.BProcuratoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BProcuratory)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bProcuratoryService")
public class BProcuratoryServiceImpl implements BProcuratoryService {
    @Resource
    private BProcuratoryDao bProcuratoryDao;

    /**
     * 通过ID查询单条数据
     *
     * @param procuratoryid 主键
     * @return 实例对象
     */
    @Override
    public BProcuratory queryById(Integer procuratoryid) {
        return this.bProcuratoryDao.queryById(procuratoryid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BProcuratory> queryAllByLimit(int offset, int limit) {
        return this.bProcuratoryDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bProcuratory 实例对象
     * @return 实例对象
     */
    @Override
    public BProcuratory insert(BProcuratory bProcuratory) {
        this.bProcuratoryDao.insert(bProcuratory);
        return bProcuratory;
    }

    /**
     * 修改数据
     *
     * @param bProcuratory 实例对象
     * @return 实例对象
     */
    @Override
    public BProcuratory update(BProcuratory bProcuratory) {
        this.bProcuratoryDao.update(bProcuratory);
        return this.queryById(bProcuratory.getProcuratoryid());
    }

    /**
     * 通过主键删除数据
     *
     * @param procuratoryid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer procuratoryid) {
        return this.bProcuratoryDao.deleteById(procuratoryid) > 0;
    }
}