<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>
<link href="/resources/join/user/css/join.css" rel="stylesheet">

<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<form action="./join" method="post">
이름<input type="text" name="partnerName"><br>
비번<input type="text"name="partnerPw"><br>
닉네임<input type="text"name="partnerNick"><br>
이메일<input type="text"name="partnerEmail"><br>
번호<input type="text"name="partnerPhone"><br>
은행<input type="text"name="partnerBank"><br>
계좌<input type="text"name="partnerAccount"><br>
성별<input type="text"name="partnerGender"><br>
생년<input type="text"name="partnerBirthyear"><br>
월<input type="text"name="partnerBirthmonth"><br>
일<input type="text"name="partnerBirthday"><br>
우편번호<input type="text"name="partnerPostcode"><br>
주소<input type="text"name="partnerAddress"><br>
상세주소<input type="text"name="partnerDetailaddress"><br>
외부주소<input type="text"name="partnerExtraaddress"><br>

<button>가입</button>
</form>


<!-- 우 여백 -->
<div class="col-3"></div>
<!-- 우 여백 끝 -->


<c:import url="../layout/footer.jsp"/>