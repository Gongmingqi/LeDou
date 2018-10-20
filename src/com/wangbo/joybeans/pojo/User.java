package com.wangbo.joybeans.pojo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String account;
	private int province_id;
	private String name;
	private String phonenumber;
	private String userstate;
	private Date createtime;
	private String usertype;
	private double call_balance;
	private double bean_balance;
	@Override
	public String toString() {
		return "User [account=" + account + ", bean_balance=" + bean_balance
				+ ", call_balance=" + call_balance + ", createtime="
				+ createtime + ", id=" + id + ", name=" + name + ", password="
				+ password + ", phonenumber=" + phonenumber + ", province_id="
				+ province_id + ", userstate=" + userstate + ", usertype="
				+ usertype + "]";
	}
	private String password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getProvince_id() {
		return province_id;
	}
	public void setProvince_id(int provinceId) {
		province_id = provinceId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getUserstate() {
		return userstate;
	}
	public void setUserstate(String userstate) {
		this.userstate = userstate;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public double getCall_balance() {
		return call_balance;
	}
	public void setCall_balance(double callBalance) {
		call_balance = callBalance;
	}
	public double getBean_balance() {
		return bean_balance;
	}
	public void setBean_balance(double beanBalance) {
		bean_balance = beanBalance;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
