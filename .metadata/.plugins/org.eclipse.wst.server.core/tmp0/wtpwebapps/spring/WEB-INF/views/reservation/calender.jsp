<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력</title>
    <script src="https://kit.fontawesome.com/e927512ef5.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="/resources/css/reservation/calender.css">
    <link rel="stylesheet" href="/resources/css/HF.css">
<style>
   
</style>
</head>
<body>
     <!-- 헤더 -->
     <header>
        <div class="container">
            <div class="header">
                <div class="logo-title">
                    <a href="#">
                        <img src="/resources/img/images.png" alt="">
                    </a>
                    <h1 class="title" style="color: #555;">OK Rental</h1>
                </div>
                <!-- 우측에 위치 -->
                <div class="header-right">
                    <div class="info">
                        <i class="fa-sharp fa-solid fa-user fa-xl" style="color: #555;" onclick="toggleTooltip();"></i>
                        <div id="tooltip" class="speech-bubble">
                        <a href="/signup.html">회원가입</a> <br> <a href="/login.html">로그인</a> <br> <a href="">회원정보수정</a>
                        </div>
                    </div>

                    <!-- 230710 서치 -->
                <div class="search">
                    <span id="search">
                      <i class="fa-solid fa-magnifying-glass fa-xl" style="color: #555;"></i>
                    </span>
                  </div>
                </div>
            </div>
        </div>
          <div id="myOverlay" class="overlay">
              <span class="closebtn" onclick="closeSearch()" title="Close Overlay">×</span>
              <div class="overlay-content">
                <form action="#">
                  <div class="search-container">
                    <h1 style="color: white;">Quickly Search Site</h1>
                    <div class="search-box">
                      <input type="text" placeholder="Search.." name="search" class="search-input">
                      <button class="search-box-btn" type="submit" style="color: #555;">Search</button>
                    </div>
                  </div>
                </form>
                  <div class="quickly">
                    <ul>
                      <li>
                        <i class="fa-solid fa-arrow-right fa-xs" style="color: #ffffff;"></i> <a href="">dyson</a>
                    </li>
                    <li>
                      <i class="fa-solid fa-arrow-right fa-xs" style="color: #ffffff;"></i> <a href="">  lg </a>
                    </li>
                    <li>
                      <i class="fa-solid fa-arrow-right fa-xs" style="color: #ffffff;"></i> <a href="">  cuckoo </a>
                    </li>
                    <li>
                      <i class="fa-solid fa-arrow-right fa-xs" style="color: #ffffff;"></i> <a href="">  coway </a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            
            <div id="blurryPart" class="blurry-part"></div>
          <!-- 230710 서치 -->
    </header>
    <!-- 헤더시마이 -->

    <div id="calendar-container">
    <div id="month-navigation">
        <!-- 수정된 부분: id -> class -->
        <div class="arrbutton prev-month"><i class="fas fa-arrow-left"></i></div>
        <div id="month-display"></div>
        <!-- 수정된 부분: id -> class -->
        <div class="arrbutton next-month"><i class="fas fa-arrow-right"></i></div>
    </div>
    <div id="calendar"></div>
    <div id="selected-date-display"></div>
    <button id="calendar-button" style="cursor: pointer;">Reservation</button>
</div>

    <div class="nav-btn" id="nav-btn">☰</div>

    <div class="nav-bar" id="nav-bar">
        <a href="#" class="a">service</a>
        <a href="#">address</a>
        <a href="#">project</a>
        <a href="#">phone</a>
    </div>
    


    <!-- 푸터 -->
    <footer>
        <div class="footer">
            <div class="ft-logo">
                <img src="/resources/img/images.png" alt="" width="50px" height="50px">
            </div>
            <div class="footinfo">
                <span><h6>©2023 Ok RENTAL. All Rights Reserved.</h6></span>
                <span><h6>RETURN POLICY</h6></span>
                <span><h6>TERMS & LEGAL</h6></span>
                <span><h6>PRIVACY NOTICE</h6></span>
            </div>
            <div class="footsns">
               <a href="https://www.facebook.com/login/?locale=ko_KR"><i class="fa-brands fa-facebook" style="color: #000000;"></i></a>
               <a href="https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoia28ifQ%3D%3D%22%7D"><i class="fa-brands fa-twitter" style="color: #000000;"></i></a>
                <a href="https://www.instagram.com/"><i class="fa-brands fa-instagram" style="color: #000000;"></i></a>
                <a href="https://github.com/login"><i class="fa-brands fa-github" style="color: #000000;"></i></a>
                <a href="https://discord.com/login"><i class="fa-brands fa-discord" style="color: #000000;"></i></a>
            </div>
        </div>
    </footer>
    <script src="/resources/js/HF.js"></script>
    <!-- 푸터시마이 -->
    <script src="/resources/js/reservation/calenderCustomer.js"></script>

    <script>
        var navBar = document.getElementById('nav-bar');
        var navBtn = document.getElementById('nav-btn');

        navBtn.addEventListener('mouseenter', function() {
            navBar.style.width = '300px';
        });

        navBar.addEventListener('mouseleave', function() {
            navBar.style.width = '0';
        });
    </script>
</body>
</html>
