package com.logistics.controller;

import com.logistics.entity.SPayment;
import com.logistics.service.SPaymentService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SPayment)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sPayment")
public class SPaymentController {
    /**
     * 服务对象
     */
    @Resource
    private SPaymentService sPaymentService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SPayment selectOne(Integer id) {
        return this.sPaymentService.queryById(id);
    }

}