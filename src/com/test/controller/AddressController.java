package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.entity.Address;
import com.test.entity.User;
import com.test.serviceImpl.AddressServiceImpl;

@Controller
@RequestMapping("/address")
@SessionAttributes("user")
public class AddressController {
	
	@Autowired
	AddressServiceImpl addressService;
	
	@RequestMapping("/addAddress")
	public String addAddress(Address address,ModelMap model) {
		User user = (User) model.get("user");
		address.setUid(user.getUid());
		boolean flag = addressService.insertAddress(address);
		if(flag) {
			model.addAttribute("msg", "添加成功");
		} else {
			model.addAttribute("msg", "添加失败");
		}
		return "forward:/orderRecord/getOrderByUid";
	}
	
	@RequestMapping("/deleteAddress")
	public String deleteAddress(Integer aid,Model model) {
		boolean flag = addressService.deleteAddress(aid);
		if(flag) {
			model.addAttribute("msg", "删除成功");
		} else {
			model.addAttribute("msg", "删除失败");
		}
		return "forward:/orderRecord/getOrderByUid";
	}
	
	@RequestMapping("/updateAddress")
	public String updateAddress(Address address,Model model) {
		boolean flag = addressService.updateAddress(address);
		if(flag) {
			model.addAttribute("msg", "更新成功");
		} else {
			model.addAttribute("msg", "更新失败");
		}
		return "forward:/orderRecord/getOrderByUid";
	}
	
}
