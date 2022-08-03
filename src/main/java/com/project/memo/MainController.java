package com.project.memo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/project/helloworld")
	public String hello() {
		
		return "hello/helloworld";
	}

}
