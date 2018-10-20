package com.wangbo.joybeans.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangbo.joybeans.mapper.GameMapper;
import com.wangbo.joybeans.mapper.GameTypeMapper;
import com.wangbo.joybeans.pojo.BuyingRecord;
import com.wangbo.joybeans.pojo.Game;
import com.wangbo.joybeans.pojo.User;
import com.wangbo.joybeans.service.BuyingRecordService;
import com.wangbo.joybeans.service.ExchangeRateService;
import com.wangbo.joybeans.service.GameService;
import com.wangbo.joybeans.service.UserService;

@Controller
@RequestMapping("/buyingRecord")
public class BuyingRecordController {
	@Autowired
	private BuyingRecordService buyingRecordService;
	@Autowired
	private UserService userService;
	@Autowired
	private GameMapper gameMapper;
	@Autowired
	private GameService gameService;
	@Autowired
	private GameTypeMapper gameTypeMapper;
	@Autowired
	private ExchangeRateService exchangeRateService;
	
	@RequestMapping("/queryAllExpenseByUserId.action")
	public String queryAllExpenseByUserId(Model model,Integer userId){
		List<BuyingRecord> list = buyingRecordService.queryAll(userId);
		model.addAttribute("buyingRecordList", list);
		return "/user/expense.jsp";
	}
	
	@RequestMapping("/queryUserDetailInfo.action")
	public String queryUserDetailInfo(Model model,Integer userId){
		User user = userService.queryUserById(userId);
		model.addAttribute("userDetail", user);
		return "/user/userDetail.jsp";
	}
	
	@RequestMapping("/exitUser.action")
	public String exitUser(HttpSession session){
		session.setAttribute("loginUser", null);
		return "redirect:/login.jsp";
	}
	
	@RequestMapping("/GameByTypeId.action")
	public String gameByTypeId(HttpSession session,Integer typeId){
		List<Game> list = gameMapper.queryGameByGameTypeId(typeId);
		session.setAttribute("gameList2", list);
		return "redirect:/user/portal.jsp";
	}
	
	@RequestMapping("/queryGameDetailByGameId.action")
	public String queryGameDetailByGameId(Model model,Integer gameId){
		Game game = gameService.queryGameById(gameId);
		game.setGameType(gameTypeMapper.queryGameTypeById(game.getGametype_id()));
		model.addAttribute("game", game);
		return "/user/gameDetail.jsp";
	}
	
	@RequestMapping("/userDownGame.action")
	public String userDownGame(Integer userId,String gameName,String expOprations,Double costPrice,Model model) throws UnsupportedEncodingException{
		String gameName1 = new String(gameName.getBytes("iso-8859-1"),"utf-8");
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("userId", userId);
		params.put("gameName", gameName1);
		BuyingRecord record = buyingRecordService.userDownGameQuery(params);
		if(record!=null){
			buyingRecordService.downloadWithoutMoney(params);
			model.addAttribute("msg", "下载成功无需付款");
			return "/user/buyComplete.jsp";
		}else{
			User user = userService.queryUserById(userId);
			Double callBalance = user.getCall_balance();
			Double beanBalance = user.getBean_balance();
			if (expOprations.equals("1")) {
				if (callBalance<costPrice) {
					model.addAttribute("msg", "话费余额不足下载失败");
					return "/user/error.jsp";
				} else {
					int costRate = Integer.parseInt(exchangeRateService.queryExchangeRateById(user.getProvince_id()).getCost_rate());
					Map<String, Object> params1 = new HashMap<String,Object>();
					params1.put("callBalance", callBalance-costPrice);
					params1.put("beanBalance", beanBalance+costPrice*costRate);
					params1.put("userId", userId);
					userService.consumeMoney(params1);
					Map<String, Object> params2 = new HashMap<String,Object>();
					params2.put("gameName", gameName1);
					params2.put("costPrice", costPrice);
					params2.put("buyingWay", expOprations);
					params2.put("presentBeanNum",costPrice*costRate );
					params2.put("userId", userId);
					buyingRecordService.addBuyingRecord(params2);
					model.addAttribute("msg","下载成功，消费"+costPrice+"元");
					return "/user/buyComplete.jsp";
				}
			} else {
				if(beanBalance<costPrice){
					model.addAttribute("msg","乐豆余额不足下载失败");
					return "/user/error.jsp";
				}else{
					Map<String, Object> params3 = new HashMap<String,Object>();
					params3.put("callBalance", callBalance);
					params3.put("beanBalance", beanBalance-costPrice);
					params3.put("userId", userId);
					userService.consumeMoney(params3);
					Map<String, Object> params4 = new HashMap<String,Object>();
					params4.put("gameName", gameName1);
					params4.put("costPrice", costPrice);
					params4.put("buyingWay", expOprations);
					params4.put("presentBeanNum",0 );
					params4.put("userId", userId);
					buyingRecordService.addBuyingRecord(params4);
					model.addAttribute("msg", "下载成功，消费"+costPrice+"乐豆");
					return "/user/buyComplete.jsp";
				}

			}
		}
	}
	
	
	

}
