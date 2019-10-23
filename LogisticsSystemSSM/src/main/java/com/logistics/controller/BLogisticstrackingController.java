package com.logistics.controller;

import com.logistics.entity.BLogisticstracking;
import com.logistics.service.BLogisticstrackingService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BLogisticstracking)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bLogisticstracking")
public class BLogisticstrackingController {
    /**
     * 服务对象
     */
    @Resource
    private BLogisticstrackingService bLogisticstrackingService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BLogisticstracking selectOne(Integer id) {
        return this.bLogisticstrackingService.queryById(id);
    }

}