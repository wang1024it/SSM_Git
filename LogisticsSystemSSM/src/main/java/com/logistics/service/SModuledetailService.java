package com.logistics.service;

import com.logistics.entity.SModuledetail;
import java.util.List;

/**
 * (SModuledetail)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SModuledetailService {

    /**
     * 通过ID查询单条数据
     *
     * @param moduledetailid 主键
     * @return 实例对象
     */
    SModuledetail queryById(Integer moduledetailid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SModuledetail> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sModuledetail 实例对象
     * @return 实例对象
     */
    SModuledetail insert(SModuledetail sModuledetail);

    /**
     * 修改数据
     *
     * @param sModuledetail 实例对象
     * @return 实例对象
     */
    SModuledetail update(SModuledetail sModuledetail);

    /**
     * 通过主键删除数据
     *
     * @param moduledetailid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer moduledetailid);

}