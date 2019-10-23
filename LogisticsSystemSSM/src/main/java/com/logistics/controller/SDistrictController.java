package com.logistics.controller;

import com.logistics.entity.SDistrict;
import com.logistics.service.SDistrictService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SDistrict)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sDistrict")
public class SDistrictController {
    /**
     * 服务对象
     */
    @Resource
    private SDistrictService sDistrictService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SDistrict selectOne(Integer id) {
        return this.sDistrictService.queryById(id);
    }

}