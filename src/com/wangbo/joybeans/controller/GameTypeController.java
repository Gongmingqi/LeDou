package com.wangbo.joybeans.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangbo.joybeans.pojo.GameType;
import com.wangbo.joybeans.service.GameTypeService;

@Controller
@RequestMapping("/gametype")
public class GameTypeController {
	@Autowired
	private GameTypeService gameTypeService;
	
	@RequestMapping("/queryGameTypeAllBySize.action")
	public String queryAll(HttpSession session) throws ParseException
	{
		List<GameType> list  = gameTypeService.queryAll();
		session.setAttribute("gameTypeList", list);
		return "redirect:/game_type/gametype.jsp";
	}
	
	@RequestMapping("/addGameType.action")
	public void addGameType(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter write = response.getWriter();
		String typeName = request.getParameter("typeName");
		String typeStatus = request.getParameter("typeStatus");
		GameType gameType = new GameType();
		gameType.setGametype(typeName);
		gameType.setType_state(typeStatus);
		try {
			gameTypeService.addGameType(gameType);
			write.write("0");
			
		} catch (Exception e) {
			// TODO: handle exception
			write.write("1");
		}
	}
	
	@RequestMapping("/updateGameType.action")
	public String queryGameTypeById(Integer id,Model model){
		GameType gameType = gameTypeService.queryGameTypeById(id);
		model.addAttribute("gameType",gameType);
		return "/game_type/updateGameType.jsp";
	}
	
	@RequestMapping("/updateGameTypeData.action")
	public void updateGameTypeData(Integer id,String typeName,String typeStatus,HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter write = response.getWriter();
		try {
			boolean result = gameTypeService.updateGameType(id, typeName, typeStatus);
			if (result==true) {
				write.write("0");
			} else {
				write.write("1");
			}
		} catch (Exception e) {
				write.write("2");
		}
		
		
	}
	
	@RequestMapping("/queryConditionGameType.action")
	public String queryConditionGameType(HttpSession session,String searchTypeName,String searchTypeStatus){
		Map<String, String> params = new HashMap<String,String>();
		params.put("searchGameTypeName", searchTypeName);
		params.put("searchGameTypeState", searchTypeStatus);
		List<GameType> list = gameTypeService.queryConditionGameType(params);
		session.setAttribute("gameTypeList", list);
		return "redirect:/game_type/gametype.jsp";
	}
	
}
