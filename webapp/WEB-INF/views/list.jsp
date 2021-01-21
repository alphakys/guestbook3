<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		
		<title>List</title>
	
	</head>
	
	<body>
	
	<h1>방명록</h1>
	<br>
	
		<form action="/guestbook3/guest/insert" method="get">
			
			<table border='1'>
		
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
					<td>비밀번호</td>
					<td><input type="text" name="pw"></td>
				</tr>
				
				<tr>
					<td colspan='4'><textarea name="content" cols='60' rows='15'></textarea></td>		
				</tr>
			
				<tr>
					<td><button type="submit">확인</button></td>
				</tr>
		
			</table>
			
		</form>
		
		<br><br>
		<c:forEach items="${gList}" var="gVo">
			
			<table border='1'>
		
					<tr>	
						<td>${gVo.no}</td>
						<td>${gVo.name }</td>
						<td>${gVo.date }</td>
						<td>
							<a href="/guestbook3/guest/deleteForm?no=${gVo.no }">삭제</a>
							<a href="/guestbook3/guest/updateForm?no=${gVo.no }">수정</a>
						</td>
					</tr>
					
					<tr>
						<td colspan='4'>${gVo.content }</td>		
					</tr>
				
					
			
				</table>
		
		</c:forEach>
		
		
		
	</body>
	
</html>