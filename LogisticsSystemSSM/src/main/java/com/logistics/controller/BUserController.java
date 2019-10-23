package com.logistics.controller;

import com.logistics.entity.BUser;
import com.logistics.service.BUserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BUser)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bUser")
public class BUserController {
    /**
     * 服务对象
     */
    @Resource
    private BUserService bUserService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BUser selectOne(Integer id) {
        return this.bUserService.queryById(id);
    }

}