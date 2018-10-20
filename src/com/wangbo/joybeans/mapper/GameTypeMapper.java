package com.wangbo.joybeans.mapper;

import java.util.List;
import java.util.Map;

import com.wangbo.joybeans.pojo.GameType;

public interface GameTypeMapper {
	List<GameType> queryAll();
	
	void addGameType(GameType gameType);
	
	GameType queryGameTypeById(Integer id);
	
	void updateGameType(Map<String, Object> params);
	
	List<GameType> queryConditionGameType(Map<String, String> params);
	

}
