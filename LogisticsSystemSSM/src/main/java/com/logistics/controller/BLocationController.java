package com.logistics.controller;

import com.logistics.entity.BLocation;
import com.logistics.service.BLocationService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BLocation)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@RestController
@RequestMapping("bLocation")
public class BLocationController {
    /**
     * 服务对象
     */
    @Resource
    private BLocationService bLocationService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BLocation selectOne(Integer id) {
        return this.bLocationService.queryById(id);
    }

}