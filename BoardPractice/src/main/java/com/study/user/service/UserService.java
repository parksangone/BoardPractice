package com.study.user.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.user.dao.UserDao;
import com.study.user.dto.UserDto;

@Service
public class UserService implements IUserService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(UserDto userDto) {
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		int result = userDao.idCheck(userDto);
		
		return result;
	}

	@Override
	public int insertUser(UserDto userDto) {
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		int result = userDao.insertUser(userDto);
		
		return result;
	}

	@Override
	public UserDto loginUser(UserDto userDto) {
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		userDto = userDao.loginUser(userDto);
		
		return userDto;
	}
	
}
