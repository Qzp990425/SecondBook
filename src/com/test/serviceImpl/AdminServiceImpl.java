package com.test.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.AdminMapper;
import com.test.entity.Admin;
import com.test.service.AdminService;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminMapper adminMapper;
	
	
	public boolean login(Admin admin) {
		Admin checkAdmin = adminMapper.getAdminByUsername(admin);
		if(checkAdmin == null) {
			return false;
		} else {
			if(checkAdmin.getPassword().equals(admin.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
	
}
