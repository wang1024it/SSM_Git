package com.logistics.controller;

import com.logistics.entity.SInstitutionalorganization;
import com.logistics.service.SInstitutionalorganizationService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SInstitutionalorganization)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sInstitutionalorganization")
public class SInstitutionalorganizationController {
    /**
     * 服务对象
     */
    @Resource
    private SInstitutionalorganizationService sInstitutionalorganizationService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SInstitutionalorganization selectOne(Integer id) {
        return this.sInstitutionalorganizationService.queryById(id);
    }

}