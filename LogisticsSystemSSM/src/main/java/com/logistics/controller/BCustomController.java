package com.logistics.controller;

import com.logistics.entity.BCustom;
import com.logistics.service.BCustomService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BCustom)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@RestController
@RequestMapping("bCustom")
public class BCustomController {
    /**
     * 服务对象
     */
    @Resource
    private BCustomService bCustomService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BCustom selectOne(Integer id) {
        return this.bCustomService.queryById(id);
    }

}