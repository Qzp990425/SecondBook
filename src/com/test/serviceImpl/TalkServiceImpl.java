package com.test.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.TalkMapper;
import com.test.dao.UserMapper;
import com.test.entity.Talk;
import com.test.entity.User;
import com.test.service.TalkService;
import com.test.utils.Util;

@Service
public class TalkServiceImpl implements TalkService {
	
	@Autowired
	TalkMapper talkMapper;
	@Autowired
	UserMapper userMapper;
	
	@Override
	public List<Talk> getTalkById(Integer buyId, Integer soldId) {
		// TODO Auto-generated method stub
		List<Talk> talks = talkMapper.getTalkById(buyId, soldId);
		return talks;
	}

	@Override
	public void insertTalkUser(Talk talk) {
		// TODO Auto-generated method stub
		talk.setCreateTime(Util.formatDate(new Date()));
		talk.setStatus(0);
		talkMapper.insertTalk(talk);
	}

	@Override
	public void insertTalkAdmin(Talk talk) {
		// TODO Auto-generated method stub
		talk.setCreateTime(Util.formatDate(new Date()));
		talk.setStatus(1);
		talkMapper.insertTalk(talk);
	}
	
	@Override
	public List<User> getSoldUser(Integer buyId) {
		// TODO Auto-generated method stub
		List<User> list = talkMapper.getSoldUser(buyId);
		for(int i = 0 ; i < list.size() ; i++) {
			User user = list.get(i);
			System.out.println(user);
			user = userMapper.getUserByUid(user.getUid());
			list.remove(i);
			list.add(i, user);
		}
		return list;
	}

	@Override
	public List<User> getBuyUser(Integer soldId) {
		// TODO Auto-generated method stub
		List<User> list = talkMapper.getBuyUser(soldId);
		for(int i = 0 ; i < list.size() ; i++) {
			User user = list.get(i);
			System.out.println(user);
			user = userMapper.getUserByUid(user.getUid());
			list.remove(i);
			list.add(i, user);
		}
		return list;
	}

}
