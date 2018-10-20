package com.wangbo.joybeans.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangbo.joybeans.mapper.GameMapper;
import com.wangbo.joybeans.mapper.GameTypeMapper;
import com.wangbo.joybeans.pojo.Game;
import com.wangbo.joybeans.service.GameService;

@Service("gameService")
@Transactional
public class GameServiceImpl implements GameService {

	@Autowired
	private GameMapper gameMapper;
	
	@Autowired
	private GameTypeMapper gameTypeMapper;
	
	@Override
	public List<Game> queryAll() {
		List<Game> list = gameMapper.queryAll();
		for (Game game : list) {
			game.setGameType(gameTypeMapper.queryGameTypeById(game.getGametype_id()));
		}
		return list;
	}

	@Override
	public void addGame(Game game) {
		gameMapper.addGame(game);
		
	}

	@Override
	public List<Game> queryConditionGame(Map<String, Object> params) {
		List<Game> list = gameMapper.queryConditionGame(params);
		for (Game game : list) {
			game.setGameType(gameTypeMapper.queryGameTypeById(game.getGametype_id()));
		}
		return list;
	}

	@Override
	public Game queryGameById(Integer id) {
		Game game = gameMapper.queryGameById(id);
		game.setGameType(gameTypeMapper.queryGameTypeById(game.getGametype_id()));
		return game;
	}

	@Override
	public void updateGame(Game game) {
		gameMapper.updateGame(game);
		
	}

}
