package com.wangbo.joybeans.service;

import java.util.List;
import java.util.Map;

import com.wangbo.joybeans.pojo.GameType;

public interface GameTypeService {
	List<GameType> queryAll();
	
	void addGameType(GameType gameType);
	
	GameType queryGameTypeById(Integer id);
	
	boolean updateGameType(Integer id,String gametype,String type_state);
	
	List<GameType> queryConditionGameType(Map<String, String> params);
}
