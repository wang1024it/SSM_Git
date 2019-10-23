package com.logistics.controller;

import com.logistics.entity.BUsertypedetail;
import com.logistics.service.BUsertypedetailService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BUsertypedetail)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bUsertypedetail")
public class BUsertypedetailController {
    /**
     * 服务对象
     */
    @Resource
    private BUsertypedetailService bUsertypedetailService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BUsertypedetail selectOne(Integer id) {
        return this.bUsertypedetailService.queryById(id);
    }

}