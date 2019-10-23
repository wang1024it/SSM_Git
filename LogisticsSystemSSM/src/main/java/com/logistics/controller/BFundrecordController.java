package com.logistics.controller;

import com.logistics.entity.BFundrecord;
import com.logistics.service.BFundrecordService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BFundrecord)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@RestController
@RequestMapping("bFundrecord")
public class BFundrecordController {
    /**
     * 服务对象
     */
    @Resource
    private BFundrecordService bFundrecordService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BFundrecord selectOne(Integer id) {
        return this.bFundrecordService.queryById(id);
    }

}