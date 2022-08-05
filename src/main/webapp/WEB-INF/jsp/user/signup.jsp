<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap" >
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center pt-5">
		
			<div id="login">
			
			<h1 class="d-flex justify-content-center"> 회원가입 </h1>
			
			<input type="text" class="form-control mt-5" id="idInput" placeholder="아이디"/>
			<input type="password" class="form-control mt-4" id="pwInput" placeholder="****"/>
			<input type="password" class="form-control mt-4" placeholder="비밀번호 확인"/>
			<input type="text" class="form-control mt-4" id="nameInput" placeholder="이름"/>
			<input type="text" class="form-control mt-4" id="emailInput" placeholder="이메일 주소"/>
			
			<button type="button" id="joinBtn" class="btn btn-secondary form-control mt-4"> 가입 </button>
			
			</div>
			
		</section>
		
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#joinBtn").on("click", function(){
				let id = $("#idInput").val();
				let pw = $("#pwInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				if(id == "") {
					alert("아이디를 입력해주세요.");
					return;
				}
				
				if(pw == "") {
					alert("비밀번호를 입력해주세요.");
					return;
				}
				
				if(name == "") {
					alert("이름을 입력해주세요.");
					return;
				}
				
				if(email == "") {
					alert("이메일을 입력해주세요.");
					return;
				}
				
				// 입력된 데이터를 회원가입 api로 가입을 진행한다.
				$.ajax({
					type:"post",
					url:"/user/signup",
					data:{"loginId":id, "password":pw, "name":name, "email":email},
					
					success:function(data) {
						if(data.result == "success") {
							location.href="/user/signin/view";
						} else {
							alert("회원가입 실패");
						}
					},
					
					error:function() {
						alert("회원가입 에러");
					}
				});
				
			});
			
		});
	
	</script>
	
</body>
</html>