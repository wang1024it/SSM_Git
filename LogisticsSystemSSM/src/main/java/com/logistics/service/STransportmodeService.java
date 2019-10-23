package com.logistics.service;

import com.logistics.entity.STransportmode;
import java.util.List;

/**
 * (STransportmode)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
public interface STransportmodeService {

    /**
     * 通过ID查询单条数据
     *
     * @param transportmodeid 主键
     * @return 实例对象
     */
    STransportmode queryById(Integer transportmodeid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<STransportmode> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sTransportmode 实例对象
     * @return 实例对象
     */
    STransportmode insert(STransportmode sTransportmode);

    /**
     * 修改数据
     *
     * @param sTransportmode 实例对象
     * @return 实例对象
     */
    STransportmode update(STransportmode sTransportmode);

    /**
     * 通过主键删除数据
     *
     * @param transportmodeid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer transportmodeid);

}