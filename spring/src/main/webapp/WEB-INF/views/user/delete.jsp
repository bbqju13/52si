<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/delete" method="post">
	ID : <input type="text" name="cid">
	PW : <input type="password" name="cpw">
	<button type="submit" id="deleteBtn">삭제</button>
	</form>
	
	<script type="text/javascript">
	    const deleteFail = '<c:out value="${deleteFail}"/>';
	    console.log(deleteFail); 
		
	    if(deleteFail == 1){
	        alert("아이디 혹은 비밀번호를 확인해주세요")   
	    }
	    
	</script>
</body>
</html>