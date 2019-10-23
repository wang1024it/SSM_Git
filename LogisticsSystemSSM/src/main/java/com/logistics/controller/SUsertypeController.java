package com.logistics.controller;

import com.logistics.entity.SUsertype;
import com.logistics.service.SUsertypeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SUsertype)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
@RestController
@RequestMapping("sUsertype")
public class SUsertypeController {
    /**
     * 服务对象
     */
    @Resource
    private SUsertypeService sUsertypeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SUsertype selectOne(Integer id) {
        return this.sUsertypeService.queryById(id);
    }

}