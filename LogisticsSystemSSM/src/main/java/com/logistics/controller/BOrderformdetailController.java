package com.logistics.controller;

import com.logistics.entity.BOrderformdetail;
import com.logistics.service.BOrderformdetailService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BOrderformdetail)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bOrderformdetail")
public class BOrderformdetailController {
    /**
     * 服务对象
     */
    @Resource
    private BOrderformdetailService bOrderformdetailService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BOrderformdetail selectOne(Integer id) {
        return this.bOrderformdetailService.queryById(id);
    }

}