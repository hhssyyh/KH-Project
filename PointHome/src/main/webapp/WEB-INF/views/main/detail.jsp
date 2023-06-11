<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
					$(th).find("i").toggleClass("bi-heart")
					$(th).find("i").addClass("bi-heart-fill")
				} else { //찜 취소
					$(th).find("i").toggleClass("bi-heart-fill")
					$(th).find("i").addClass("bi-heart")
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



<div id="container">
	<div>
		<c:choose>
			<c:when test="${partnerFile.partnerImg eq null}">
				<div style="width:450px; height:450px;">
					<img id="profileImg" style="width:450px; height:450px;" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
				</div>
			</c:when>
			<c:otherwise>
				<div style="width:450px; height:450px;">
					<img id="profileImg" style="width:450px; height:450px;" alt="" src="/upload/${partnerFile.partnerImg }">
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	
	<div>
		<div style="font-size: 50px; margin-bottom: 10px;">
			${partner.partnerShopname }(${partner.partnerNick })
		</div>
		<div>
			<span style="font-size: 22px;">${partner.partnerEmail }</span>
			<br>
			<span style="font-size: 22px;">${partner.partnerPhone }</span>
		</div>
		<div class="pick" style="margin-top: 20px;"> 
			<input class="partNo" type="hidden" value="${partNo}">
			<c:if test="${isPick eq 0}">
				<button type="button" onclick="pickPart(this)" class="btn btn-danger">구독</button>
			</c:if>
			<c:if test="${isPick eq 1}">
				<button type="button" onclick="pickPart(this)" class="btn btn-danger">구독 취소</button>
			</c:if>
		</div>
	</div>
</div>

<div class="container" style="margin: 150px auto;">
	<ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
	  <li class="nav-item" role="presentation">
	    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">예약</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review-tab-pane" type="button" role="tab" aria-controls="review-tab-pane" aria-selected="false">위치안내</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="notice-tab" data-bs-toggle="tab" data-bs-target="#notice-tab-pane" type="button" role="tab" aria-controls="notice-tab-pane" aria-selected="false">리뷰</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="reserve-tab" data-bs-toggle="tab" data-bs-target="#reserve-tab-pane" type="button" role="tab" aria-controls="reserve-tab-pane" aria-selected="false">공지사항</button>
	  </li>
	</ul>
	<div class="tab-content" id="myTabContent">
	  <div class="tab-pane fade show active content-pd" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
	  	<!-- 예약 페이지 -->
	  	<div id="calendarDiv">
			<div id='calendar' style="width: 600px; height: 600px; margin-right: 30px;"></div>
			<div id="reserveTime" style="width: 500px; height: 500px; padding: 20px; padding-top: 60px;"></div>
		</div>
	  </div>
	  <div class="tab-pane fade content-pd" id="review-tab-pane" role="tabpanel" aria-labelledby="review-tab" tabindex="0">
	  	<div id="container2">
			<div id="map" style="width:500px; height:400px;"></div>
		</div>
	  </div>
	  <div class="tab-pane fade content-pd" id="notice-tab-pane" role="tabpanel" aria-labelledby="notice-tab" tabindex="0">
	  	
	  </div>
	  <div class="tab-pane fade content-pd" id="reserve-tab-pane" role="tabpanel" aria-labelledby="reserve-tab" tabindex="0">...</div>
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




