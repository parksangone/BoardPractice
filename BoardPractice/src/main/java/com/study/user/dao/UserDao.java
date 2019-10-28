package com.study.user.dao;

import com.study.user.dto.UserDto;

public interface UserDao {
	public int idCheck(UserDto userDto);
	public int insertUser(UserDto userDto);
	public UserDto loginUser(UserDto userDto);
}
