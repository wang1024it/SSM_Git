package com.logistics.controller;

import com.logistics.entity.BBankcardinformation;
import com.logistics.service.BBankcardinformationService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BBankcardinformation)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:58
 */
@RestController
@RequestMapping("bBankcardinformation")
public class BBankcardinformationController {
    /**
     * 服务对象
     */
    @Resource
    private BBankcardinformationService bBankcardinformationService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BBankcardinformation selectOne(Integer id) {
        return this.bBankcardinformationService.queryById(id);
    }

}