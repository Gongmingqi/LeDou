package com.wangbo.joybeans.mapper;

import java.util.List;
import java.util.Map;

import com.wangbo.joybeans.pojo.BuyingRecord;

public interface BuyingRecordMapper {
	List<BuyingRecord> queryAll(Integer userId);
	
	BuyingRecord userDownGameQuery(Map<String, Object> params);
	
	void downloadWithoutMoney(Map<String,Object> params);
	
	void addBuyingRecord(Map<String, Object> params);

}
