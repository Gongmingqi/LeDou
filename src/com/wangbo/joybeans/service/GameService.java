package com.wangbo.joybeans.service;

import java.util.List;
import java.util.Map;

import com.wangbo.joybeans.pojo.Game;

public interface GameService {
	List<Game> queryAll();
	
	void addGame(Game game);
	
	List<Game> queryConditionGame(Map<String, Object> params);
	
	Game queryGameById(Integer id);
	
	void updateGame(Game game);
}
