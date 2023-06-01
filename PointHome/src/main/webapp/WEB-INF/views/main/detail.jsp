<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/views/layout/header.jsp"/>

<c:import url="/WEB-INF/views/layout/detailBanner.jsp"/>


<style>
#container {
	margin-top: 154px;
}

#toptab {
	margin-top: 100px;
}

#container{
	background-color: grey;
	width:100%; 
	height:350px;
	display: flex;
  	justify-content: center;
  	align-items: center;
  	
}

#container div {
	margin-right: 10px;

}

#btn {
	position: fixed;

}
</style>



<div style="width: 65%; margin: 150px auto;">

	<div id="container2" style="border: 1px solid;">
		<div style="width:400px; height:400px; background-color: gray;" >
			지도
		</div>
	</div>
	
	<hr style="margin: 100px 0;">
	
	<div style="border: 1px solid;">
	</div>

	<a href="#"><button id="btn">예약</button></a>
</div>



<!-- 		<select>
			<option>11</option>
			<option>2</option>
			<option>33</option>
			<option>44</option>
		</select> -->


<c:import url="/WEB-INF/views/layout/footer.jsp"/>

