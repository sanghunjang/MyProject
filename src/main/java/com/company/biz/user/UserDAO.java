package com.company.biz.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public User getUser(User user) {
		return mybatis.selectOne("getUser",user);
	}
}
