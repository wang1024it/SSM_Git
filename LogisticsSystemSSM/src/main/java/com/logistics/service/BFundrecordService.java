package com.logistics.service;

import com.logistics.entity.BFundrecord;
import java.util.List;

/**
 * (BFundrecord)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BFundrecordService {

    /**
     * 通过ID查询单条数据
     *
     * @param fundrecordid 主键
     * @return 实例对象
     */
    BFundrecord queryById(Integer fundrecordid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BFundrecord> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bFundrecord 实例对象
     * @return 实例对象
     */
    BFundrecord insert(BFundrecord bFundrecord);

    /**
     * 修改数据
     *
     * @param bFundrecord 实例对象
     * @return 实例对象
     */
    BFundrecord update(BFundrecord bFundrecord);

    /**
     * 通过主键删除数据
     *
     * @param fundrecordid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer fundrecordid);

}