package com.logistics.controller;

import com.logistics.entity.BCar;
import com.logistics.service.BCarService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BCar)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@RestController
@RequestMapping("bCar")
public class BCarController {
    /**
     * 服务对象
     */
    @Resource
    private BCarService bCarService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BCar selectOne(Integer id) {
        return this.bCarService.queryById(id);
    }

}