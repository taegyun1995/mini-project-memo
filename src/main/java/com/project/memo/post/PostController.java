package com.project.memo.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PostController {
	
	// post 리스트 페이지
	@GetMapping("/post/list/view")
	public String postList() {
		
		return "post/list";
	}

}
