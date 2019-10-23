package com.logistics.controller;

import com.logistics.entity.BMotorcade;
import com.logistics.service.BMotorcadeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BMotorcade)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bMotorcade")
public class BMotorcadeController {
    /**
     * 服务对象
     */
    @Resource
    private BMotorcadeService bMotorcadeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BMotorcade selectOne(Integer id) {
        return this.bMotorcadeService.queryById(id);
    }

}