<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/product/detail.css">
<link rel="stylesheet" href="/resources/css/HF.css">
</head>
<body>
	<c:set var="product" value="${product.pvo }"></c:set>
	<c:set var="comment" value="${list }"></c:set>
	<div id="productImage">
	
	</div>
	<div id="productName">
		<span></span>
		<span id="title">상품번호</span>
		<span id="productNo">${product.pno }</span><br>
<%-- 		<span id="productBrand">${product.pmade }</span>
		<span id="productUuid">${product.uuid }</span> --%>
		<span id="title">상품이름</span>
		<strong id="productName">${product.pname }</strong><br>
		<span id="title">상품가격</span>
		<span id="productPrice">${product.price }원</span>
		<br><hr>
	</div>
	<div id="productOption">
	
		<!-- 납부기간 -->
		<div id="optionPayment">
			<div id="paymentPlan">
				<span id="paymentPlanTitle">납부기간</span>
				<button type="button" id="paymentOption01" class="paymentOption" value="${product.price }">36개월</button>
				<button type="button" id="paymentOption02" class="paymentOption" value="${product.price }">48개월</button>
				<button type="button" id="paymentOption03" class="paymentOption" value="${product.price }">60개월</button>
			</div>
		</div>
		<!-- 할인 -->
		<div id="optionDiscount">
			<span id="discountSelect"></span>
		</div>
		<!-- 최종 가격 -->
		<div id="optiontotalSum">
			<div id="sumTop">
				<span id="sumText1">상품가격</span>
				<span id="productPrice">${product.price }</span><br>
				<span id="sumText2">원</span>
			</div><hr>
			<div id="sumBottom">
				<b id="finalSumText">최종 혜택가</b>
				<span id="month">월</span>
				<span id="finalPrice"></span>
			</div>
		</div>
		<!-- 할인 광고 -->
		<img alt="#" src="#">
	</div>
	<div id="bottomMain">
		<div id="tabTitle">
			<ul>
				<li><a href="#" id="detailBox">상세 정보</a></li>
				<li><a href="#" id="specBox">상품 스펙</a></li>
				<li><a href="#" id="cardBox">할인 카드</a></li>
			</ul>
		</div>
	</div>
	
	<!-- 상세정보(안에 리뷰도 같이 들어있음) -->
	<!-- 사이트 캡쳐 이미지 사용 -->
	<div id="detailContent">
		<img alt="#" src="#">
		
		<!-- 상세정보 안에 추천 상품(넣어도 되고 빼도 됨) -->
		<div id="addDiscount">
			<span>함께 비교하면 좋은 상품이에요</span>
			<ul>
				<li>
					<a href="/product/detail?pno=${product.pno }">
						<div id="addDiscountListBottom">
							<%-- <strong id="brandName">${product.pmade }</strong> --%>
							<div id="productName">${product.pname }</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div id="addDiscount">
			<span>지금 가장 주목 받는 상품이에요</span>
			<ul>
				<li>
					<a href="/product/detail?pno=${product.pno }">
						<div id="addDiscountListBottom">
							<%-- <strong id="brandName">${product.pmade }</strong> --%>
							<div id="productName">${product.pname }</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
		
		<!-- 리뷰 -->
		<div id="reviewList">
			<div id="topWrap">
				<h6>사용자 총 평점</h6>
				<div id="scoreWrap">
					<div id="totalRating"></div>
				</div>
			</div>
			<br>
			<div id="listUpWrap">
				<div id="leftWrap">전체 리뷰 수</div>
				<span id="highlightTxt">
					<b id="countPrint"></b>
				</span>
			</div>
			<div id="userReview">
				<ul id="cmtListArea">
					<li id="listPagingShow">
					<span id="averageRateSpan"></span>
					</li>
				</ul>
			</div>
			
			<!-- 리뷰(댓글)작성 부분 -->
			<c:if  test="${ses.cid != null }">
			<form action="/comment/post" method="post">
			<div id="reviewWrite">
				<span id=cmtWriter>${ses.cid }</span>
				<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <span class="star">
  					★★★★★
  					<span>★★★★★</span>
 					<input type="range" oninput="Star(this)" id="targetRatingInput" value="1" step="2" min="0" max="10">
				</span>
                <div class="warningMsg">5자 이상으로 작성해 주세요.</div><br>
				<input type="text" id="cmtText" class="textArea">
				<button type="button" id="cmtPostBtn">리뷰 작성하기</button>
			</div>
			</form>
			</c:if>
			
		</div>
	</div>
	
	<!-- 상품 스펙 -->
	<!-- 사이트 캡쳐 이미지 사용 -->
	<div id="specContent" style="display: none">
		<img alt="#" src="#">
	</div>
	
	<!-- 할인카드 -->
	<div id="cardNotice" style="display: none">
		<div id="discountCover">
			<h4>헬로렌탈 할인카드란?</h4>
				<ul>
					<li>신용카드 이용 실적에 따라 매월 내는 렌탈료를 할인받는 혜택이예요.</li>
					<li>할인카드 발급한 다음 달 말일까지는 실적 없이도 할인이 적용됩니다.</li>
						<div id="coverData">
							<p>예)3/10 카드 발급 후 결제 수단으로 등록>실적 없이도 3/20자동
							이체, 4/20 자동이체 총 2회 할인 적용</p>
							<p>3/30 카드 발급 후 결제 수단으로 등록>실적 없이도 4/20 자동
							이체, 1회 할인 적용</p>
						</div>
					<li>3개월차 부터는 실적을 달성한 달은 할인이 자동 적용되지만, 실적이 없는 달은 할인이 되지 않아요.</li>
						<div id="coverData">
							<p>예)월 렌탈료 29,000원 상품 렌탈 후 하나 Simple Life 카드 발급 시</p>
							<p>30만원 이용한 달은 총 렌탈료에서 18,000원 자동 할인 >
							11,900원</p>
							<p>70만원 이용한 달은 총 렌탈료에서 20,000원 자동 할인>
							9,900원</p>
							<p>30만원 미만 이용한 달은 할인 없음 > 29,000원</p>
						</div>
				</ul>
		</div>
		<div id="discountIssou">
			<h4>할인카드 발급 방법이 궁금해요</h4>
				<ul>
					<li>LG헬로렌탈 할인카드 중 하나롷 신규 발급받으셔야 매월 할인 받으실 수 있어요!</li>
					<li>잊지 마세요! 카드를 발급받고 상품을 받으신 후에 LG헬로렌탈 할인카드를 납부 카드로 등록해주세요.</li>
				</ul>
		</div>
		<div id="discountPayment">
			<h4>결제 수단 변경 방법이 궁금해요</h4>
				<ul>
					<li>직접 변경 : LG 헬로비전 사이트(http://www.lghellovision.net/)접속 > 마이 헬로 > 요금조회/납부관리 > 납부방법 변경</li>
						<div class="btn">요금조회/납부관리 바로가기</div>
					<li>전화 요청 : 1855-1020 전화 > 헬로렌탈 > 요금 문의 후 상담원 통해 변경 요청</li>
				</ul>
		</div>
		<div id="discountRecommend">
			<h4>혜택이 가장 큰 할인카드로 추천해주세요</h4>
				<h5>하나 Simple Life</h5>
				<div id="cardContent">
					<img>
					<div id="textWrap">
						<div id="textWrap01">
							<span></span>
							<span></span>
						</div>
						<div id="textWrap02">
							<span id="text01"></span>
							<span id="text02"></span>
						</div>
						<div id="bottom-text">※ 30만원 이상 사용 시 1~24개월 18,000원 / 25개월부터 11,000원 할인 적용</div>
					</div>
				</div>
				<h5>국민 카드</h5>
				<div id="cardContent">
					<img>
					<div id="textWrap">
						<div id="textWrap01">
							<span></span>
							<span></span>
						</div>
						<div id="textWrap02">
							<span id="text01"></span>
							<span id="text02"></span>
						</div>
						<div id="bottom-text">※ 30만원 이상 사용 시 1~24개월 16,000원 / 25개월부터 11,000원 할인 적용</div>
					</div>
				</div>
				<div id="differCard">더 많은 할인카드 보기</div>
		</div>
	</div>
	
	
	<!-- 하단 고정 -->
	<div id="skichyBar">
		<div id="optionWrap">
			<span id="updownOption"></span>
		</div>
		<div id="total">
			<div id="totalTitle">최종 혜택가</div>
			<div id="totalPrice">
				<span id="month">월</span>
				<span id="realFinalPrice"></span>
				<span id="won"></span>
			</div>
		</div>
		<div id="buttonWrap">
			<a><button id="blackBtn">상담신청</button></a>
			<a><button id="redBtn">
				<span id="bubble">빠른배송</span>
				간편구매</button></a>
		</div>
	</div>
	<script src="/resources/js/HF.js"></script>
	<script type="text/javascript">
    const pnoVal = `<c:out value="${product.pno}"/>`;
	console.log("pnoVal : "+pnoVal);
	</script>
	
	<script type="text/javascript" src="/resources/js/product/productDetail.js">
	</script>
	<script type="text/javascript">
	getCommentList(pnoVal);
	</script>
</body>
</html>