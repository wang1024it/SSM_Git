package com.logistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.MrchandisetypeMapper;
import com.logistics.po.Mrchandisetype;
import com.logistics.service.IMrchandisetypeService;

@Transactional
@Service("mrchandisetypeService")
public class MrchandisetypeServiceImpl implements IMrchandisetypeService {
	@Autowired
	MrchandisetypeMapper mrchandisetypeMapper;

	@Override
	public List<Mrchandisetype> findAll() {

		return mrchandisetypeMapper.findAll();
	}

}
