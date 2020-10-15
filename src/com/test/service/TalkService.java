package com.test.service;

import java.util.List;

import com.test.entity.Talk;
import com.test.entity.User;

public interface TalkService {
	public List<Talk> getTalkById(Integer buyId,Integer soldId);
	
	public void insertTalkUser(Talk talk);
	
	public void insertTalkAdmin(Talk talk);
	
	public List<User> getSoldUser(Integer buyId);
	
	public List<User> getBuyUser(Integer soldId);
}
