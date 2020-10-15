package com.test.entity;


//商品实体
public class Book {
	private Integer bid;
	//商品编号
	private String uuid;
	//商品名
	private String name;
	//价格
	private Integer price;
	//现价
	private Integer nowPrice;
	//商家id
	private Integer uid;
	//简介
	private String introduction;
	//类型(0-数学  1-英语  2-政治  3-专业书)
	private Integer type;
	//剩余数量
	private Integer number;
	//商品状态(0-正在售卖  1-下架)
	private Integer status;

	private User soldUser;
	private Type bookType;

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getPrice() {
		return price;
	}
	
	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}


	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}
	

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getNowPrice() {
		return nowPrice;
	}

	public void setNowPrice(Integer nowPrice) {
		this.nowPrice = nowPrice;
	}

	@Override
	public String toString() {
		return "Book [bid=" + bid + ", uuid=" + uuid + ", name=" + name + ", price=" + price + ", type=" + type
				+ ", status=" + status + "]";
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public User getSoldUser() {
		return soldUser;
	}

	public void setSoldUser(User soldUser) {
		this.soldUser = soldUser;
	}

	public Type getBookType() {
		return bookType;
	}

	public void setBookType(Type bookType) {
		this.bookType = bookType;
	}
	
	
}
