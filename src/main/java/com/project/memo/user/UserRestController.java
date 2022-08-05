package com.project.memo.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.memo.user.bo.UserBO;

@RestController // @Controller + @ResponseBody
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 회원가입 api
	@PostMapping("/user/signup")
	public Map<String, String> signup(@RequestParam("loginId") String loginId
										, @RequestParam("password") String password
										, @RequestParam("name") String name
										, @RequestParam("email") String email) {
		
		int count = userBO.adduser(loginId, password, name, email);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 로그인 api
	@PostMapping("/user/signin")
	public Map<String, String> signin(@RequestParam("loginId") String loginId
										, @RequestParam("password") String password) {
		
		int count = userBO.loginuser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
