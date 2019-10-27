package com.logistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.TransportmodeMapper;
import com.logistics.po.Transportmode;
import com.logistics.service.ITransportModeService;

@Transactional
@Service("transportModeService")
public class TransportModeServiceImpl implements ITransportModeService {
	@Autowired
	TransportmodeMapper transportmodeMapper;

	@Override
	public List<Transportmode> findAll() {

		return transportmodeMapper.findAll();
	}

}
