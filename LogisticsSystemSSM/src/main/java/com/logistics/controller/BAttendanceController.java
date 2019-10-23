package com.logistics.controller;

import com.logistics.entity.BAttendance;
import com.logistics.service.BAttendanceService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BAttendance)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@RestController
@RequestMapping("bAttendance")
public class BAttendanceController {
    /**
     * 服务对象
     */
    @Resource
    private BAttendanceService bAttendanceService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BAttendance selectOne(Integer id) {
        return this.bAttendanceService.queryById(id);
    }

}