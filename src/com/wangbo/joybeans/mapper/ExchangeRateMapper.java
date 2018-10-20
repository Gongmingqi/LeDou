package com.wangbo.joybeans.mapper;

import java.util.List;
import java.util.Map;

import com.wangbo.joybeans.pojo.ExchangeRate;

public interface ExchangeRateMapper {
	List<ExchangeRate> queryAll();
	
	List<ExchangeRate> queryConditionRate(Map<String, Integer> params);
	
	void updateExchangeRate(Map<String, Object> params);
	
	ExchangeRate queryExchangeRateById(Integer id);
	
	void addExchangeRate(ExchangeRate exchange);
	
	void deleteRate(Integer[] ids);

}
