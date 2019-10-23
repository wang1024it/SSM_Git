package com.logistics.service;

import com.logistics.entity.BUsertypedetail;
import java.util.List;

/**
 * (BUsertypedetail)表服务接口
 *
 * @author makejava
 * @since 2019-10-23 14:32:59
 */
public interface BUsertypedetailService {

    /**
     * 通过ID查询单条数据
     *
     * @param usertypedetailid 主键
     * @return 实例对象
     */
    BUsertypedetail queryById(Integer usertypedetailid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<BUsertypedetail> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param bUsertypedetail 实例对象
     * @return 实例对象
     */
    BUsertypedetail insert(BUsertypedetail bUsertypedetail);

    /**
     * 修改数据
     *
     * @param bUsertypedetail 实例对象
     * @return 实例对象
     */
    BUsertypedetail update(BUsertypedetail bUsertypedetail);

    /**
     * 通过主键删除数据
     *
     * @param usertypedetailid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer usertypedetailid);

}