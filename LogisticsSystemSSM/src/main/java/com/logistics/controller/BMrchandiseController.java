package com.logistics.controller;

import com.logistics.entity.BMrchandise;
import com.logistics.service.BMrchandiseService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BMrchandise)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bMrchandise")
public class BMrchandiseController {
    /**
     * 服务对象
     */
    @Resource
    private BMrchandiseService bMrchandiseService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BMrchandise selectOne(Integer id) {
        return this.bMrchandiseService.queryById(id);
    }

}