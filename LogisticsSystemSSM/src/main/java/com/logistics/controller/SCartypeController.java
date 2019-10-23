package com.logistics.controller;

import com.logistics.entity.SCartype;
import com.logistics.service.SCartypeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SCartype)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("sCartype")
public class SCartypeController {
    /**
     * 服务对象
     */
    @Resource
    private SCartypeService sCartypeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SCartype selectOne(Integer id) {
        return this.sCartypeService.queryById(id);
    }

}