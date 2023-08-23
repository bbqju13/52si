<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- 폰트어썸 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <!-- AOS CSS -->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="/resources/css/product/adminList.css">
</head>
    <style>
        body{
            background-color: #fbfbfd;
        }
     .search-form {
    text-align: center;
    margin-top: 50px;
}

.search-form select,
.search-form input[type="text"] {
    padding: 10px;
    margin: 5px 0;
    font-size: 16px;
    border: none;
    float: left;

}

.input-wrapper {
    display: flex;
    border-radius: 15px;
    overflow: hidden;
}

.search-form input[type="text"] {
    border: none;
    flex-grow: 1;
    outline: none;
}

.search-form button {
    background: none;
    border: none;
    padding: 10px;
    color: #999;
    transition: color 0.3s;
}
.search-form button:hover {
    color: #333;
}
.input-wrapper{
    margin-bottom: 15px;
}
.select-box{
    width: 20%;
    outline: none;
    cursor: pointer;
}
    </style>
<body>
    <div class="content">
        <h1>관리자(수정/삭제) 목록 페이지</h1>

        <form action="/product/adminList" method="get" class="search-form">
            <c:set value="${ph.pgvo.type}" var="typed"/>
            <select name="type" class="select-box">
                <option value="p" ${typed eq 'p' ? 'selected' : ''}>제품명</option>
                <option value="c" ${typed eq 'c' ? 'selected' : ''}>제품내용</option>
                <option value="pc" ${typed eq 'pc' ? 'selected' : ''}>제품명 + 제품내용</option>
            </select>
            <div class="input-wrapper">
                <input type="text" name="keyword" value="${ph.pgvo.keyword}" placeholder="Enter search content">
                <button type="submit"><i class="fa fa-search"></i></button>
            </div>
            <input type="hidden" name="pageNo" value="1">
            <input type="hidden" name="qty" value="${ph.pgvo.qty}">
        </form>
        <table class="table table-striped" data-aos="fade-up">
            <thead class="thead-dark">
                <tr>
                    <th>상품번호</th>
                    <th>타입A</th>
                    <th>제품명</th>
                    <th>가격</th>
                    <th>제품내용</th>        
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${adminList }" var="pvo">
                    <tr onClick="location.href='/product/modify?pno=${pvo.pno}'" style="cursor:pointer;">
                        <td>${pvo.pno }</td>
                        <td>${pvo.type_a }</td>
                        <td>${pvo.pname }</td>
                        <td>${pvo.price }</td>
                        <td>${pvo.content }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- paging Line -->
   <div id="paging" style="text-align: center">
   <c:if test="${ph.prev }">
      <a href="/product/adminList?PageNo=${ph.startPage - 1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> ◀ </a>
   </c:if>
   
   <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
     <a href="/product/adminList?pageNo=${i}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i} | </a>
   </c:forEach>
   
   <c:if test="${ph.next }">
     <a href="/product/adminList?PageNo=${ph.endPage + 1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> ▶ </a>
   </c:if>
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
