package com.logistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logistics.dao.PaymentMapper;
import com.logistics.po.Payment;
import com.logistics.service.IPaymentService;

@Transactional
@Service("paymentService")
public class PaymentServiceImpl implements IPaymentService {
	@Autowired
	PaymentMapper paymentMapper;

	@Override
	public List<Payment> findAll() {

		return paymentMapper.findAll();
	}

}
