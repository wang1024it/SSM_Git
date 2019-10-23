package com.logistics.service.impl;

import com.logistics.entity.BInformation;
import com.logistics.dao.BInformationDao;
import com.logistics.service.BInformationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BInformation)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@Service("bInformationService")
public class BInformationServiceImpl implements BInformationService {
    @Resource
    private BInformationDao bInformationDao;

    /**
     * 通过ID查询单条数据
     *
     * @param informationid 主键
     * @return 实例对象
     */
    @Override
    public BInformation queryById(Integer informationid) {
        return this.bInformationDao.queryById(informationid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BInformation> queryAllByLimit(int offset, int limit) {
        return this.bInformationDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bInformation 实例对象
     * @return 实例对象
     */
    @Override
    public BInformation insert(BInformation bInformation) {
        this.bInformationDao.insert(bInformation);
        return bInformation;
    }

    /**
     * 修改数据
     *
     * @param bInformation 实例对象
     * @return 实例对象
     */
    @Override
    public BInformation update(BInformation bInformation) {
        this.bInformationDao.update(bInformation);
        return this.queryById(bInformation.getInformationid());
    }

    /**
     * 通过主键删除数据
     *
     * @param informationid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer informationid) {
        return this.bInformationDao.deleteById(informationid) > 0;
    }
}