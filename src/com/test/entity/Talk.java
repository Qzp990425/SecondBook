package com.test.entity;

public class Talk {
	private Integer tid;
	//购买者id
	private Integer buyId;
	//卖家id
	private Integer soldId;
	//0代表购买者send   1代表卖家send
	private Integer status;
	private String content;
	private String createTime;
	
	private User soldUser;
	private User buyUser;
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public Integer getBuyId() {
		return buyId;
	}
	public void setBuyId(Integer buyId) {
		this.buyId = buyId;
	}
	public Integer getSoldId() {
		return soldId;
	}
	public void setSoldId(Integer soldId) {
		this.soldId = soldId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public User getSoldUser() {
		return soldUser;
	}
	public void setSoldUser(User soldUser) {
		this.soldUser = soldUser;
	}
	public User getBuyUser() {
		return buyUser;
	}
	public void setBuyUser(User buyUser) {
		this.buyUser = buyUser;
	}
	@Override
	public String toString() {
		return "Talk [tid=" + tid + ", buyId=" + buyId + ", soldId=" + soldId + ", status=" + status + ", content="
				+ content + ", createTime=" + createTime + ", soldUser=" + soldUser + ", buyUser=" + buyUser + "]";
	}
	
	
}
