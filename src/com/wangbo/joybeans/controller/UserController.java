package com.wangbo.joybeans.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangbo.joybeans.mapper.GameMapper;
import com.wangbo.joybeans.pojo.Game;
import com.wangbo.joybeans.pojo.GameType;
import com.wangbo.joybeans.pojo.PageBean;
import com.wangbo.joybeans.pojo.User;
import com.wangbo.joybeans.service.GameTypeService;
import com.wangbo.joybeans.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private GameTypeService gameTypeService;
	@Autowired
	private GameMapper gameMapper;
	@RequestMapping("/login.action")
	public void login(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter write = response.getWriter();
		String account = request.getParameter("account");
		//System.out.println(account);
		String pwd = request.getParameter("pwd");
		String inputyzm = request.getParameter("inputyzm");
		String yzm = (String) session.getAttribute("rand");
		//System.out.println(userService.login(account, pwd));
		User user = userService.login(account, pwd);
		List<GameType> list = gameTypeService.queryAll();
		session.setAttribute("gameTypeList2", list);
		List<Game> gameList = gameMapper.queryGameByGameTypeId(17);
		session.setAttribute("gameList2", gameList);
		if (!yzm.equalsIgnoreCase(inputyzm)) {
			write.write("0");
		}else if(user == null){
			write.write("1");
		}else if(user.getUserstate().equals("1")){
			write.write("4");
		}else if(user.getUsertype().equals("0")){
			session.setAttribute("loginUser1", user);
			write.write("2");
		}else{
			session.setAttribute("loginUser", user);
			write.write("3");
		}
	}
	
	@RequestMapping("/queryAllUserBySize.action")
	public String userManage(Model model){
		//List<User> userList = userService.queryAll();
		model.addAttribute("currentPage", "1");
		return "/user/userPagination.action";
	}
	
	@RequestMapping("/queryConditionUser.action")
	public String queryConditionUser(String searchUserAccount, String searchUserName, String searchUserPhone,Model model,HttpSession session){
		session.setAttribute("searchUserAccount",searchUserAccount);
		session.setAttribute("searchUserName", searchUserName);
		session.setAttribute("searchUserPhone", searchUserPhone);
		model.addAttribute("currentPage","1");
		return "/user/userConditionPagination.action";
	}
	
	@RequestMapping("/recoverUser.action")
	public String userRecover(int[] ids,Model model){
		userService.recoverUser(ids);
		//List<User> userList = userService.queryAll();
		model.addAttribute("currentPage", "1");
		return "/user/userPagination.action";
	}
	
	@RequestMapping("/pauseUser.action")
	public String userPause(int[] ids,Model model){
		userService.pauseUser(ids);
		//List<User> userList = userService.queryAll();
		model.addAttribute("currentPage", "1");
		return "/user/userPagination.action";
	}
	
	@RequestMapping("/userPagination.action")
	public String userPagination(HttpServletRequest request,Model model,String currentPage) throws IOException, ServletException{
				int currentPage1 = 1;
				if (request.getAttribute("currentPage")!=null) {
					 currentPage1 = Integer.parseInt((String) request.getAttribute("currentPage"));
				} else if(currentPage!=null){
					 currentPage1 = Integer.parseInt(currentPage);
				}
				//总记录数
				int allcounts = userService.queryAll().size();
				//总页数
				int allPages = (allcounts-1)/PageBean.PAGE_SIZE+1;
				int start = (currentPage1-1)*PageBean.PAGE_SIZE+1;
				int end = start+PageBean.PAGE_SIZE-1;
				Map<String, Integer> params = new HashMap<String,Integer>();
				params.put("start", start);
				params.put("end", end);
				List<User> list = userService.userPagination(params);
				PageBean<User> pb = new PageBean<User>(currentPage1,allcounts,allPages,list);
				model.addAttribute("userList", list);
				model.addAttribute("user_pb", pb);
				return "/user/user.jsp";
	}
	
	@RequestMapping("/userConditionPagination.action")
	public String userConditionPagination(HttpServletRequest request,Model model,String currentPage) throws IOException, ServletException{
				int currentPage1 = 1;
				if (request.getAttribute("currentPage")!=null) {
					 currentPage1 = Integer.parseInt((String) request.getAttribute("currentPage"));
				} else if(currentPage!=null){
					 currentPage1 = Integer.parseInt(currentPage);
				}
				String searchUserAccount = (String) request.getSession().getAttribute("searchUserAccount");
				String searchUserName = (String) request.getSession().getAttribute("searchUserName");
				String searchUserPhone = (String) request.getSession().getAttribute("searchUserPhone");
				Map<String, Object> paramsCondition = new HashMap<String,Object>();
				paramsCondition.put("searchUserAccount", searchUserAccount);
				paramsCondition.put("searchUserName", searchUserName);
				paramsCondition.put("searchUserPhone", searchUserPhone);
				
				
				
				//总记录数
				int allcounts = userService.queryConditionUser(paramsCondition).size();
				//总页数
				int allPages = (allcounts-1)/PageBean.PAGE_SIZE+1;
				int start = (currentPage1-1)*PageBean.PAGE_SIZE+1;
				int end = start+PageBean.PAGE_SIZE-1;
				Map<String, Object> paramsConditionPagination = new HashMap<String,Object>();
				paramsConditionPagination.put("searchUserAccount", searchUserAccount);
				paramsConditionPagination.put("searchUserName", searchUserName);
				paramsConditionPagination.put("searchUserPhone", searchUserPhone);
				paramsConditionPagination.put("start", start);
				paramsConditionPagination.put("end", end);
				List<User> list = userService.queryConditionUserPagination(paramsConditionPagination);
				PageBean<User> pb = new PageBean<User>(currentPage1,allcounts,allPages,list);
				model.addAttribute("userList", list);
				model.addAttribute("user_pb", pb);
				return "/user/userConditionPagination.jsp";
	}
	
	@RequestMapping("/regist.action")
	public void register(User user,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter write = response.getWriter();
		try {
			userService.regist(user);
			write.write("0");
		} catch (Exception e) {
			write.write("1");
		}
	}
}
