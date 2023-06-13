<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp"/>

<!-- fullCalendar -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>


<style type="text/css">
.body {
	display: inline-block;
	margin-top: 85px;
	margin-left: 14%;
	width: 85%;
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
}

#calendarDiv {
	display: flex;
 	align-items: center;
}
</style>

<!-- fullCanlendar JS Code -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');
    	var today = new Date().toISOString().split("T")[0];
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	locale: 'kr',
        	dayCellContent : function( cal ) {
        		return ('0'+cal.date.getDate()).slice(-2)
        	},
        	dateClick: function(info) {
        		var date = new Date();

        		$.ajax({
					   type : 'get',           // 타입 (get, post, put 등등)
					   url : './partupdatereserveajax?partnerNo=${partnerNo}' , // 요청할 서버url
					   dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
					   data : {  // 보낼 데이터 (Object , String, Array)
						   resDate : info.dateStr,
						   resNo : ${resNo}
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


<div class="body">
	<div style="width: 90%; margin: 0 auto;">
		<h2>원래 예약: ${date } ${time }</h2>
		<hr>
		<div id="calendarDiv">
			<div id='calendar' style="width: 600px; height: 600px; margin: 80px; margin-right: 60px;"></div>
			<div id="reserveTime" style="width: 500px; height: 500px; padding: 20px; padding-top: 60px;"></div>
		</div>
	</div>
</div>





</body>
</html>

