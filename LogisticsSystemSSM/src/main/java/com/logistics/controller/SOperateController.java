package com.logistics.controller;

import com.logistics.entity.SOperate;
import com.logistics.service.SOperateService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SOperate)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sOperate")
public class SOperateController {
    /**
     * 服务对象
     */
    @Resource
    private SOperateService sOperateService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SOperate selectOne(Integer id) {
        return this.sOperateService.queryById(id);
    }

}