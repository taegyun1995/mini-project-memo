package com.project.memo.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.memo.post.bo.PostBO;
import com.project.memo.post.model.Post;

@Controller
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	// 메모 리스트 페이지
	@GetMapping("/post/list/view")
	public String postList(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		// 로그인한 사용자의 userId
		int userId = (Integer)session.getAttribute("userId");
		
		List<Post> postList = postBO.getPostList(userId);
		model.addAttribute("memoList", postList);
		
		return "post/list";
	}
	
	// 메모 입력 페이지
	@GetMapping("/post/create/view")
	public String postCreate() {
		
		return "post/create";
	}
	
}
