package com.project.memo.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.memo.common.FileManagerService;
import com.project.memo.post.dao.PostDAO;
import com.project.memo.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	// userId, 제목, 내용, 사진 저장 기능
	public int addPost(int userId, String title, String content, MultipartFile file) {
		
		// 파일을 저장한다.
		// 해당 파일을 외부에서 접근할 수 있는 경로를 만들어서 dao로 전달한다.
		String imagePath = FileManagerService.saveFile(userId, file);
		
		
		return postDAO.insertPost(userId, title, content, imagePath);
	}
	
	// userId가 일치하는 메모 리스트 조회
	public List<Post> getPostList(int userId) {
		return postDAO.selectPostList(userId);
	}
	
	// id 일치하는 메모 조회
	public Post getPost(int id) {
		return postDAO.selectPost(id);
	}
	
	public int updatePost(int postId, String title, String content) {
		
		return postDAO.updatePost(postId, title, content);
	}
	
	public int deletePost(int postId) {
		Post post = postDAO.selectPost(postId);
		String imagePath = post.getImagePath();
		FileManagerService.removeFile(imagePath);
		
		return postDAO.deletePost(postId);
	}
}
