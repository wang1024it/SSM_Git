package com.logistics.service.impl;

import com.logistics.entity.BAttendance;
import com.logistics.dao.BAttendanceDao;
import com.logistics.service.BAttendanceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (BAttendance)表服务实现类
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@Service("bAttendanceService")
public class BAttendanceServiceImpl implements BAttendanceService {
    @Resource
    private BAttendanceDao bAttendanceDao;

    /**
     * 通过ID查询单条数据
     *
     * @param attendanceid 主键
     * @return 实例对象
     */
    @Override
    public BAttendance queryById(Integer attendanceid) {
        return this.bAttendanceDao.queryById(attendanceid);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<BAttendance> queryAllByLimit(int offset, int limit) {
        return this.bAttendanceDao.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param bAttendance 实例对象
     * @return 实例对象
     */
    @Override
    public BAttendance insert(BAttendance bAttendance) {
        this.bAttendanceDao.insert(bAttendance);
        return bAttendance;
    }

    /**
     * 修改数据
     *
     * @param bAttendance 实例对象
     * @return 实例对象
     */
    @Override
    public BAttendance update(BAttendance bAttendance) {
        this.bAttendanceDao.update(bAttendance);
        return this.queryById(bAttendance.getAttendanceid());
    }

    /**
     * 通过主键删除数据
     *
     * @param attendanceid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer attendanceid) {
        return this.bAttendanceDao.deleteById(attendanceid) > 0;
    }
}