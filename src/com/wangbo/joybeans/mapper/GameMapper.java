package com.wangbo.joybeans.mapper;

import java.util.List;
import java.util.Map;

import com.wangbo.joybeans.pojo.Game;

public interface GameMapper {

	 List<Game> queryGameByGameTypeId(Integer gameTypeId);
	 
	 List<Game> queryAll();
	 
	 void addGame(Game game);
	 
	 List<Game> queryConditionGame(Map<String, Object> params);
	 
	 Game queryGameById(Integer id);
	 
	 void updateGame(Game game);
}
