package com.wangbo.joybeans.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangbo.joybeans.mapper.BuyingRecordMapper;
import com.wangbo.joybeans.pojo.BuyingRecord;
import com.wangbo.joybeans.service.BuyingRecordService;

@Service("buyingRecordService")
@Transactional
public class BuyingRecordServiceImpl implements BuyingRecordService {
	
	@Autowired
	private BuyingRecordMapper buyingRecordMapper;

	@Override
	public List<BuyingRecord> queryAll(Integer userId) {
		return buyingRecordMapper.queryAll(userId);
	}

	@Override
	public BuyingRecord userDownGameQuery(Map<String, Object> params) {
		return buyingRecordMapper.userDownGameQuery(params);
	}

	@Override
	public void downloadWithoutMoney(Map<String, Object> params) {
		buyingRecordMapper.downloadWithoutMoney(params);
	}

	@Override
	public void addBuyingRecord(Map<String, Object> params) {
		buyingRecordMapper.addBuyingRecord(params);
	}

}
