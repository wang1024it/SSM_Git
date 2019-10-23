package com.logistics.service;

import com.logistics.entity.BMotorcade;
import java.util.List;

/**
 * (BMotorcade)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BMotorcadeService {

    /**
     * 通过ID查询单条数据
     *
     * @param motorcadeid 主键
     * @return 实例对象
     */
    BMotorcade queryById(Integer motorcadeid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BMotorcade> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bMotorcade 实例对象
     * @return 实例对象
     */
    BMotorcade insert(BMotorcade bMotorcade);

    /**
     * 修改数据
     *
     * @param bMotorcade 实例对象
     * @return 实例对象
     */
    BMotorcade update(BMotorcade bMotorcade);

    /**
     * 通过主键删除数据
     *
     * @param motorcadeid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer motorcadeid);

}