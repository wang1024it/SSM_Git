package com.logistics.controller;

import com.logistics.entity.SBillingmethod;
import com.logistics.service.SBillingmethodService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SBillingmethod)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("sBillingmethod")
public class SBillingmethodController {
    /**
     * 服务对象
     */
    @Resource
    private SBillingmethodService sBillingmethodService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SBillingmethod selectOne(Integer id) {
        return this.sBillingmethodService.queryById(id);
    }

}