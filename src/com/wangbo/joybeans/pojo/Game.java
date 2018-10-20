package com.wangbo.joybeans.pojo;

import java.io.Serializable;
import java.util.Date;

public class Game implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String game_name;
	private Integer gametype_id;
	private String gamepic_address;
	private String game_state;
	private Double game_bean_price;
	private Double game_call_price;
	private Date createtime;
	private Date updatetime;
	private String game_intro;
	private GameType gameType;
	public GameType getGameType() {
		return gameType;
	}
	public void setGameType(GameType gameType) {
		this.gameType = gameType;
	}
	public Integer getId() {
		return id;
	}
	@Override
	public String toString() {
		return "Game [id=" + id + ", game_name=" + game_name + ", gametype_id=" + gametype_id + ", gamepic_address="
				+ gamepic_address + ", game_state=" + game_state + ", game_bean_price=" + game_bean_price
				+ ", game_call_price=" + game_call_price + ", createtime=" + createtime + ", updatetime=" + updatetime
				+ ", game_intro=" + game_intro + "]";
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
	public Integer getGametype_id() {
		return gametype_id;
	}
	public void setGametype_id(Integer gametype_id) {
		this.gametype_id = gametype_id;
	}
	public String getGamepic_address() {
		return gamepic_address;
	}
	public void setGamepic_address(String gamepic_address) {
		this.gamepic_address = gamepic_address;
	}
	public String getGame_state() {
		return game_state;
	}
	public void setGame_state(String game_state) {
		this.game_state = game_state;
	}
	public Double getGame_bean_price() {
		return game_bean_price;
	}
	public void setGame_bean_price(Double game_bean_price) {
		this.game_bean_price = game_bean_price;
	}
	public Double getGame_call_price() {
		return game_call_price;
	}
	public void setGame_call_price(Double game_call_price) {
		this.game_call_price = game_call_price;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public String getGame_intro() {
		return game_intro;
	}
	public void setGame_intro(String game_intro) {
		this.game_intro = game_intro;
	}
}
