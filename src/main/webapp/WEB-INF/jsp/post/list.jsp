<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 리스트</title>
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
		
			<div class="col-8 my-4">
				<h2 class="text-center"> 메모 리스트 </h2>
				
				<table class="table text-center">
				
					<thead>
						<tr>
							<th> No. </th>
							<th> 제목 </th>
							<th> 시간 </th>
						</tr>
					</thead>
					
					<tbody class="py-1">
					<c:forEach var="memo" items="${memoList}" varStatus="status">
						<tr>	
							<td> ${status.count } </td>
							<td> <a href="/post/detail/view?id=${memo.id}"> ${memo.subject} </a> </td>
							<td> <fmt:formatDate value="${memo.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
						</tr>
					</c:forEach>
					</tbody>
				
				</table>
				
				<div class="text-right">
					<a href="/post/create/view" class="btn btn-info"> 글쓰기 </a>			
				</div>
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>


</body>
</html>