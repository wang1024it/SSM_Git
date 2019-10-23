package com.logistics.service;

import com.logistics.entity.BAttendance;
import java.util.List;

/**
 * (BAttendance)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
public interface BAttendanceService {

    /**
     * 通过ID查询单条数据
     *
     * @param attendanceid 主键
     * @return 实例对象
     */
    BAttendance queryById(Integer attendanceid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BAttendance> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bAttendance 实例对象
     * @return 实例对象
     */
    BAttendance insert(BAttendance bAttendance);

    /**
     * 修改数据
     *
     * @param bAttendance 实例对象
     * @return 实例对象
     */
    BAttendance update(BAttendance bAttendance);

    /**
     * 通过主键删除数据
     *
     * @param attendanceid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer attendanceid);

}