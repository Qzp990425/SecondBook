package com.test.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.test.dao.BookMapper;
import com.test.dao.TypeMapper;
import com.test.dao.UserMapper;
import com.test.entity.Book;
import com.test.service.BookService;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	BookMapper bookMapper;
	@Autowired
	UserMapper userMapper;
	@Autowired
	TypeMapper typeMapper;
	
	
	@Override
	public PageInfo<Book> getAllBook(Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getAllBook();
		for(int i = 0 ; i < books.size() ; i ++) {
			Book book = books.get(i);
			book.setSoldUser(userMapper.getUserByUid(book.getUid()));
			books.remove(i);
			books.add(i, book);
		}
		return new PageInfo<>(books);
	}

	@Override
	public PageInfo<Book> getAllBookByType(Integer type, Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getBookByType(type);
		for(int i = 0 ; i < books.size() ; i ++) {
			Book book = books.get(i);
			book.setSoldUser(userMapper.getUserByUid(book.getUid()));
			books.remove(i);
			books.add(i, book);
		}
		return new PageInfo<>(books);
	}

	@Override
	public PageInfo<Book> getBookOnSale(Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getBookOnSale();
		for(int i = 0 ; i < books.size() ; i ++) {
			Book book = books.get(i);
			book.setSoldUser(userMapper.getUserByUid(book.getUid()));
			books.remove(i);
			books.add(i, book);
		}
		return new PageInfo<>(books);
	}

	@Override
	public PageInfo<Book> getBookOnSaleByType(Integer type, Integer pageNum) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getBookOnSaleByType(type);
		for(int i = 0 ; i < books.size() ; i ++) {
			Book book = books.get(i);
			book.setSoldUser(userMapper.getUserByUid(book.getUid()));
			books.remove(i);
			books.add(i, book);
		}
		return new PageInfo<>(books);
	}

	@Override
	public Book getBookByBid(Integer bid) {
		Book book = bookMapper.getBookByBid(bid);
		book.setSoldUser(userMapper.getUserByUid(book.getUid()));
		book.setBookType(typeMapper.getTypeByTid(book.getType()));
		return book;
	}

	@Override
	public boolean putBook(Integer bid) {
		Integer result = bookMapper.putBook(bid);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean pushBook(Integer bid) {
		Integer result = bookMapper.pushBook(bid);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean addBook(Book book) {
		// TODO Auto-generated method stub
		Integer result = bookMapper.insertBook(book);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public PageInfo<Book> getBookByName(Integer pageNum, String name) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getBookByName(name);
		for(int i = 0 ; i < books.size() ; i ++) {
			Book book = books.get(i);
			book.setSoldUser(userMapper.getUserByUid(book.getUid()));
			books.remove(i);
			books.add(i, book);
		}
		return new PageInfo<>(books);
	}

	@Override
	public void updateNum(Integer[] bid, Integer[] num) {
		// TODO Auto-generated method stub
		for(int i = 0 ; i < bid.length ; i++) {
			Book book = bookMapper.getBookByBid(bid[i]);
			book.setNumber(book.getNumber()-num[i]);
			bookMapper.updateNum(book);
		}
	}
	
	@Override
	public void updateNum(Integer bid, Integer num) {
		// TODO Auto-generated method stub
		Book book = bookMapper.getBookByBid(bid);
		book.setNumber(book.getNumber()-num);
		bookMapper.updateNum(book);
	}

	@Override
	public PageInfo<Book> getAllBookOfMe(Integer pageNum,Integer uid) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getAllBookOfMe(uid);
		return new PageInfo<>(books);
	}

	@Override
	public PageInfo<Book> getAllBookByTypeOfMe(Integer type, Integer pageNum,Integer uid) {
		PageHelper.startPage(pageNum, 4);
		List<Book> books = bookMapper.getBookByTypeOfMe(type,uid);
		return new PageInfo<>(books);
	}

}
