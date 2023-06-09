<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="./layout/header.jsp"></c:import>

<div style="padding-bottom: 105px; padding-top: 64px;">
<!-- carosel -->
<div>
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../resources/panda.jpg" class="d-block w-70" height="400px" style="margin: 0 auto;" alt="...">
			</div>

			<div class="carousel-item">
				<img src="../resources/dog.jpeg" class="d-block" style="margin: 0 auto;" height="400px" alt="개">
			</div>
		</div>

		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
</div>
<!-- carosel end -->

<div class="container">

	<div class="mt-3 d-flex">

			<div>
				<p class="card_title fs-3">인기상담사</p>
			</div>
			<div class="mx-2 mt-1">
				<a class="card_title_sub fs-6" href="./main">TOP10</a>
			</div>

		</div>

		<div class="justify-content-center" style="display: flex;">
			<!-- img -->
			<div class="card" style="width: 300px;">
				<img src="../resources/dog.jpeg" class="card-img-top" height="200px"
					alt="ex">
				<!-- img end  -->
				<div class="card-body">
					<h5 class="card-title">제휴사 이름</h5>
					<table>
						<tr>
							<th>가격</th>
							<td>1000</td>
							<th>가격</th>
							<td>1000</td>

						</tr>
						<tr>
							<th>후기</th>
							<th>10</th>
						</tr>
						<tr>
							<th>별점</th>
							<th>5</th>
						</tr>

					</table>

					<a href="#" class="btn btn-primary">상세페이지</a>
				</div>
			</div>

			<div style="margin-right: 10px"></div>

			<!-- img -->
			<div class="card" style="width: 300px;">
				<img src="../resources/panda.jpg" class="card-img-top" alt="ex">
				<!-- img end  -->
				<div class="card-body">
					<h5 class="card-title">title</h5>
					<p class="card-text">text</p>
					<a href="#" class="btn btn-primary">상세페이지</a>
				</div>
			</div>

			<div style="margin-right: 10px"></div>

			<!-- img -->
			<div class="card" style="width: 300px;">
				<img src="" class="card-img-top" alt="ex">
				<!-- img end  -->
				<div class="card-body">
					<h5 class="card-title">title</h5>
					<p class="card-text">text</p>
					<a href="#" class="btn btn-primary">상세페이지</a>
				</div>
			</div>

			<!-- img -->
			<div class="card" style="width: 300px;">
				<img src="" class="card-img-top" alt="ex">
				<!-- img end  -->
				<div class="card-body">
					<h5 class="card-title">title</h5>
					<p class="card-text">text</p>
					<a href="#" class="btn btn-primary">상세페이지</a>
				</div>
			</div>
		</div>

		<div  class="mt-3 d-flex">

			<div>
				<p class="card_title fs-3">신규상담사</p>
			</div>
			<div class="mx-2 mt-1">
				<a class="card_title_sub fs-6" href="./main">NEW</a>
			</div>
		</div>


		<div class="justify-content-center" style="display: flex;">
			<!-- img -->
			<div class="card" style="width: 300px;">
				<img src="../resources/dog.jpeg" class="card-img-top" height="200px"
					alt="ex">
				<!-- img end  -->
				<div class="card-body">
					<h5 class="card-title">제휴사 이름</h5>



					<a href="#" class="btn btn-primary">상세페이지</a>
				</div>
			</div>

			<div style="margin-right: 10px"></div>

			<!-- img -->
			<div class="card" style="width: 300px;">
				<img src="" class="card-img-top" alt="ex">
				<!-- img end  -->
				<div class="card-body">
					<h5 class="card-title">title</h5>
					<p class="card-text">text</p>
					<a href="#" class="btn btn-primary">상세페이지</a>
				</div>
			</div>
		</div>
		<!-- margin-left: 20% -->
	</div>
</div>

<c:import url="./layout/footer.jsp"></c:import>