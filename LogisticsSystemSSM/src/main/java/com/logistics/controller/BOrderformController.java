package com.logistics.controller;

import com.logistics.entity.BOrderform;
import com.logistics.service.BOrderformService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BOrderform)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bOrderform")
public class BOrderformController {
    /**
     * 服务对象
     */
    @Resource
    private BOrderformService bOrderformService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BOrderform selectOne(Integer id) {
        return this.bOrderformService.queryById(id);
    }

}