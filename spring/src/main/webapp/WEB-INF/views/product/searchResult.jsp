<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/e927512ef5.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>List</title>
<link rel="stylesheet" href="/resources/css/product/list.css">
<link rel="stylesheet" href="/resources/css/HF.css">
</head>
<style>
</style>
<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<div class="header">
				<a href="/home"> 
					<div class="logo-title">
						<img src="/resources/img/logo2.svg" alt="">
						<h1 class="title" style="color: #555;">OK Rental</h1>
					</div>
				</a>
				<!-- 우측에 위치 -->
				<div class="header-right">
					<div class="info">
						<i class="fa-sharp fa-solid fa-user fa-xl" style="color: #555;"
							onclick="toggleTooltip();"></i>
						<div id="tooltip" class="speech-bubble">
							<c:if test="${ses.cid == null }">
								<a href="/user/signup">회원가입</a>
								<br>
								<a href="/user/login">로그인</a>
							</c:if>
							<c:if test="${ses.cid != null }">
								<a href="/user/modify">회원정보수정</a>
								<br>
								<a href="/user/logout">로그아웃</a>
							</c:if>
						</div>
					</div>

					<!-- 230710 서치 -->
					<div class="search">
						<span id="search"> <i
							class="fa-solid fa-magnifying-glass fa-xl" style="color: #555;"></i>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div id="myOverlay" class="overlay">
			<span class="closebtn" onclick="closeSearch()" title="Close Overlay">×</span>
			<div class="overlay-content">
				<form action="/product/search" method="get">
					<div class="search-container">
						<h1 style="color: white;">Quickly Search Site</h1>
						<div class="search-box">							
							<input type="text" placeholder="Search.." name="search"
								class="search-input">
							<button class="search-box-btn" type="submit" style="color: #555;">Search</button>					
						</div>
					</div>
				</form>
				<div class="quickly">
					<ul>
						<li><i class="fa-solid fa-arrow-right fa-xs"
							style="color: #ffffff;"></i> <a href="/product/search?search=다이슨"> dyson</a></li>
						<li><i class="fa-solid fa-arrow-right fa-xs"
							style="color: #ffffff;"></i> <a href="/product/search?search=엘지"> lg </a></li>
						<li><i class="fa-solid fa-arrow-right fa-xs"
							style="color: #ffffff;"></i> <a href="/product/search?search=쿠쿠"> cuckoo </a></li>
						<li><i class="fa-solid fa-arrow-right fa-xs"
							style="color: #ffffff;"></i> <a href="/product/search?search=코웨이"> coway </a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="blurryPart" class="blurry-part"></div>
		<!-- 230710 서치 -->
	</header>
	<!-- 헤더시마이 -->
	<h1 class="h1">${searchKeyword}의 검색 결과</h1>
	<c:choose>
		<c:when test="${empty searchDtoList}">
        	<p class="emptyPara">찾으시는 제품이 없습니다.</p>
        </c:when>
        <c:otherwise>
        	<div id="dtoListDiv">
				<ul>
				<c:forEach items="${searchDtoList}" var="dto">
		            <li>
		                <a href="/product/detail?pno=${dto.pvo.pno}">
		                    <span class="img-wrapper">
		                        <span class="img-container">
		                            <c:forEach items="${dto.flist}" var="fvo">
		                                <c:if test="${fvo.fileCategoryNum == 0}">
        									<img alt="image" src="/upload/${fn:replace(fvo.save_dir, '\\','/')}/${fvo.uuid}_th_${fvo.file_name}">
    									</c:if>
		                            </c:forEach>
		                        </span>
		                    </span>
		                    <span class="badge-container">
		                        <img src="/resources/img/pc_best.png" alt="Best" class="badge">
		                        <img src="/resources/img/pc_new.png" alt="New" class="badge">
		                    </span>
		                    <span class="info-1">${dto.pvo.pname}</span>
		                    <span class="info-2">${dto.pvo.price}</span>
		                    <span class="info-3">${dto.pvo.content}</span>
		                </a>
		            </li>		
				</c:forEach>
				</ul>
			</div>
        </c:otherwise>
	</c:choose>
	<div class="nav-btn" id="nav-btn">☰</div>

	<div class="nav-bar" id="nav-bar">
		<a href="#">service</a> <a href="#">address</a> <a href="#">project</a>
		<a href="#">phone</a>
	</div>

	<!-- top btn -->
	<button onclick="topFunction()" id="top-button" title="Go to top">
		<div>
			<i class="fa-solid fa-caret-up fa-lg" style="color: #ffffff;"></i>
		</div>
		Top
	</button>

	<!-- 푸터 -->
	<footer>
		<div class="footer" style="background-color: white;">
			<div class="ft-logo">
				<img src="/resources/img/logo2.svg" alt="" width="50px"
					height="50px">
			</div>
			<div class="footinfo">
				<span><h6>©2023 Ok RENTAL. All Rights Reserved.</h6></span> <span><h6>RETURN
						POLICY</h6></span> <span><h6>TERMS & LEGAL</h6></span> <span><h6>PRIVACY
						NOTICE</h6></span>
			</div>
			<div class="footsns">
				<a href="https://www.facebook.com/login/?locale=ko_KR"><i
					class="fa-brands fa-facebook" style="color: #000000;"></i></a> <a
					href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoia28ifQ%3D%3D%22%7D"><i
					class="fa-brands fa-twitter" style="color: #000000;"></i></a> <a
					href="https://www.instagram.com/"><i
					class="fa-brands fa-instagram" style="color: #000000;"></i></a> <a
					href="https://github.com/login"><i class="fa-brands fa-github"
					style="color: #000000;"></i></a> <a href="https://discord.com/login"><i
					class="fa-brands fa-discord" style="color: #000000;"></i></a>
			</div>
		</div>
	</footer>
	<script src="/resources/js/HF.js"></script>
	<script src="/resources/js/product/list.js"></script>
	<!-- 푸터시마이 -->
	<script>
		
	</script>
</body>
</html>