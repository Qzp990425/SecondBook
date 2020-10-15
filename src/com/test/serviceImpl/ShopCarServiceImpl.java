package com.test.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.BookMapper;
import com.test.dao.ShopCarMapper;
import com.test.dao.UserMapper;
import com.test.entity.Book;
import com.test.entity.ShopCar;
import com.test.entity.User;
import com.test.service.ShopCarService;


@Service
public class ShopCarServiceImpl implements ShopCarService {
	
	@Autowired
	ShopCarMapper shopCarMapper;
	@Autowired
	BookMapper bookMapper;
	@Autowired
	UserMapper userMapper;
	
	@Override
	public boolean addBook(ShopCar shopCar,User user) {
		List<ShopCar> shopCars = shopCarMapper.getShopCar(user);
		for(int i = 0 ; i < shopCars.size(); i++) {
			if(shopCars.get(i).getBid().equals(shopCar.getBid())) {
				return false;
			}			
		} 
		shopCar.setUid(user.getUid());
		shopCar.setNumber(1);
		Integer result = shopCarMapper.addBook(shopCar);	
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}


	@Override
	public List<ShopCar> getShopCar(User user) {
		List<ShopCar> shopCars = shopCarMapper.getShopCar(user);
		for(int i = 0 ; i < shopCars.size() ; i++) {
			ShopCar shopCar = shopCars.get(i);		
			Book book = bookMapper.getBookByBid(shopCar.getBid());
			book.setSoldUser(userMapper.getUserByUid(book.getUid()));
			shopCar.setBook(book);
			shopCars.remove(i);
			shopCars.add(i, shopCar);
		}
		return shopCars;
	}


	@Override
	public boolean deleteShopCarBySid(Integer sid) {
		Integer result = shopCarMapper.deleteShopCarBySid(sid);
		if(result == 1) {
			return true;
		} else {
			return false;
		}		
	}


	@Override
	public void updateNum(ShopCar shopCar) {
		shopCarMapper.updateNum(shopCar);		
	}


	@Override
	public void deleteShopCar(Integer[] sid) {
		// TODO Auto-generated method stub
		shopCarMapper.deleteShopCar(sid);
	}

}
