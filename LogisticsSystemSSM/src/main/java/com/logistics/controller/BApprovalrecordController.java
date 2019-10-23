package com.logistics.controller;

import com.logistics.entity.BApprovalrecord;
import com.logistics.service.BApprovalrecordService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BApprovalrecord)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:56
 */
@RestController
@RequestMapping("bApprovalrecord")
public class BApprovalrecordController {
    /**
     * 服务对象
     */
    @Resource
    private BApprovalrecordService bApprovalrecordService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BApprovalrecord selectOne(Integer id) {
        return this.bApprovalrecordService.queryById(id);
    }

}