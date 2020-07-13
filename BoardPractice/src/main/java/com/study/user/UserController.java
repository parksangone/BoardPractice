package com.study.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.user.dao.UserDao;
import com.study.user.dto.UserDto;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 사용자 로그인 화면
	@RequestMapping("/login")
	public String loginView(Model model) {
				
		return "user/login";
	}
	
	// 사용자 회원가입 화면
	@RequestMapping("/join")
	public String joinView(Model model) {
					
		return "user/join";
	}
	
	// 아이디 중복체크
	@RequestMapping("/idCheck")
	public @ResponseBody Map<String, Object> idCheck(Model model, UserDto userDto) {

		UserDao userDao = sqlSession.getMapper(UserDao.class);
			
		String message = "";
		String sResult = "";
			
		int result = userDao.idCheck(userDto);
		
		if(result == 0) {
			message = "사용할 수 있는 아이디 입니다.";
			sResult = "success";
		} else {
			message = "사용할 수 없는 아이디 입니다.";
			sResult = "fail";
		}
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("message", message);
		map.put("result", sResult);
		
		return map;	
	}
		
	// 회원가입
	@RequestMapping("/joinDo")
	public @ResponseBody Map<String, Object> joinDo(Model model, UserDto userDto) {

		UserDao userDao = sqlSession.getMapper(UserDao.class);
		
		String message = "";
		
		int result = userDao.insertUser(userDto);
		
		if(result == 1) {
			message = "성공";
		} else {
			message = "실패";
		}
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("result", message);
			
		return map;	
	}
	
	// 로그인
	@RequestMapping("/loginDo")
	public @ResponseBody Map<String, Object> loginDo(Model model, UserDto userDto, HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		UserDao userDao = sqlSession.getMapper(UserDao.class);
			
		String message = "";
		String result = "";
			
		userDto = userDao.loginUser(userDto);
			
		if(userDto != null) {
			message = "성공";
			result = "success";
			
			// 로그인 성공시 회원 정보를(id, name, 로그인상태) 세션에 저장
			session.setAttribute("id", userDto.getId());
			session.setAttribute("name", userDto.getName());
			session.setAttribute("loginStatus", "YES");
		} else {
			message = "실패";
			result = "fail";
		}
			
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("message", message);
		map.put("result", result);
			
		return map;	
	}
	
	// 로그아웃
	@RequestMapping("/logOutDo")
	public void logOutDo(Model model, UserDto userDto, HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.invalidate();
		
	}
}