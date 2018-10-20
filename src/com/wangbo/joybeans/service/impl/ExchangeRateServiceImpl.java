package com.wangbo.joybeans.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangbo.joybeans.mapper.ExchangeRateMapper;
import com.wangbo.joybeans.pojo.ExchangeRate;
import com.wangbo.joybeans.service.ExchangeRateService;

@Service("exchangeRateService")
@Transactional
public class ExchangeRateServiceImpl implements ExchangeRateService {

	@Autowired
	private ExchangeRateMapper exchangeRateMapper;
	
	@Override
	public List<ExchangeRate> queryAll() {
		return exchangeRateMapper.queryAll();
	}

	@Override
	public List<ExchangeRate> queryConditionRate(Map<String, Integer> params) {
		return exchangeRateMapper.queryConditionRate(params);
	}

	@Override
	public ExchangeRate queryExchangeRateById(Integer id) {
		return exchangeRateMapper.queryExchangeRateById(id);
	}

	@Override
	public void updateExchangeRate(Map<String, Object> params) {
		exchangeRateMapper.updateExchangeRate(params);
		
	}

	@Override
	public void addExchangeRate(ExchangeRate exchange) {
		exchangeRateMapper.addExchangeRate(exchange);
		
	}

	@Override
	public void deleteRate(Integer[] ids) {
		exchangeRateMapper.deleteRate(ids);
		
	}

}
