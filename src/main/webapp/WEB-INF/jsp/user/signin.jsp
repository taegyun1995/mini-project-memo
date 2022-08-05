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
		
		<form id="loginForm">
		
			<section class="d-flex justify-content-center pt-5">
			
				<div class="col-4 py-5">
				
					<h1 class="d-flex justify-content-center"> 로그인 </h1>
					
					<input type="text" class="form-control mt-5" id="idInput" placeholder="아이디"/>
					<input type="password" class="form-control mt-4" id="pwInput" placeholder="****"/>
					
					<button type="submit" id="loginBtn" class="btn btn-secondary form-control mt-4"> 로그인 </button>
					
					<div class="text-center mt-4">
						<a href="/user/signup/view" target="_blank"> 회원가입 </a>
					</div>
				
				</div>
				
			</section>
			
		</form>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#loginForm").on("submit", function(e) {
				
				// 해당하는 이벤트에 포함된 모든 기능을 중단한다!!!
				e.preventDefault();
				
				let loginId = $("#idInput").val();
				let password = $("#pwInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요.");
					return;
				}
			
				if(password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				// 로그인 api를 호출해서 로그인 결과를 확인한다.
				$.ajax({
					type:"post",
					url:"/user/signin",
					data:{"loginId":loginId, "password":password},
					
					success:function(data){
						if(data.result == "success") {
							location.href="/post/list/view";
						} else {
							alert("아이디 / 비밀번호를 확인해주세요.");
						}
					},
					error:function(){
						alert("로그인 에러 발생!!");
					}
				});
					
				
			});
			
		});
	
	
	
	</script>
	
</body>
</html>