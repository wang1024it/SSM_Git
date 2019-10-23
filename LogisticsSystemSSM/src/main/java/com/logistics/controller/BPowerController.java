package com.logistics.controller;

import com.logistics.entity.BPower;
import com.logistics.service.BPowerService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BPower)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bPower")
public class BPowerController {
    /**
     * 服务对象
     */
    @Resource
    private BPowerService bPowerService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BPower selectOne(Integer id) {
        return this.bPowerService.queryById(id);
    }

}