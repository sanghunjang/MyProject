package com.company.biz.user;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
	
	@Select("SELECT * FROM SPRINGUSERS WHERE ID=#{id} AND PASSWORD=#{password}")
	public User getUser(User user);
}
