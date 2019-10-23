package com.logistics.controller;

import com.logistics.entity.SCity;
import com.logistics.service.SCityService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SCity)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sCity")
public class SCityController {
    /**
     * 服务对象
     */
    @Resource
    private SCityService sCityService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SCity selectOne(Integer id) {
        return this.sCityService.queryById(id);
    }

}