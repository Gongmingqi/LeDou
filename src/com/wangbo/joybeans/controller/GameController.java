package com.wangbo.joybeans.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangbo.joybeans.pojo.Game;
import com.wangbo.joybeans.service.GameService;

@Controller
@RequestMapping("/game")
public class GameController {
	@Autowired
	private GameService gameService;
	
	@RequestMapping("/queryAllGameBySize.action")
	public String queryAll(Model model){
		List<Game> list = gameService.queryAll();
		model.addAttribute("gameList",list);
		return "/game/game.jsp";
	}
	
	@RequestMapping("/addGame.action")
	public void addGame(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter write = response.getWriter();
		DiskFileItemFactory dff = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(dff);
		Game game = new Game();
		try {
			@SuppressWarnings("unchecked")
			List<FileItem> list = sfu.parseRequest(request);
			for (FileItem fi : list) {
				if(fi.isFormField()) {
					//普通表单元素在这里处理
					String fieldName = fi.getFieldName();
					if(fieldName.equals("gameName")) {
						game.setGame_name(fi.getString("utf-8"));
					}else if(fieldName.equals("gameStatus")){
						game.setGame_state(fi.getString("utf-8"));
					}else if(fieldName.equals("gameType")){
						game.setGametype_id(Integer.parseInt(fi.getString("utf-8")));
					}else if(fieldName.equals("gameDetail")){
						game.setGame_intro(fi.getString("utf-8"));
					}else if(fieldName.equals("gameTariffe")){
						game.setGame_call_price(Double.parseDouble(fi.getString("utf-8")));
					}else if(fieldName.equals("gameCurrency")){
						game.setGame_bean_price(Double.parseDouble(fi.getString("utf-8")));
					}
				}else{
					//文件上传处理的部分
					String path = request.getServletContext().getRealPath("upload");
					String fileName = fi.getName();
					File file = new File(path+File.separator+fileName);
					fi.write(file);
					game.setGamepic_address(fileName);
				}
			}
			if (game.getGamepic_address() == null) {
				game.setGamepic_address("1464842544378.jpg");
			}
			gameService.addGame(game);
			write.write("0");
		} catch (FileUploadException e) {
			e.printStackTrace();
			write.write("1");
		} catch (Exception e) {
			e.printStackTrace();
			write.write("1");
		}
	}
	
	@RequestMapping("/queryConditionGame.action")
	public String queryConditionGame(HttpSession session,String searchGameName,Integer searchGameType){
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("searchGameName", searchGameName);
		params.put("searchGameType", searchGameType);
		List<Game> list = gameService.queryConditionGame(params);
		session.setAttribute("gameList", list);
		return "redirect:/game/game.jsp";
	}
	
	@RequestMapping("/queryGameById.action")
	public String queryGameById(Model model,Integer id,String function){
		if("details".equals(function)){
		Game game = gameService.queryGameById(id);
		model.addAttribute("game",game);
		return "/game/gameDetails.jsp";
		}else{
			Game game = gameService.queryGameById(id);
			model.addAttribute("game",game);
			return "/game/updateGame.jsp";
		}
	}
	
	@RequestMapping("/updateGame.action")
	public void updateGame(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String imgaddress = null;
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter write = response.getWriter();
		DiskFileItemFactory dff = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(dff);
		Game game = new Game();
		try {
			@SuppressWarnings("unchecked")
			List<FileItem> list = sfu.parseRequest(request);
			for (FileItem fi : list) {
				if(fi.isFormField()) {
					//普通表单元素在这里处理
					String fieldName = fi.getFieldName();
					if(fieldName.equals("gameName")) {
						game.setGame_name(fi.getString("utf-8"));
					}else if(fieldName.equals("gameStatus")){
						game.setGame_state(fi.getString("utf-8"));
					}else if(fieldName.equals("gameType")){
						game.setGametype_id(Integer.parseInt(fi.getString("utf-8")));
					}else if(fieldName.equals("gameDetail")){
						game.setGame_intro(fi.getString("utf-8"));
					}else if(fieldName.equals("gameTariffe")){
						game.setGame_call_price(Double.parseDouble(fi.getString("utf-8")));
					}else if(fieldName.equals("gameCurrency")){
						game.setGame_bean_price(Double.parseDouble(fi.getString("utf-8")));
					}else if(fieldName.equals("gameId")){
						game.setId(Integer.parseInt(fi.getString("utf-8")));
					}else if(fieldName.equals("imgaddress")){
						imgaddress = fi.getString("utf-8");
					}
				}else{
					//文件上传处理的部分
					String path = request.getServletContext().getRealPath("upload");
					String fileName = fi.getName();
					File file = new File(path+File.separator+fileName);
					fi.write(file);
					game.setGamepic_address(fileName);
				}
			}
			if (game.getGamepic_address() == null) {
				game.setGamepic_address(imgaddress);
			}
			gameService.updateGame(game);
			write.write("0");
		} catch (FileUploadException e) {
			e.printStackTrace();
			write.write("1");
		} catch (Exception e) {
			e.printStackTrace();
			write.write("1");
		}
	}
	

}
