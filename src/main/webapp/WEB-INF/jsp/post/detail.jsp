<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 입력</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
		
			<div class="col-7 my-5">
				<h1 class="text-center"> 메모 입력 </h1>
				
				<div class="d-flex justify-content-between mt-2">
					<label> 제목 : </label>
					<input type="text" class="form-control col-11" id="titleInput" value="${memo.subject }"/>
				</div>
				
				<textarea rows="10" class="form-control mt-2" id="contentInput"> ${memo.content} </textarea>
				
				<div class="py-2">
					<img class="w-100" src="${memo.imagePath }" />
				</div>
				
				<div class="d-flex justify-content-between mt-2">
					<div>
						<a href="/post/list/view" class="btn btn-info"> 목록으로 </a>
						<button type="button" class="btn btn-danger" id="deleteBtn" data-post-id="${memo.id }"> 삭제 </button>
					</div>
					<button type="button" class="btn btn-info" id="updateBtn" data-post-id="${memo.id }"> 수정 </button>
				</div>
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#updateBtn").on("click", function() {
				let title = $("#titleInput").val();
				let content = $("#contentInput").val().trim();
				let postId = $(this).data("post-id");
				
				if(title == "") {
					alert("제목을 입력해주세요.");
					return;
				}
				
				if(content == "") {
					alert("내용을 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/update",
					data:{"postId":postId, "title":title, "content":content},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("메모 작성 실패");
						}
					},
					error:function() {
						alert("에러 발생!!");
					}
					
				});
				
			});
			
			$("#deleteBtn").on("click", function(){
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/list/view";
						} else {
							alert("삭제 실패");
						}
					},
					error:function() {
						alert("삭제 에러 발생");
					}
				});
				
			});
			
		});
	
	</script>
	
</body>
</html>