<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Page</title>
<script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/user/signup.css">
</head>
<body>
    <div class="a">
        <a href="/home.html">
            <img src="/img/rental.png" alt="">
        </a>
    </div>
    <form action="/user/modify" method="post">
		<input type="text" id="cid" name="cid" placeholder="아이디" readonly="readonly" value="${ses.cid }"><br>
		        <p id="cidError" style="color: red; display: none;">아이디를 입력해주세요.</p>
        <input type="text" id="cname" name="cname" placeholder="이름" value="${ses.cname }"><br>
        		<p id="cnameError" style="color: red; display: none;">이름을 입력해주세요.</p>
        <input type="password" id="cpw" name="cpw" placeholder="비밀번호" value="${ses.cpw }"><br>
                <p id="cpwError" style="color: red; display: none;">비밀번호를 입력해주세요.</p>
        <input type="text" id="cage" name="cage" placeholder="나이" value="${ses.cage }"><br>
				<p id="cageError" style="color: red; display: none;">나이를 입력해주세요.</p>
        <div class="gender-selection">
            <label>
                <i id="maleIcon" class="fa-solid fa-mars fa-2xl gender-icon"></i>
                <input type="radio" name="cgender" value="man" id="manRadio" style="display: none;">
                <span id="maleText" class="gender-text">남자</span>
            </label>
            <label>
                <i id="femaleIcon" class="fa-solid fa-venus fa-2xl gender-icon"></i>
                <input type="radio" name="cgender" value="woman" id="womanRadio" style="display: none;">
                <span id="femaleText" class="gender-text">여자</span>
            </label>
         	    <p id="cgenderError" style="color: red; display: none;">성별 입력해주세요.</p>
        </div><br>
        <input type="text" id="cnick_name" name="cnick_name" placeholder="닉네임" value="${ses.cnick_name }"><br>
        		<p id="cnick_nameError" style="color: red; display: none;">닉네임을 입력해주세요.</p>
        <input type="email" id="cemail" name="cemail" placeholder="RENTAL@okRental.com" value="${ses.cemail }"><br>
       		 	<p id="cemailError" style="color: red; display: none;">이메일을 입력해주세요.</p>
        <input type="text" id="ctel" name="ctel" placeholder="010-1234-5678" value="${ses.ctel }"><br>
        		<p id="ctelError" style="color: red; display: none;">전화번호를 입력해주세요.</p>
        <input type="text" id="cadd" name="cadd" placeholder="주소 입력" value="${ses.cadd }"><br>
        		<p id="caddError" style="color: red; display: none;">주소를 입력해주세요.</p>
        <button onclick="validateButton(event)" type="submit">회원 정보 수정</button>
	</form>

<script src="/resources/js/user/modify.js"></script>

</body>
</html>