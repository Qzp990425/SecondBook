package com.test.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test.entity.Talk;
import com.test.entity.User;

@Repository
public interface TalkMapper {
	public List<Talk> getTalkById(Integer buyId,Integer soldId);
	
	public Integer insertTalk(Talk talk);
	
	public List<User> getSoldUser(Integer buyId);
	
	public List<User> getBuyUser(Integer soldId);
}
