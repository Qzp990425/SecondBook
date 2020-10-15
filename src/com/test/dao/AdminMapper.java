package com.test.dao;


import org.springframework.stereotype.Repository;

import com.test.entity.Admin;




@Repository
public interface AdminMapper {
	
	public Admin getAdminByUsername(Admin admin);
	
}
