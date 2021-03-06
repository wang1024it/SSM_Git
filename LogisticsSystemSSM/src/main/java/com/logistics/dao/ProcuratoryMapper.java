package com.logistics.dao;

import java.util.List;
import java.util.Map;

import com.logistics.po.Procuratory;
import com.logistics.vo.ProcuratoryVo;

public interface ProcuratoryMapper {
	int deleteByPrimaryKey(Integer procuratoryid);

	int insert(Procuratory record);

	int insertSelective(Procuratory record);

	Procuratory selectByPrimaryKey(Integer procuratoryid);

	int updateByPrimaryKeySelective(Procuratory record);

	int updateByPrimaryKey(Procuratory record);

	@SuppressWarnings("rawtypes")
	public List<ProcuratoryVo> findPage(Map map);

	@SuppressWarnings("rawtypes")
	public int getTotalRow(Map map);

	public int deleteByOrderformID(int OrderformID);

	public ProcuratoryVo findByOrderformID(Integer OrderformID);

}