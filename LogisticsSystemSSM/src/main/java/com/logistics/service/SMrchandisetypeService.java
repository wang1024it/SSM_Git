package com.logistics.service;

import com.logistics.entity.SMrchandisetype;
import java.util.List;

/**
 * (SMrchandisetype)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SMrchandisetypeService {

    /**
     * 通过ID查询单条数据
     *
     * @param mrchandisetypeid 主键
     * @return 实例对象
     */
    SMrchandisetype queryById(Integer mrchandisetypeid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SMrchandisetype> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param sMrchandisetype 实例对象
     * @return 实例对象
     */
    SMrchandisetype insert(SMrchandisetype sMrchandisetype);

    /**
     * 修改数据
     *
     * @param sMrchandisetype 实例对象
     * @return 实例对象
     */
    SMrchandisetype update(SMrchandisetype sMrchandisetype);

    /**
     * 通过主键删除数据
     *
     * @param mrchandisetypeid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer mrchandisetypeid);

}