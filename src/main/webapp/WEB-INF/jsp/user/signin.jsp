<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center pt-5">
		
			<div id="login">
			
			<h1 class="d-flex justify-content-center"> 로그인 </h1>
			
			<input type="text" class="form-control mt-5" id="idInput" name="loginId" placeholder="아이디"/>
			<input type="password" class="form-control mt-4" id="pwInput" name="password" placeholder="****"/>
			
			<button type="button" id="loginBtn" class="btn btn-secondary form-control mt-4"> 로그인 </button>
			<div class="text-center mt-4">
			<a href="/user/signup/view" target="_blank"> 회원가입 </a>
			</div>
			
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#loginBtn").on("click", function(){
				
				let id = $("#idInput").val();
				let pw = $("#pwInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요.");
					return;
				}
			
				if(pw == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/signin",
					data:{"loginId":id, "password":pw},
					
					success:function(data){
						if(data.result == "success") {
							alert("로그인 성공");
							
						} else {
							alert("로그인 실패 ㅠㅠ");
						}
					},
					error:function(){
						alert("에러 발생!!");
					}
				});
					
				
			});
			
		});
	
	
	
	</script>
	
</body>
</html>