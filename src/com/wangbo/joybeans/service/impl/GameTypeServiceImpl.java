package com.wangbo.joybeans.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wangbo.joybeans.mapper.GameMapper;
import com.wangbo.joybeans.mapper.GameTypeMapper;
import com.wangbo.joybeans.pojo.Game;
import com.wangbo.joybeans.pojo.GameType;
import com.wangbo.joybeans.service.GameTypeService;

@Service("gameTypeService")
@Transactional
public class GameTypeServiceImpl implements GameTypeService {
	@Autowired
	private GameTypeMapper gameTypeMapper;
	
	@Autowired
	private GameMapper gameMapper;

	@Override
	public List<GameType> queryAll() {
		return	gameTypeMapper.queryAll();
		
	}

	@Override
	public void addGameType(GameType gameType) {
		gameTypeMapper.addGameType(gameType);
	}

	@Override
	public GameType queryGameTypeById(Integer id) {
		return gameTypeMapper.queryGameTypeById(id);
	}

	@Override
	public boolean updateGameType(Integer id, String gametype, String type_state) {
		if (type_state.equals("1")) {
			Map<String, Object> params = new HashMap<String,Object>();
			params.put("id", id);
			params.put("gameType", gametype);
			params.put("gameTypeState", type_state);
			gameTypeMapper.updateGameType(params);
			return true;
		} else {
			//停用游戏类型需要先判断该类型游戏是否已经停用
			List<Game> gameLIst = gameMapper.queryGameByGameTypeId(id);
			for (Game game : gameLIst) {
				if(game.getGame_state().equals("1")){
					return false;
				}
			}
			
			Map<String, Object> params = new HashMap<String,Object>();
			params.put("id", id);
			params.put("gameType", gametype);
			params.put("gameTypeState", type_state);
			gameTypeMapper.updateGameType(params);
			return true;
			
			
		}
		
		
		
		
	}

	@Override
	public List<GameType> queryConditionGameType(Map<String, String> params) {
		List<GameType> list = gameTypeMapper.queryConditionGameType(params);
		return list;
	}

}
