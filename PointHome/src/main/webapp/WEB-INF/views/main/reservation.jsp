<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점집닷컴</title>

<!-- toss -->
<script src="https://js.tosspayments.com/v1/payment-widget"></script>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- fullCalendar -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>

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
</head>



<body>

<c:import url="/WEB-INF/views/layout/detailBanner.jsp"/>

<script type="text/javascript">
var resDate = $("input[name=resDate]").val()
var resTime = $("input[name=resTime]").val()
var resDiv = $("input[name=resDiv]").val()
</script>

<!-- fullCanlendar JS Code -->
<script>

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
						   partNo : ${param.partNo}
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

<div id="calendarDiv">
<div id='calendar' style="width: 600px; height: 600px; margin: 100px; margin-right: 30px;"></div>


<div id="reserveTime" style="width: 500px; height: 500px; padding: 65px;"></div>
</div>




<c:import url="/WEB-INF/views/layout/footer.jsp"/>


