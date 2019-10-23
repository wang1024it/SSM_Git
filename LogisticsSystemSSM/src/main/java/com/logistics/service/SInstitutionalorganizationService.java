package com.logistics.service;

import com.logistics.entity.SInstitutionalorganization;
import java.util.List;

/**
 * (SInstitutionalorganization)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SInstitutionalorganizationService {

    /**
     * 通过ID查询单条数据
     *
     * @param institutionalorganizationid 主键
     * @return 实例对象
     */
    SInstitutionalorganization queryById(Integer institutionalorganizationid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SInstitutionalorganization> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sInstitutionalorganization 实例对象
     * @return 实例对象
     */
    SInstitutionalorganization insert(SInstitutionalorganization sInstitutionalorganization);

    /**
     * 修改数据
     *
     * @param sInstitutionalorganization 实例对象
     * @return 实例对象
     */
    SInstitutionalorganization update(SInstitutionalorganization sInstitutionalorganization);

    /**
     * 通过主键删除数据
     *
     * @param institutionalorganizationid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer institutionalorganizationid);

}