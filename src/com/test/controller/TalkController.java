package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.entity.Talk;
import com.test.entity.User;
import com.test.serviceImpl.TalkServiceImpl;

@Controller
@RequestMapping("/talk")
@SessionAttributes(value={"user","sold"})
public class TalkController {
	
	@Autowired
	TalkServiceImpl talkService;
	
	
	@RequestMapping("/insertTalkUser")
	public String insertTalk(Model model,Talk talk) {
		System.out.println(talk);
		talkService.insertTalkUser(talk);
		List<Talk> talks = talkService.getTalkById(talk.getBuyId(), talk.getSoldId());
		model.addAttribute("talks", talks);
		return "/user/talk";
	}
	
	@RequestMapping("/insertTalkAdmin")
	public String insertTalkAdmin(Model model,Talk talk) {
		talkService.insertTalkAdmin(talk);
		List<Talk> talks = talkService.getTalkById(talk.getBuyId(), talk.getSoldId());
		model.addAttribute("talks", talks);
		return "/sold/talk";
	}
	
	@RequestMapping("/getBuyUser")
	public String getBuyUser(ModelMap model) {
		User user = (User) model.get("sold");
		List<User> users = talkService.getBuyUser(user.getUid());
		model.addAttribute("users", users);
		return "/sold/talk";
	}
	
	@RequestMapping("/getTalkAdmin")
	public String getTalkAdmin(Model model,Talk talk){
		List<Talk> talks = talkService.getTalkById(talk.getBuyId(), talk.getSoldId());
		model.addAttribute("talks", talks);
		return "/sold/talk";
	}
	
	@RequestMapping("/getTalkUser")
	public String getTalkUser(Model model,Talk talk){
		List<Talk> talks = talkService.getTalkById(talk.getBuyId(), talk.getSoldId());
		model.addAttribute("talks", talks);
		return "/user/talk";
	}
}
