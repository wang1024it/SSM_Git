package com.logistics.controller;

import com.logistics.entity.SMrchandisetype;
import com.logistics.service.SMrchandisetypeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (SMrchandisetype)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:00
 */
@RestController
@RequestMapping("sMrchandisetype")
public class SMrchandisetypeController {
    /**
     * 服务对象
     */
    @Resource
    private SMrchandisetypeService sMrchandisetypeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public SMrchandisetype selectOne(Integer id) {
        return this.sMrchandisetypeService.queryById(id);
    }

}