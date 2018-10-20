package com.wangbo.joybeans.pojo;

import java.io.Serializable;
import java.util.Date;

public class ExchangeRate implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String province;
	private String cost_rate;
	private Date createtime;
	private Date updatetime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCost_rate() {
		return cost_rate;
	}
	public void setCost_rate(String cost_rate) {
		this.cost_rate = cost_rate;
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
}
