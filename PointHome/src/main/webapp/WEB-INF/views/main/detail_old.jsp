<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ee1207dbdc41dc68f5d04b09a2bcafa&libraries=services"></script>

<!-- fullCalendar -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<!-- toss -->
<script src="https://js.tosspayments.com/v1/payment-widget"></script>

<script type="text/javascript">
function pickPart(th) {
	
	var partNo = $(th).parents(".pick").find(".partNo").val()
	console.log($(th).parents(".pick").find(".partNo").val())
	
	$.ajax({
		   type : 'get',           // 타입 (get, post, put 등등)
		   url : '/main/detailPick',  // 요청할 서버url
		   dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
		   data : {  // 보낼 데이터 (Object , String, Array)
			   partNo : $(th).parents(".pick").find(".partNo").val()
		   }, 
		   success : function(result) { // 결과 성공 콜백함수
		    	console.log(result)
		        if( result.isPick ) { //찜 했음
// 					$(th).find("i").toggleClass("bi-heart")
// 					$(th).find("i").addClass("bi-heart-fill")
					$(th).html("구독 취소")
				} else { //찜 취소
// 					$(th).find("i").toggleClass("bi-heart-fill")
// 					$(th).find("i").addClass("bi-heart")
					$(th).html("구독")
				}
		   
		   },
		   error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		   }
	})
}
</script>

<!-- 예약 -->
<style type="text/css">
#calendarDiv {
	display: flex;
 	justify-content: center;
 	align-items: center;
 	margin-top: 20px;
}

.fc-day-sun a {
 	color: red;
 	text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
.fc-day a {
  text-decoration: none;
</style>

<style type="text/css">
.nav-link {
	font-size: 20px;
	padding: 7px 20px;
	color: black;
}

#container{
	margin: 0 auto;
	margin-top: 190px;
	width:80%; 
	height:350px;
	display: flex;
  	justify-content: center;
  	align-items: center;
}

#container div {
	margin-right: 50px;
}

.content-pd {
	padding: 50px;
}
</style>

<style>
#commentTb th {
	padding: 15px 0px;
}

#commentTb td {
	padding: 15px 0px;
}

.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}

a {
	color: black;
}

.partner-tab-link {
	width: 323px;
}

.partner-btn {
	background-color: #7e00c2; 
	border-color: #7e00c2;
	font-size: 22px;
	color: white; 
	width: 190px; 
	height: 47px; 
}

.partner-btn:hover {
	background-color: #7e00c2; 
	border-color: #7e00c2;
	color: white; 
}

</style>


<script type="text/javascript">
var resDate = $("input[name=resDate]").val()
var resTime = $("input[name=resTime]").val()
var resDiv = $("input[name=resDiv]").val()
</script>

<!-- fullCanlendar JS Code -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');
    	var today = new Date().toISOString().split("T")[0];
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	locale: 'kr',
        	dayCellContent : function( cal ) {
        		return ('0'+cal.date.getDate()).slice(-2)
// 				if ( ('0'+cal.date.getDate()) > 15) {
// 					return 'X'					
// 				}
//         		return ('0'+cal.date.getDate()).slice(-2)
        	},
        	dateClick: function(info) {
        		console.log(info.dateStr)
        		console.log(info.date)
        		console.log(new Date())
        		var date = new Date();
       		
        		$.ajax({
					   type : 'get',           // 타입 (get, post, put 등등)
					   url : './reserveDateAjax',  // 요청할 서버url
					   dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
					   data : {  // 보낼 데이터 (Object , String, Array)
						   resDate : info.dateStr,
						   partNo : ${param.partNo},
					   	   partnerPrice : ${partner.partnerPrice}
					   }, 
					   success : function(result) { // 결과 성공 콜백함수
					        $("#reserveTime").html(result)
					   },
					   error : function(request, status, error) { 
					        console.log(error)
					   }
				})
        	},
        	
            validRange: {
            	start: today
            },
            selectable: true,
            selectMirror: true,

            navLinks: false, // can click day/week names to navigate views
            editable: false,
        });
        calendar.render();
    });
</script>



<div style="font-family: Noto_Sans_KR500">

<div id="container" style="padding-left: 130px;">
	<div style="margin-right: 80px;">
		<c:choose>
			<c:when test="${partnerFile.partnerImg eq null}">
				<div style="width:600px; height:400px;">
					<img id="profileImg" style="width:600px; height:400px;" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
				</div>
			</c:when>
			<c:otherwise>
				<div style="width:600px; height:400px;">
					<img id="profileImg" style="width:600px; height:400px;" alt="" src="/upload/${partnerFile.partnerImg }">
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="d-flex" style="height: 380px;">
	  <div class="vr"></div>
	</div>
	
	<div>
		<div>
			<button class="btn btn-secondary" style="font-size: 18px;" disabled="disabled">
				<c:if test="${partner.partnerType eq 't'.charAt(0) }">
					타로
				</c:if>
				<c:if test="${partner.partnerType eq 's'.charAt(0) }">
					신점
				</c:if>
				<c:if test="${partner.partnerType eq 'c'.charAt(0) }">
					사주
				</c:if>
			</button>
		</div>
		<div style="font-size: 50px;">
			${partner.partnerShopname }(${partner.partnerNick })
		</div>
		<div style="font-size: 19px; width: 400px; padding-top: 10px;">
			${partner.partnerPr }
		</div>
		<div style="margin-top: 50px; text-align: center;">
			<button class="btn partner-btn" style="margin-right: 10px; background-color: orange; border-color: orange;">1:1 채팅</button>
			<span class="pick" style="margin-top: 20px;"> 
				<input class="partNo" type="hidden" value="${partNo}">
				<c:if test="${isPick eq 0}">
					<button type="button" id="i" onclick="pickPart(this)" class="btn partner-btn">구독</button>
				</c:if>
				<c:if test="${isPick eq 1}">
					<button type="button" id="i" onclick="pickPart(this)" class="btn partner-btn">구독 취소</button>
				</c:if>
			</span>
		</div>
	</div>
</div>

<div class="container" style="margin: 150px auto;">
	<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
	  <li class="nav-item" role="presentation">
	    <button class="nav-link active partner-tab-link" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">예약</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link partner-tab-link" id="reserve-tab" data-bs-toggle="tab" data-bs-target="#reserve-tab-pane" type="button" role="tab" aria-controls="reserve-tab-pane" aria-selected="false">안내</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link partner-tab-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review-tab-pane" type="button" role="tab" aria-controls="review-tab-pane" aria-selected="false">영상</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link partner-tab-link" id="notice-tab" data-bs-toggle="tab" data-bs-target="#notice-tab-pane" type="button" role="tab" aria-controls="notice-tab-pane" aria-selected="false">리뷰</button>
	  </li>
	</ul>
	<div class="tab-content" id="myTabContent">
	  <div class="tab-pane fade show active content-pd" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
	    <!-- 예약 페이지 -->
	  	<div id="calendarDiv">
			<div id='calendar' style="width: 600px; height: 600px; margin-right: 30px; margin-left: 20px;"></div>
			<div id="reserveTime" style="width: 550px; height: 500px; padding: 20px; padding-top: 60px;">
				<div style="font-size: 20px; text-align: center; margin-top: 150px;">원하는 날짜를 선택하세요</div> 
			</div>
		</div>
		<!-- 안내 -->
		<div style="margin: 110px auto; padding: 50px; width: 1200px; border: 1px solid #ccc; border-radius: 15px;">
			<div style="margin-bottom: 30px;">
				<div style="font-size: 25px;">- 유의사항 안내</div>
				<div style="font-size: 20px; padding: 5px;">유의사항사항사항</div>
			</div>
			<div>
				<div style="font-size: 25px;">- 환불 안내</div>
				<div style="font-size: 20px; padding: 5px;">유의사항사항사항</div>
			</div>
		</div>
	  </div>
	  <!-- 영상 -->
	  <div class="tab-pane fade content-pd" id="review-tab-pane" role="tabpanel" aria-labelledby="review-tab" tabindex="0">
	  	<table class="table table-hover" style="width: 1100px; margin: 20px auto;">
			<c:forEach var="video" items="${video}">
				<tr>
					<td><iframe width="560" height="315"
							src="https://www.youtube.com/embed/${video.partnerVideoUrl}"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write;
	                        encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe></td>
	
					<td><fmt:formatDate value="${video.partnerVideoDate}"
							pattern="yy/MM/dd hh:mm" /></td>
				</tr>
			</c:forEach>
		</table>
	  </div>
	  <!-- 리뷰 -->
	  <div class="tab-pane fade content-pd" id="notice-tab-pane" role="tabpanel" aria-labelledby="notice-tab" tabindex="0">
	  	<div style="border: 1px solid #ccc; padding: 20px 30px; width: 1000px; margin: 0 auto; margin-top: 20px;">
		  	<c:forEach var="review" items="${reviewList }">
		  		<div style="margin: 0 auto; font-size: 18px;">
			  		<div style="padding: 20px;">
			  			<span style="font-weight: bold; margin-right: 10px;"><i class="bi bi-person-circle"></i> ${review.USER_NICK }</span>
						<span style="float: right;"><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy/MM/dd hh:mm"/></span>
			  			<span class="star-ratings">
							<span class="star-ratings-fill space-x-2 text-lg" style="width: ${review.REVIEW_GRADE * 20 }%;">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</span>
							<span class="star-ratings-base space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</span>
						</span>
						<span>${review.REVIEW_GRADE }</span>
				  		<div style="margin-top: 10px; margin-left: 3px;">${review.REVIEW_CONTENT }</div>
			  		</div>
			  		<hr>
		  		</div>
		  	</c:forEach>
	  	</div>
	  </div>
	  <!-- 공지사항 -->
	  <div class="tab-pane fade content-pd" id="reserve-tab-pane" role="tabpanel" aria-labelledby="reserve-tab" tabindex="0">
	  	<!-- 지도 -->
		<div style="margin: 20px; margin-top: 100px;">
			<div id="map" style="width:600px; height:500px; display: inline-block;"></div>
			<div style="width:300px; display: inline-block;">오시는 길</div>
		</div>
	  </div>
	</div>
</div>

</div>


<!-- 지도 -->
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${partner.partnerAddress}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {
    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${partner.partnerShopname}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});
</script>


<c:import url="/WEB-INF/views/layout/footer.jsp"/>




