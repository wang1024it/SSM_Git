package com.logistics.service.impl;

import com.logistics.entity.BBankcardinformation;
import com.logistics.dao.BBankcardinformationDao;
import com.logistics.service.BBankcardinformationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BBankcardinformation)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@Service("bBankcardinformationService")
public class BBankcardinformationServiceImpl implements BBankcardinformationService {
    @Resource
    private BBankcardinformationDao bBankcardinformationDao;

    /**
     * 通过ID查询单条数据
     *
     * @param bankcardinformationid 主键
     * @return 实例对象
     */
    @Override
    public BBankcardinformation queryById(Integer bankcardinformationid) {
        return this.bBankcardinformationDao.queryById(bankcardinformationid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BBankcardinformation> queryAllByLimit(int offset, int limit) {
        return this.bBankcardinformationDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bBankcardinformation 实例对象
     * @return 实例对象
     */
    @Override
    public BBankcardinformation insert(BBankcardinformation bBankcardinformation) {
        this.bBankcardinformationDao.insert(bBankcardinformation);
        return bBankcardinformation;
    }

    /**
     * 修改数据
     *
     * @param bBankcardinformation 实例对象
     * @return 实例对象
     */
    @Override
    public BBankcardinformation update(BBankcardinformation bBankcardinformation) {
        this.bBankcardinformationDao.update(bBankcardinformation);
        return this.queryById(bBankcardinformation.getBankcardinformationid());
    }

    /**
     * 通过主键删除数据
     *
     * @param bankcardinformationid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer bankcardinformationid) {
        return this.bBankcardinformationDao.deleteById(bankcardinformationid) > 0;
    }
}