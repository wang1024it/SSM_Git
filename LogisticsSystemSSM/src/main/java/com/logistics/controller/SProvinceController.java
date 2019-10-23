package com.logistics.controller;

import com.logistics.entity.SProvince;
import com.logistics.service.SProvinceService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SProvince)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sProvince")
public class SProvinceController {
    /**
     * 服务对象
     */
    @Resource
    private SProvinceService sProvinceService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SProvince selectOne(Integer id) {
        return this.sProvinceService.queryById(id);
    }

}