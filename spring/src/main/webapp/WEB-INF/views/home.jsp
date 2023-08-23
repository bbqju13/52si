<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>home</title>
<script src="https://kit.fontawesome.com/e927512ef5.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet" href="/resources/css/home.css">
<link rel="stylesheet" href="/resources/css/slide.css">
<link rel="stylesheet" href="/resources/css/chat/chatbot.css">
<script src="/resources/js/chat/chatForm.js"></script>
</head>
<style>
</style>
<body style="scroll-padding-bottom: 100px;">
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
								<br>
							</c:if>

							<!-- 로그인해야 수정 삭제가 보이게 -->
							<c:if test="${ses.cid != null }">
								<a href="/user/logout">로그아웃</a>
								<br>
								<a href="/user/modify">회원수정</a>
								<br>
								<a href="/user/delete">회원삭제</a>
								<br>
								<a href="/consult/register">상담신청</a>
								
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
							<button type="submit" style="color: #555;">Search</button>
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
		
		<!-- id container는 화면 중앙 상단에 위치  -->
		<div class="nav">
			<div class="center-items">
				<a href="/product/list?type_a=정수기"><p>Water purifier</p></a> 
				<a href="/product/list?type_a=공기청정기"><p>Air purifier</p></a> 
				<a href="/product/list?type_a=제습기"><p>Dehumidifier</p></a> 
				<a href="/product/list?type_a=에어컨"><p>Air Conditioner</p></a>
				<a href="/product/list?type_a=텔레비전"><p>Television</p></a>
			</div>
		</div>
		<br>
		<!-- 호버메뉴 -->
		<div class="nav-btn" id="nav-btn">☰</div>

		<div class="nav-bar" id="nav-bar">
			<a href="/reservation/calender">calender</a> <a href="/consult/Admincalender">Admin_calender</a> <a href="#">project</a>
			<a href="#">phone</a>
		</div>

	</header>
	<!-- 영상orCF광고 -->
	<main>
		<div class="video-box">
			<video src="/resources/video/도시.mp4" muted autoplay loop>
				<source src="/resources/video/도시.mp4" type="video/mp4">
			</video>
		</div>
	</main>

	<!-- 이제부터 그냥 홈페이지 -->

	<!-- ************************************* -->

	<section id="tranding">
		<div class="container2">
			<h3 class="text-center section-subheading">- popular products -</h3>
			<h1 class="text-center section-heading">Tranding products</h1>
		</div>
		<div class="container2">
			<div class="swiper tranding-slider">
				<div class="swiper-wrapper">
					<!-- Slide-start -->
					<div class="swiper-slide tranding-slide">
						<div class="tranding-slide-img">
							<img src="/resources/img/정수기.jpg" alt="Tranding">
						</div>
						<div class="tranding-slide-content">
							<h1 class="food-price">₩ 1,040,000</h1>
							<div class="tranding-slide-content-bottom">
								<h2 class="food-name">water purifier</h2>
							</div>
						</div>
					</div>
					<!-- Slide-end -->
					<!-- Slide-start -->
					<div class="swiper-slide tranding-slide">
						<div class="tranding-slide-img">
							<img src="/resources/img/공기청정기.jpg" alt="Tranding">
						</div>
						<div class="tranding-slide-content">
							<h1 class="food-price">₩ 547,710</h1>
							<div class="tranding-slide-content-bottom">
								<h2 class="food-name" style="color: white;">air purifier</h2>
							</div>
						</div>
					</div>
					<!-- Slide-end -->
					<!-- Slide-start -->
					<div class="swiper-slide tranding-slide">
						<div class="tranding-slide-img">
							<img src="/resources/img/매트리스.jpg" alt="Tranding">
						</div>
						<div class="tranding-slide-content">
							<h1 class="food-price">₩ 498,000</h1>
							<div class="tranding-slide-content-bottom">
								<h2 class="food-name" style="color: white;">mattress</h2>
							</div>
						</div>
					</div>
					<!-- Slide-end -->
					<!-- Slide-start -->
					<div class="swiper-slide tranding-slide">
						<div class="tranding-slide-img">
							<img src="/resources/img/식기세척기.jpg" alt="Tranding">
						</div>
						<div class="tranding-slide-content">
							<h1 class="food-price">₩ 1,070,550</h1>
							<div class="tranding-slide-content-bottom">
								<h2 class="food-name" style="color: white;">dishwasher</h2>
							</div>
						</div>
					</div>
					<!-- Slide-end -->
					<!-- Slide-start -->
					<div class="swiper-slide tranding-slide">
						<div class="tranding-slide-img">
							<img src="/resources/img/무선청소기.jpg" alt="Tranding">
						</div>
						<div class="tranding-slide-content">
							<h1 class="food-price">₩ 990,000</h1>
							<div class="tranding-slide-content-bottom">
								<h2 class="food-name" style="color: white;">wireless vacuum
									cleaner</h2>
							</div>
						</div>
					</div>
					<!-- Slide-end -->
					<!-- Slide-start -->
					<div class="swiper-slide tranding-slide">
						<div class="tranding-slide-img">
							<img src="/resources/img/로봇청소기.jpg" alt="Tranding">
						</div>
						<div class="tranding-slide-content">
							<h1 class="food-price">₩ 2,306,000</h1>
							<div class="tranding-slide-content-bottom">
								<h2 class="food-name" style="color: white;">robot vacuum
									cleaner</h2>
							</div>
						</div>
					</div>
					<!-- Slide-end -->
					<!-- Slide-start -->
					<div class="swiper-slide tranding-slide">
						<div class="tranding-slide-img">
							<img src="/resources/img/밥솥.jpg" alt="Tranding">
						</div>
						<div class="tranding-slide-content">
							<h1 class="food-price">₩ 508,630</h1>
							<div class="tranding-slide-content-bottom">
								<h2 class="food-name" style="color: white;">Rice cooker</h2>
							</div>
						</div>
					</div>
					<!-- Slide-end -->
				</div>

				<div class="tranding-slider-control">
					<div class="swiper-button-prev slider-arrow">
						<ion-icon name="arrow-back-outline"></ion-icon>
					</div>
					<div class="swiper-button-next slider-arrow">
						<ion-icon name="arrow-forward-outline"></ion-icon>
					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</div>
	</section>

	<!-- ************************************* -->

	<section>
		<!-- 230706 -->
		<div class="section2">
			<h1 style="color: #555;">Time Sale D-day</h1>
			<video src="/resources/video/티비CF.webm" muted autoplay loop></video>
			<div class="cnt">
				<div id="days" class="countdown animated"></div>
				<div id="hours" class="countdown animated"></div>
				<div id="minutes" class="countdown animated"></div>
				<div id="seconds" class="countdown animated"></div>
			</div>
		</div>
		<article>
			<div class="section1">
				<div class="inner">
					<div class="title_area">
						<h2>Customer Rental Services</h2>
					</div>
					<div class="desc">
						<div>
							<a href="#">
								<div class="icon">
									<img src="/resources/img/달력.png" alt="">
								</div>
								<div class="icon_tit">신규 설치일정 조회/변경</div>
								<div class="link">
									<span> 바로가기</span>
								</div>
							</a>
						</div>
						<div>
							<a href="#">
								<div class="icon">
									<img src="/resources/img/셋팅.png" alt="">
								</div>
								<div class="icon_tit">이전설치 신청/조회</div>
								<div class="link">
									<span>바로가기</span>
								</div>
							</a>
						</div>
						<div>
							<a href="#">
								<div class="icon">
									<img src="/resources/img/머니.png" alt="">
								</div>
								<div class="icon_tit">렌탈료/만료일 잔여 조회</div>
								<div class="link">
									<span>바로가기</span>
								</div>
							</a>
						</div>
						<div>
							<a href="#">
								<div class="icon">
									<img src="/resources/img/요금.png" alt="">
								</div>
								<div class="icon_tit">미납요금 조회/결제</div>
								<div class="link">
									<span>바로가기</span>
								</div>
							</a>
						</div>
						<div>
							<a href="#">
								<div class="icon">
									<img src="/resources/img/요금변경.png" alt="">
								</div>
								<div class="icon_tit">결제 카드 변경</div>
								<div class="link">
									<span>바로가기</span>
								</div>
							</a>
						</div>
						<div>
							<a href="#">
								<div class="icon">
									<img src="/resources/img/입금확인.png" alt="">
								</div>
								<div class="icon_tit">입금 확인증 조회</div>
								<div class="link">
									<span>바로가기</span>
								</div>
							</a>
						</div>
						<div>
							<a href="#">
								<div class="icon">
									<img src="/resources/img/동영상조회.png" alt="">
								</div>
								<div class="icon_tit">동영상 조회</div>
								<div class="link">
									<span>바로가기</span>
								</div>
							</a>
						</div>
						<div>
							<a href="#">
								<div class="icon">
									<img src="/resources/img/포인트조회.png" alt="">
								</div>
								<div class="icon_tit">렌탈료 포인트 납부</div>
								<div class="link">
									<span>바로가기</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</article>


	</section>



	<!-- 플로팅 메뉴 or 퀵메뉴 -->
   <div class="floating">
      <button id="info-button">
         <i class="fa-solid fa-question" style="color: white;"></i>
      </button>
      <div id="info-modal" class="modal">
         <div id="modal-header" style="display: flex; justify-content: center; align-items: center;">
            <img class="robot-icon2" alt="robot-icon" src="/resources/img/icon_robot.png" />
            <span>챗봇 서비스</span>        
            <span id="close-button">&times;</span>
         </div>      
         <div id="wrap">                 
             <!-- 응답 메시지 출력  -->
             <div id="chatBox"></div>

             <!-- 질문 메시지 입력 폼 -->
             <form id="chatForm" style="display: flex; border: none; width: 100%" >
                  <input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">
                  <input type="submit" value="전송">
             </form>
             
          </div>
      </div>   
   </div>

	<!-- 관리자만 보이는 버튼 좌측 하단에 작게 표시 마우스 호버있음 -->
	<c:if test="${ses.cid eq 'admin' }">
		<div class="floating-admin">
			<button id="admin-button-left">
				<i class="fa-solid fa-cogs" style="color: white;"></i>
			</button>
		</div>

		<div id="admin-modal-left" class="modal-left">
			<div class="modal-content-left">
				<span id="close-button-admin-left">&times;</span>
				<div class="modal-buttons-left">
					<a href="/product/register"><button class="modal-btn-left">register</button></a>
					<a href="/product/adminList"><button class="modal-btn-left">adminList</button></a>
					<a href="/consult/adminList"><button class="modal-btn-left">consult adminList</button></a>
					<a href="/reservation/admincalender"><button class="modal-btn-left">reservation admin calender</button></a>
				</div>
			</div>
		</div>
	</c:if>
	<footer>
		<div class="footer">
			<div class="ft-logo">
				<img src="/resources/img/logo2.svg" alt="" width="50px"
					height="50px">
			</div>
			<div class="footinfo">
				<h6>©2023 Ok RENTAL. All Rights Reserved.</h6>
				<a href="#"><h6>RETURN POLICY</h6></a> <a href="#"><h6>TERMS
						& LEGAL</h6></a> <a href="#"><h6>PRIVACY NOTICE</h6></a>
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
	<script src="/resources/js/home.js"></script>
	<!-- ************************************************* -->
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script>
		var TrandingSlider = new Swiper('.tranding-slider', {
			effect : 'coverflow',
			grabCursor : true,
			centeredSlides : true,
			loop : true,
			slidesPerView : 'auto',
			coverflowEffect : {
				rotate : 0,
				stretch : 0,
				depth : 100,
				modifier : 2.5,
			},
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			}
		});
	</script>
	<script type="text/javascript">
   		const modifySus = '<c:out value="${modifyFail}"/>';
   		console.log(modifySus); 
   		if(modifySus == 2){
    		alert("회원정보가 수정되었습니다")   
   		}
   </script>
</body>
</html>