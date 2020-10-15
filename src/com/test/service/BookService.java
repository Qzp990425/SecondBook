package com.test.service;

import com.github.pagehelper.PageInfo;
import com.test.entity.Book;

public interface BookService {
	public PageInfo<Book> getAllBook(Integer pageNum);
	
	public PageInfo<Book> getAllBookByType(Integer type,Integer pageNum);
	
	public PageInfo<Book> getBookOnSale(Integer pageNum);
	
	public PageInfo<Book> getBookOnSaleByType(Integer type,Integer pageNum);
	
	public Book getBookByBid(Integer bid);
	
	public boolean putBook(Integer bid);
	
	public boolean pushBook(Integer bid);
	
	public boolean addBook(Book Book);
	
	public PageInfo<Book> getBookByName(Integer pageNum,String name);
	
	public void updateNum(Integer[] bid,Integer[] num);
	
	public void updateNum(Integer bid,Integer num);
	
	public PageInfo<Book> getAllBookOfMe(Integer pageNum,Integer uid);
	
	public PageInfo<Book> getAllBookByTypeOfMe(Integer type,Integer pageNum,Integer uid);
}
