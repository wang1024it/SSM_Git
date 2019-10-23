package com.logistics.controller;

import com.logistics.entity.BInformation;
import com.logistics.service.BInformationService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BInformation)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@RestController
@RequestMapping("bInformation")
public class BInformationController {
    /**
     * 服务对象
     */
    @Resource
    private BInformationService bInformationService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BInformation selectOne(Integer id) {
        return this.bInformationService.queryById(id);
    }

}