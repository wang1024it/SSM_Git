package com.logistics.controller;

import com.logistics.entity.SStatus;
import com.logistics.service.SStatusService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SStatus)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
@RestController
@RequestMapping("sStatus")
public class SStatusController {
    /**
     * 服务对象
     */
    @Resource
    private SStatusService sStatusService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SStatus selectOne(Integer id) {
        return this.sStatusService.queryById(id);
    }

}