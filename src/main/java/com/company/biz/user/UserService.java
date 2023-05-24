package com.company.biz.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserMapper{
	
	@Autowired
	UserDAO userDAO;
	
	@Override
	public User getUser(User user) {
		return userDAO.getUser(user);
	}

}
