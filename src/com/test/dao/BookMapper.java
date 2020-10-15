package com.test.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.test.entity.Book;





@Repository
public interface BookMapper {

	public List<Book> getAllBook();
	
	public List<Book> getBookByType(Integer type);
	
	public List<Book> getBookOnSale();

	public List<Book> getBookOnSaleByType(Integer type);
	
	public Integer insertBook(Book book);
	
	public Integer putBook(Integer id);
	
	public Integer pushBook(Integer id);
	
	public Book getBookByBid(Integer id);
	
	public List<Book> getBookByName(String name);
	
	public void updateNum(Book book);
	
	public List<Book> getAllBookOfMe(Integer uid);
	
	public List<Book> getBookByTypeOfMe(@Param("type")Integer type,@Param("uid")Integer uid);
}
