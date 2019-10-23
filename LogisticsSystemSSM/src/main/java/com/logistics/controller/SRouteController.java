package com.logistics.controller;

import com.logistics.entity.SRoute;
import com.logistics.service.SRouteService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SRoute)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
@RestController
@RequestMapping("sRoute")
public class SRouteController {
    /**
     * 服务对象
     */
    @Resource
    private SRouteService sRouteService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SRoute selectOne(Integer id) {
        return this.sRouteService.queryById(id);
    }

}