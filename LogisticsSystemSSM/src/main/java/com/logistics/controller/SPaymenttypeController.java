package com.logistics.controller;

import com.logistics.entity.SPaymenttype;
import com.logistics.service.SPaymenttypeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SPaymenttype)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sPaymenttype")
public class SPaymenttypeController {
    /**
     * 服务对象
     */
    @Resource
    private SPaymenttypeService sPaymenttypeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SPaymenttype selectOne(Integer id) {
        return this.sPaymenttypeService.queryById(id);
    }

}