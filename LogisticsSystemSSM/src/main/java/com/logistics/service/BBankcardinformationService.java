package com.logistics.service;

import com.logistics.entity.BBankcardinformation;
import java.util.List;

/**
 * (BBankcardinformation)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BBankcardinformationService {

    /**
     * 通过ID查询单条数据
     *
     * @param bankcardinformationid 主键
     * @return 实例对象
     */
    BBankcardinformation queryById(Integer bankcardinformationid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BBankcardinformation> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bBankcardinformation 实例对象
     * @return 实例对象
     */
    BBankcardinformation insert(BBankcardinformation bBankcardinformation);

    /**
     * 修改数据
     *
     * @param bBankcardinformation 实例对象
     * @return 实例对象
     */
    BBankcardinformation update(BBankcardinformation bBankcardinformation);

    /**
     * 通过主键删除数据
     *
     * @param bankcardinformationid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer bankcardinformationid);

}