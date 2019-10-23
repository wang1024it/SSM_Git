package com.logistics.controller;

import com.logistics.entity.BReceivables;
import com.logistics.service.BReceivablesService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BReceivables)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bReceivables")
public class BReceivablesController {
    /**
     * 服务对象
     */
    @Resource
    private BReceivablesService bReceivablesService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BReceivables selectOne(Integer id) {
        return this.bReceivablesService.queryById(id);
    }

}