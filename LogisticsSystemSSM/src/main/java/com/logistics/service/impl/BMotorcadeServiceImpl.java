package com.logistics.service.impl;

import com.logistics.entity.BMotorcade;
import com.logistics.dao.BMotorcadeDao;
import com.logistics.service.BMotorcadeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BMotorcade)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@Service("bMotorcadeService")
public class BMotorcadeServiceImpl implements BMotorcadeService {
    @Resource
    private BMotorcadeDao bMotorcadeDao;

    /**
     * 通过ID查询单条数据
     *
     * @param motorcadeid 主键
     * @return 实例对象
     */
    @Override
    public BMotorcade queryById(Integer motorcadeid) {
        return this.bMotorcadeDao.queryById(motorcadeid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BMotorcade> queryAllByLimit(int offset, int limit) {
        return this.bMotorcadeDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bMotorcade 实例对象
     * @return 实例对象
     */
    @Override
    public BMotorcade insert(BMotorcade bMotorcade) {
        this.bMotorcadeDao.insert(bMotorcade);
        return bMotorcade;
    }

    /**
     * 修改数据
     *
     * @param bMotorcade 实例对象
     * @return 实例对象
     */
    @Override
    public BMotorcade update(BMotorcade bMotorcade) {
        this.bMotorcadeDao.update(bMotorcade);
        return this.queryById(bMotorcade.getMotorcadeid());
    }

    /**
     * 通过主键删除数据
     *
     * @param motorcadeid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer motorcadeid) {
        return this.bMotorcadeDao.deleteById(motorcadeid) > 0;
    }
}