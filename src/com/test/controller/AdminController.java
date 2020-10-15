package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.entity.Admin;
import com.test.entity.Type;
import com.test.serviceImpl.AdminServiceImpl;
import com.test.serviceImpl.TypeServiceImpl;


@Controller
@RequestMapping("/admin")
@SessionAttributes(value={"admin","types"})
public class AdminController {
	
	@Autowired
	AdminServiceImpl adminService;
	@Autowired
	TypeServiceImpl typeService;
	
	
	
	@RequestMapping("/login")
	public String login(Model model,Admin admin) {
		boolean flag = adminService.login(admin);
		if(flag) {
			model.addAttribute("admin",admin);
			List<Type> types = typeService.getTypeList();
			model.addAttribute("types", types);
			return "/admin/index";
		} else {
			model.addAttribute("msg","账号或者密码错误");
			return "/admin/login";
		}
	}
	
	
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.removeAttribute("admin");
		return "/admin/login";
	}
}
