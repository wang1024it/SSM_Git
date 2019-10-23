package com.logistics.controller;

import com.logistics.entity.BCancel;
import com.logistics.service.BCancelService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BCancel)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@RestController
@RequestMapping("bCancel")
public class BCancelController {
    /**
     * 服务对象
     */
    @Resource
    private BCancelService bCancelService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BCancel selectOne(Integer id) {
        return this.bCancelService.queryById(id);
    }

}