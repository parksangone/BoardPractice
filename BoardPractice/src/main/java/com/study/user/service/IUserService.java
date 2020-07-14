package com.study.user.service;

import com.study.user.dto.UserDto;

public interface IUserService {
	public int idCheck(UserDto userDto);
	public int insertUser(UserDto userDto);
	public UserDto loginUser(UserDto userDto);
}
