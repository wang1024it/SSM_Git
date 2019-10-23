package com.logistics.controller;

import com.logistics.entity.SCustomertype;
import com.logistics.service.SCustomertypeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SCustomertype)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sCustomertype")
public class SCustomertypeController {
    /**
     * 服务对象
     */
    @Resource
    private SCustomertypeService sCustomertypeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SCustomertype selectOne(Integer id) {
        return this.sCustomertypeService.queryById(id);
    }

}