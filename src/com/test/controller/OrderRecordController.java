package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageInfo;
import com.test.entity.Address;
import com.test.entity.OrderRecord;
import com.test.entity.User;
import com.test.serviceImpl.AddressServiceImpl;
import com.test.serviceImpl.BookServiceImpl;
import com.test.serviceImpl.OrderServiceImpl;
import com.test.serviceImpl.ShopCarServiceImpl;
import com.test.serviceImpl.TalkServiceImpl;
import com.test.serviceImpl.UserServiceImpl;

@Controller
@RequestMapping("/orderRecord")
@SessionAttributes(value={"user","sold"})
public class OrderRecordController {

	@Autowired
	OrderServiceImpl orderService;
	@Autowired
	ShopCarServiceImpl shopCarService;
	@Autowired
	BookServiceImpl bookService;
	@Autowired
	AddressServiceImpl addressService;
	@Autowired
	UserServiceImpl userService;
	@Autowired
	TalkServiceImpl talkService;
	
	
	@RequestMapping("/insertOrder")
	public String insertOrder(ModelMap model,Integer[] bid,Integer[] number,Integer[] sid,String name,Integer[] price,Integer[] soldId) {
		Integer allPrice = 0;
		for(Integer priceOne : price) {
			allPrice += priceOne;
		}
		User user = (User)model.get("user");
		if(user.getAccount() >= allPrice) {
			user.setAccount(user.getAccount()-allPrice);
			userService.updateAccount(user);
			orderService.insertOrder(user, bid, number,name,soldId);
			for(int i = 0 ; i < price.length ; i++) {
				userService.updateAccount(price[i], soldId[i]);
			}
			model.addAttribute("msg","支付成功");
			shopCarService.deleteShopCar(sid);
			bookService.updateNum(bid,number);
		} else {
			model.addAttribute("msg", "您的余额不足,无法购买");
		}
		return "forward:/shopCar/getShopCar";	
	}
	
	@RequestMapping("/insertOrderOne")
	public String insertOrderOne(ModelMap model,Integer bid,Integer number,String name,Integer price,Integer soldId) {
		User user = (User)model.get("user");
		if(user.getAccount() >= price) {
			user.setAccount(user.getAccount()-price);
			userService.updateAccount(user);
			orderService.insertOrderOne(user, bid, number,name,soldId);
			userService.updateAccount(price, soldId);
			model.addAttribute("msg","支付成功");
			bookService.updateNum(bid, number);
		} else {
			model.addAttribute("msg", "您的余额不足,无法购买");
		}
		return "forward:/book/readyBuy?bid="+bid;	
	}
	
	
	
	@RequestMapping("/getOrderByUid")
	public String getOrderByUid(ModelMap model,@RequestParam(defaultValue="1")Integer pageNum) {
		User user = (User)model.get("user");
		PageInfo<OrderRecord> pageInfo = orderService.getOrderByUid(user, pageNum);
		List<Address> addresses = addressService.getAllAddress(user.getUid());
		List<User> solds = talkService.getSoldUser(user.getUid());
		model.addAttribute("solds", solds);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("addresses", addresses);
		return "/user/myMsg";
	}
	
	@RequestMapping("/sendOrder")
	public String sendOrder(Model model,Integer oid) {
		boolean flag = orderService.sendOrder(oid);		
		if(flag) {
			model.addAttribute("msg","发货成功");
		} else {
			model.addAttribute("msg","发货失败");
		}
		return "forward:/orderRecord/getAllOrder";
	}
	
	@RequestMapping("/doneOrder")
	public String doneOrder(Model model,Integer oid) {
		boolean flag = orderService.doneOrder(oid);
		if(flag) {
			model.addAttribute("msg","收货成功");
		} else {
			model.addAttribute("msg","收货失败");
		}
		return "forward:/orderRecord/getOrderByUid";
	}
	
	@RequestMapping("/getAllOrder")
	public String getAllOrder(ModelMap model,@RequestParam(defaultValue="1")Integer pageNum){
		User user = (User) model.get("sold");
		PageInfo<OrderRecord> pageInfo = orderService.getAllOrder(pageNum,user);
		model.addAttribute("pageInfo", pageInfo);
		return "/sold/orderRecord";
	}
	
	@RequestMapping("/getOrderByType")
	public String getOrderByType(Model model,@RequestParam(defaultValue="1")Integer pageNum,Integer status){
		PageInfo<OrderRecord> pageInfo = orderService.getOrderByType(pageNum,status);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("status", status);
		return "/sold/order";
	}
}
