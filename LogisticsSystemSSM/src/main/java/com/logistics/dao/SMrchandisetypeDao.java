package com.logistics.dao;

import com.logistics.entity.SMrchandisetype;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (SMrchandisetype)表数据库访问层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
public interface SMrchandisetypeDao {

    /**
     * 通过ID查询单条数据
     *
     * @param mrchandisetypeid 主键
     * @return 实例对象
     */
    SMrchandisetype queryById(Integer mrchandisetypeid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<SMrchandisetype> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param sMrchandisetype 实例对象
     * @return 对象列表
     */
    List<SMrchandisetype> queryAll(SMrchandisetype sMrchandisetype);

    /**
     * 新增数据
     *
     * @param sMrchandisetype 实例对象
     * @return 影响行数
     */
    int insert(SMrchandisetype sMrchandisetype);

    /**
     * 修改数据
     *
     * @param sMrchandisetype 实例对象
     * @return 影响行数
     */
    int update(SMrchandisetype sMrchandisetype);

    /**
     * 通过主键删除数据
     *
     * @param mrchandisetypeid 主键
     * @return 影响行数
     */
    int deleteById(Integer mrchandisetypeid);

}