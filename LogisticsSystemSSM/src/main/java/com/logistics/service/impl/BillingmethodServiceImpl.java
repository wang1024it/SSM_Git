package com.logistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.BillingmethodMapper;
import com.logistics.po.Billingmethod;
import com.logistics.service.IBillingmethodService;

@Transactional
@Service("billingmethodService")
public class BillingmethodServiceImpl implements IBillingmethodService {
	@Autowired
	BillingmethodMapper billingmethodMapper;

	@Override
	public List<Billingmethod> findAll() {

		return billingmethodMapper.findAll();
	}

}
