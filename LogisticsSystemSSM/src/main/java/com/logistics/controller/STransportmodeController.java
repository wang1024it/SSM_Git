package com.logistics.controller;

import com.logistics.entity.STransportmode;
import com.logistics.service.STransportmodeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (STransportmode)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:33:01
 */
@RestController
@RequestMapping("sTransportmode")
public class STransportmodeController {
    /**
     * 服务对象
     */
    @Resource
    private STransportmodeService sTransportmodeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public STransportmode selectOne(Integer id) {
        return this.sTransportmodeService.queryById(id);
    }

}