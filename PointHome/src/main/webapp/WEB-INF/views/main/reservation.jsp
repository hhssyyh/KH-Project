<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/layout/detailBanner.jsp"/>


<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	
        	dateClick: function(info) {
        		$.ajax({
					   type : 'get',           // 타입 (get, post, put 등등)
					   url : './reserveDateAjax',  // 요청할 서버url
					   dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
					   data : {  // 보낼 데이터 (Object , String, Array)
						   resDate : info.dateStr,
						   partNo : 103 //일단 103으로 한거고 바꿀거
					   }, 
					   success : function(result) { // 결과 성공 콜백함수
					    	console.log(result)
					        $("#recommend").html(result)
					   },
					   error : function(request, status, error) { // 결과 에러 콜백함수
					        console.log(error)
					   }
				})
        		
        	},
            // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
            
            selectable: true,
            selectMirror: true,

            navLinks: false, // can click day/week names to navigate views
            editable: false,
            // Create new event
//             select: function (arg) {
//                 Swal.fire({
//                     html: "<div class='mb-7'>Create new event?</div><div class='fw-bold mb-5'>Event Name:</div><input type='text' class='form-control' name='event_name' />",
//                     icon: "info",
//                     showCancelButton: true,
//                     buttonsStyling: false,
//                     confirmButtonText: "Yes, create it!",
//                     cancelButtonText: "No, return",
//                     customClass: {
//                         confirmButton: "btn btn-primary",
//                         cancelButton: "btn btn-active-light"
//                     }
//                 }).then(function (result) {
//                     if (result.value) {
//                         var title = document.querySelector("input[name=;event_name']").value;
//                         if (title) {
//                             calendar.addEvent({
//                                 title: title,
//                                 start: arg.start,
//                                 end: arg.end,
//                                 allDay: arg.allDay
//                             })
//                         }
//                         calendar.unselect()
//                     } else if (result.dismiss === "cancel") {
//                         Swal.fire({
//                             text: "Event creation was declined!.",
//                             icon: "error",
//                             buttonsStyling: false,
//                             confirmButtonText: "Ok, got it!",
//                             customClass: {
//                                 confirmButton: "btn btn-primary",
//                             }
//                         });
//                     }
//                 });
//             },

            
            
            // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
//             events: [
//                 {
//                 title: 'All Day Event',
//                 start: '2023-05-30'
//                 }
//             ]
        });

        calendar.render();
    });

</script>

<style type="text/css">
	#calendarDiv {
		display: flex;
  	justify-content: center;
  	align-items: center;
	
	}
</style>
	
<div id="calendarDiv">
<div id='calendar' style="width: 600px; height: 600px; margin: 100px;"></div>


<div id="reserveTime" style="width: 500px; height: 500px; border: 1px solid;"></div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>


