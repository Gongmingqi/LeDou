package com.wangbo.joybeans.pojo;

import java.io.Serializable;
import java.util.Date;

public class BuyingRecord implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String game_name;
	private Integer cost_price;
	private String buying_way;
	private Integer present_bean_num;
	private Date buyingtime;
	private Integer user_id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGame_name() {
		return game_name;
	}
	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}
	public Integer getCost_price() {
		return cost_price;
	}
	public void setCost_price(Integer cost_price) {
		this.cost_price = cost_price;
	}
	public String getBuying_way() {
		return buying_way;
	}
	public void setBuying_way(String buying_way) {
		this.buying_way = buying_way;
	}
	public Integer getPresent_bean_num() {
		return present_bean_num;
	}
	public void setPresent_bean_num(Integer present_bean_num) {
		this.present_bean_num = present_bean_num;
	}
	public Date getBuyingtime() {
		return buyingtime;
	}
	public void setBuyingtime(Date buyingtime) {
		this.buyingtime = buyingtime;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	
}
