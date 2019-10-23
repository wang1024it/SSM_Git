package com.logistics.controller;

import com.logistics.entity.BTeammembers;
import com.logistics.service.BTeammembersService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BTeammembers)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bTeammembers")
public class BTeammembersController {
    /**
     * 服务对象
     */
    @Resource
    private BTeammembersService bTeammembersService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BTeammembers selectOne(Integer id) {
        return this.bTeammembersService.queryById(id);
    }

}