package com.logistics.controller;

import com.logistics.entity.BProcuratory;
import com.logistics.service.BProcuratoryService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BProcuratory)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bProcuratory")
public class BProcuratoryController {
    /**
     * 服务对象
     */
    @Resource
    private BProcuratoryService bProcuratoryService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BProcuratory selectOne(Integer id) {
        return this.bProcuratoryService.queryById(id);
    }

}