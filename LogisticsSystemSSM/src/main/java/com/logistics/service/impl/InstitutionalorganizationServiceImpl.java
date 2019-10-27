package com.logistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.InstitutionalorganizationMapper;
import com.logistics.po.Institutionalorganization;
import com.logistics.service.IInstitutionalorganizationService;

@Transactional
@Service("institutionalorganizationService")
public class InstitutionalorganizationServiceImpl implements
		IInstitutionalorganizationService {
	@Autowired
	InstitutionalorganizationMapper institutionalorganizationMapper;

	@Override
	public int deleteByPrimaryKey(Integer institutionalorganizationid) {

		return institutionalorganizationMapper
				.deleteByPrimaryKey(institutionalorganizationid);
	}

	@Override
	public int insert(Institutionalorganization record) {

		return institutionalorganizationMapper.insert(record);
	}

	@Override
	public int insertSelective(Institutionalorganization record) {

		return institutionalorganizationMapper.insertSelective(record);
	}

	@Override
	public Institutionalorganization selectByPrimaryKey(
			Integer institutionalorganizationid) {

		return institutionalorganizationMapper
				.selectByPrimaryKey(institutionalorganizationid);
	}

	@Override
	public int updateByPrimaryKeySelective(Institutionalorganization record) {

		return institutionalorganizationMapper
				.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Institutionalorganization record) {

		return institutionalorganizationMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Institutionalorganization> findAll() {

		return institutionalorganizationMapper.findAll();
	}

}
