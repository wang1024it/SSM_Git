package com.logistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.ProcuratoryMapper;
import com.logistics.po.Procuratory;
import com.logistics.service.IProcuratoryService;
import com.logistics.vo.ProcuratoryVo;

@Transactional
@Service("procuratoryService")
public class ProcuratoryServiceImpl implements IProcuratoryService {

	@Autowired
	ProcuratoryMapper procuratoryMapper;

	@Override
	public int deleteByPrimaryKey(Integer procuratoryid) {

		return procuratoryMapper.deleteByPrimaryKey(procuratoryid);
	}

	@Override
	public int insert(Procuratory record) {

		return procuratoryMapper.insert(record);
	}

	@Override
	public int insertSelective(Procuratory record) {

		return procuratoryMapper.insertSelective(record);
	}

	@Override
	public Procuratory selectByPrimaryKey(Integer procuratoryid) {

		return procuratoryMapper.selectByPrimaryKey(procuratoryid);
	}

	@Override
	public int updateByPrimaryKeySelective(Procuratory record) {

		return procuratoryMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Procuratory record) {

		return procuratoryMapper.updateByPrimaryKey(record);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<ProcuratoryVo> findPage(Map map) {

		return procuratoryMapper.findPage(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int getTotalRow(Map map) {

		return procuratoryMapper.getTotalRow(map);
	}

	@Override
	public int deleteByOrderformID(Integer OrderformID) {

		return procuratoryMapper.deleteByOrderformID(OrderformID);
	}

	@Override
	public ProcuratoryVo findByOrderformID(Integer OrderformID) {

		return procuratoryMapper.findByOrderformID(OrderformID);
	}

}
