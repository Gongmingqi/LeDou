package com.wangbo.joybeans.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wangbo.joybeans.exception.MyException;
import com.wangbo.joybeans.pojo.ExchangeRate;
import com.wangbo.joybeans.service.ExchangeRateService;

@Controller
@RequestMapping("/exchange")
public class ExchangeRateController {
	@Autowired
	private ExchangeRateService exchangeRateService;
	
	@RequestMapping("/queryAllExchangeBySize.action")
	public String queryAll(Model model,HttpSession session){
		List<ExchangeRate> list = exchangeRateService.queryAll();
		model.addAttribute("exchangeList", list);
		session.setAttribute("exchangeListFix", list);
		return "/exchange/exchange.jsp";
	}
	
	@RequestMapping("/queryConditionExchange.action")
	public String queryConditionRate(Model model,Integer searchExchangeProvId){
		Map<String, Integer> params = new HashMap<String,Integer>();
		params.put("searchExchangeProvId", searchExchangeProvId);
		List<ExchangeRate> list = exchangeRateService.queryConditionRate(params);
		model.addAttribute("exchangeList", list);
		return "/exchange/exchange.jsp";
		
	}
	
	@RequestMapping("/queryExchangeById.action")
	public String queryExchangeById(Model model,Integer id){
		ExchangeRate e = exchangeRateService.queryExchangeRateById(id);
		model.addAttribute("exchange", e);
		return "/exchange/updateExchange.jsp";
	}
	
	@RequestMapping("/updateExchange.action")
	public String updateExchange(Integer exchangeProvId,String exchangeCharge){
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("cost_rate", exchangeCharge);
		params.put("id", exchangeProvId);
		exchangeRateService.updateExchangeRate(params);
		return "/exchange/queryAllExchangeBySize.action";
	}
	
	@RequestMapping("/addExchange.action")
	public void addExchange(String exchangeProvId,String exchangeCharge,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter write = response.getWriter();
		List<ExchangeRate> list = exchangeRateService.queryAll();
		try {
			for (ExchangeRate exchangeRate : list) {
				if(exchangeRate.getProvince().equals(exchangeProvId)){
					throw new MyException("已有该省份数据！");
				}
			}
			ExchangeRate e = new ExchangeRate();
			e.setProvince(exchangeProvId);
			e.setCost_rate(exchangeCharge);
			exchangeRateService.addExchangeRate(e);
			write.write("0");
		} catch (Exception e) {
			write.write("1");
		}
	}
	
	@RequestMapping("/delExchange.action")
	public void delExchange(Integer[] ids,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter write = response.getWriter();
		try {
			exchangeRateService.deleteRate(ids);
			write.write("0");
		} catch (Exception e) {
			write.write("1");
		}
	}
	

}
