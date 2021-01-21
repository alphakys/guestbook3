<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
	
	<head>
	
		<meta charset="UTF-8">
		
		<title>Update</title>
	
	</head>
	
	
	<body>
			
			<h3>수정을 하기 위해서 비밀번호를 입력해주세요</h3><br>
			<p>비밀번호가 틀릴시 현재 화면으로 되돌아옵니다</p>
			
		
			<form action="/guestbook3/guest/update" method="get">
			
			<input type = "hidden" name = "no" value="${param.no}">
			
			<table border='1'>
		
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${guestVo.name }"></td>
					<td>비밀번호</td>
					<td><input type="text" name="pw"></td>
				</tr>
				
				<tr>
					<td colspan='4'><textarea name="content" cols='60' rows='15'>${guestVo.content }</textarea></td>		
				</tr>
			
				<tr>
					<td><button type="submit">수정하기</button></td>
				</tr>
		
			</table>
			
		</form>
		
		
		<br><br>
		
		<a href = "/guestbook3/guest/list">리스트로 돌아가기</a>
		
		
	</body>
	
	
</html>