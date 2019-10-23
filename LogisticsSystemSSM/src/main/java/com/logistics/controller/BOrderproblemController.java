package com.logistics.controller;

import com.logistics.entity.BOrderproblem;
import com.logistics.service.BOrderproblemService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (BOrderproblem)表控制层
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
@RestController
@RequestMapping("bOrderproblem")
public class BOrderproblemController {
    /**
     * 服务对象
     */
    @Resource
    private BOrderproblemService bOrderproblemService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public BOrderproblem selectOne(Integer id) {
        return this.bOrderproblemService.queryById(id);
    }

}