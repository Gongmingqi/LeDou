package com.wangbo.joybeans.service;

import java.util.List;
import java.util.Map;

import com.wangbo.joybeans.pojo.ExchangeRate;

public interface ExchangeRateService {

	List<ExchangeRate> queryAll();
	
	List<ExchangeRate> queryConditionRate(Map<String, Integer> params);
	
	ExchangeRate queryExchangeRateById(Integer id);
	
	void updateExchangeRate(Map<String, Object> params);
	
	void addExchangeRate(ExchangeRate exchange);
	
	void deleteRate(Integer[] ids);
}
