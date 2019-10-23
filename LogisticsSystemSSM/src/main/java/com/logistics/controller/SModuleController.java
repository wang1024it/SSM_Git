package com.logistics.controller;

import com.logistics.entity.SModule;
import com.logistics.service.SModuleService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SModule)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sModule")
public class SModuleController {
    /**
     * 服务对象
     */
    @Resource
    private SModuleService sModuleService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SModule selectOne(Integer id) {
        return this.sModuleService.queryById(id);
    }

}