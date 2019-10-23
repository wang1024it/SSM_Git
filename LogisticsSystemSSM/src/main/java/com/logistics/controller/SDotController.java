package com.logistics.controller;

import com.logistics.entity.SDot;
import com.logistics.service.SDotService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SDot)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sDot")
public class SDotController {
    /**
     * 服务对象
     */
    @Resource
    private SDotService sDotService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SDot selectOne(Integer id) {
        return this.sDotService.queryById(id);
    }

}