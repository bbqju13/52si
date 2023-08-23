<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상담신청 리스트</title>
<!-- 부트스트랩 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- 폰트어썸 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <!-- AOS CSS -->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="/resources/css/consult/adminList.css">
</head>
<body>
	<div class="content">
        <h1>상담신청 목록 페이지</h1>
        <table class="table table-striped" data-aos="fade-up">
            <thead class="thead-dark">
                <tr>
                    <th>상담신청번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>핸드폰번호</th>
                    <th>상담내용</th>
                    <th>상품이름</th>
                    <th>등록일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${adminList }" var="csvo">
                    <tr>
                        <td>${csvo.csno }</td>
                        <td>${csvo.csid }</td>
                        <td>${csvo.csname }</td>
                        <td>${csvo.cstel }</td>
                        <td>${csvo.cscontent }</td>
                        <td>${csvo.cstype }</td>
                        <td>${csvo.csdate }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- AOS 자바스크립트 -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript">
    	AOS.init();  // AOS 초기화
    </script>
    <!-- 행 하이라이트를 위한 제이쿼리 -->
    <script type="text/javascript">
	    $(document).ready(function() {
	        $("tbody tr").hover(
	            function() {
	                $(this).addClass('highlight');  // 마우스 오버시 highlight 클래스 추가
	            },
	            function() {
	                $(this).removeClass('highlight');  // 마우스 아웃시 highlight 클래스 제거
	            }
	        );
	    });
    </script>
</body>
</html>