<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${projectTitle }</title>
<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- css, js -->
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</head>
<body>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
	<!-- end menu -->
	<div class="container" style="margin-top: 0px;">
		<div class="row">
			<!-- 9cot -->
			<div class="col-lg-9 col-xl-9 col-md-9 col-sm-12">
				<!-- slide -->
				<!-- slide -->
				<div id="slideshow" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#slideshow" data-slide-to="0" class="active"></li>
						<li data-target="#slideshow" data-slide-to="1"></li>
						<li data-target="#slideshow" data-slide-to="2"></li>
						<li data-target="#slideshow" data-slide-to="3"></li>
					</ul>
					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="${base }/user/images/img1.png"
								alt="Iphone">

						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="${pageContext.servletContext.contextPath}/user/images/img2.png"
								alt="Samsung">

						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="${pageContext.servletContext.contextPath}/user/images/img3.png"
								alt="Ipad">

						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="${pageContext.servletContext.contextPath}/user/images/img4.jpg"
								alt="VIVO">

						</div>
					</div>
					<!-- Left and right controls -->
					<a class="gotoBtn carousel-control-prev" href="#slideshow"
						data-slide="prev"> <span class="carousel-control-prev-icon"></span>
					</a> <a class="gotoBtn carousel-control-next" href="#slideshow"
						data-slide="next"> <span class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
			<div class="col-lg-3 col-xl-3 col-md-3 col-sm-12">
				<aside class="sticky row">
					<!-- category -->
					<!-- box-right-title: dat ten -->
					<h5 class="box-right-title hot-sale">HOT SALE</h5>
					<div class="card">
						<!-- 
            bootstrap: card, list-group,list-group-fuild, list-group ,
             -->
						<ul class="list-group list-group-fluid category-box content-sale">
							<div class="row">
								<li
									class="list-group-item col-lg-6 col-md-6  col-sm-12  aside-item">
									<a href="../frontend/iphone12.html" class="title">Sắm ngay
										Iphone giảm 3 triệu đồng</a> <img class="hot-sale-img"
									src="${pageContext.servletContext.contextPath}/user/images/img1.png"
									alt="">

								</li>
								<li
									class="list-group-item col-lg-6 col-md-6 col-sm-12 aside-item">
									<a href="../frontend/samsungglaxy.html" class="title">
										Samsung giảm 10% chỉ có hôm nay</a> <img class="hot-sale-img"
									src="${pageContext.servletContext.contextPath}/user/images/img2.png"
									alt="">
								</li>
							</div>
							<div class="row">
								<li
									class="list-group-item col-lg-6 col-md-6 col-sm-12 aside-item">
									<a href="../frontend/xiaomict.html" class="title">Số lượng
										có hạn. Hãy nhanh tay!</a> <img class="hot-sale-img"
									src="${pageContext.servletContext.contextPath}/user/images/img3.png"
									alt="">
								</li>
								<li
									class="list-group-item col-lg-6 col-md-6 col-sm-12 aside-item">
									<a href="../frontend/oppo_reno5.html" class="title">Sắm
										ngay Oppo, lướt web thả ga</a> <img class="hot-sale-img"
									src="${pageContext.servletContext.contextPath}/user/images/img4.jpg"
									alt="">
								</li>

							</div>

						</ul>
					</div>

					<!-- /category -->
				</aside>
				<aside class="sticky row">
					<!-- category -->
					<!-- box-right-title: dat ten -->
					<h5 class="box-right-title quangcao">QUẢNG CÁO</h5>
					<div class="card">
						<!-- 
            bootstrap: card, list-group,list-group-fuild, list-group ,
             -->
						<ul
							class="list-group list-group-fluid category-box quang-cao-content">
							<div class="row">
								<li class="list-group-item col-lg-12 aside-item"><a
									href="../frontend/laptop.html" class="title">Mua Iphone có
										cơ hội trúng laptop</a> <img class="hot-sale-img"
									src="${pageContext.servletContext.contextPath}/user/images/qc.jpg"
									alt=""></li> ``
							</div>
						</ul>
					</div>

					<!-- /category -->
				</aside>
			</div>
			<!-- content -->
			<div class="content">
				<div class="container-fluid">
					<h4>Điện thoại bán chạy nhất</h4>

					<div class="row image-container">
						<c:forEach var="product" items="${products }">
							<div class="col-12 col-sm-6  col-md-3 image">
								<div class="item-label">
									<span class="lb-img">Trả góp 0%</span>
								</div>
								<div class="content-img">
									<a href="/detailProduct/${product.id}"><img
										src="${base}/upload/${product.avatar}" alt=""></a>
								</div>
								<a href="/detailProduct/${product.id}" class="link"><h3>${product.title }</h3>
								</a> <strong class="price">${product.price }</strong>
								<div class="item-rating">
									<p>
										<i class="icon-star fas fa-star"></i> <i
											class="icon-star fas fa-star"></i> <i
											class="icon-star fas fa-star"></i> <i
											class="icon-star fas fa-star"></i> <i
											class="icon-star fas fa-star"></i>
									</p>
									<p class="item-rating-total count">90</p>
								</div>
							</div>
						</c:forEach>

					</div>


				</div>
				<h4 class="phukien">Phụ kiện bán chạy nhất</h4>

				<div class="row image-container">
					<div class="col-12 col-sm-6 col-md-3 bg-primary image">
						<div class="item-label">
							<span class="lb-img">Trả góp 0%</span>
						</div>
						<div class="content-img">
							<a href="../frontend/pk.html"><img
								src="${pageContext.servletContext.contextPath}/user/images/pk1.jpg"
								alt=""></a>
						</div>
						<a href="../frontend/pk.html" class="link"><h3>Pin sạc dự
								phòng Polymer 1000mAh</h3></a> <strong class="price">250.000₫</strong>
						<div class="item-rating">
							<p>
								<i class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i>
							</p>
							<p class="item-rating-total count">140</p>
						</div>
					</div>
					<div class="col-12 col-sm-6  col-md-3 bg-secondary image">
						<div class="item-label">
							<span class="lb-img">Trả góp 0%</span>
						</div>
						<div class="content-img">
							<a href="../frontend/pk.html"><img
								src="${pageContext.servletContext.contextPath}/user/images/pk2.jpg"
								alt=""></a>
						</div>
						<a href="../frontend/pk.html" class="link"><h3>Pin sạc dự
								phòng 8000mAh AL70</h3></a> <strong class="price">140.000₫</strong>
						<div class="item-rating">
							<p>
								<i class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i>
							</p>
							<p class="item-rating-total count">100</p>
						</div>
					</div>
					<div class="col-12 col-sm-6 col-md-3 bg-danger image">
						<div class="item-label">
							<span class="lb-img">Trả góp 0%</span>
						</div>
						<div class="content-img">
							<a href="../frontend/pk.html"><img
								src="${pageContext.servletContext.contextPath}/user/images/pk3.jpg"
								alt=""></a>
						</div>
						<a href="../frontend/pk.html" class="link"><h3>Pin sạc dự
								phòng Y65 1000mAh</h3></a> <strong class="price">200.000₫</strong>
						<div class="item-rating">
							<p>
								<i class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i>
							</p>
							<p class="item-rating-total count">20</p>
						</div>
					</div>
					<div class="col-12 col-sm-6  col-md-3 bg-success image">
						<div class="item-label">
							<span class="lb-img">Trả góp 0%</span>
						</div>
						<div class="content-img">
							<a href="../frontend/pk.html"><img
								src="${pageContext.servletContext.contextPath}/user/images/pk4.jpg"
								alt=""></a>
						</div>
						<a href="../frontend/pk.html" class="link"><h3>Pin sạc dự
								phòng JP195 7.500mAh</h3></a> <strong class="price">120.000₫</strong>
						<div class="item-rating">
							<p>
								<i class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i> <i
									class="icon-star fas fa-star"></i>
							</p>
							<p class="item-rating-total count">97</p>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>
	<!-- end content-fluid -->

	</div>

	<!-- /content -->

	<!-- contact -->
	<jsp:include page="/WEB-INF/views/user/layout/lh.jsp"></jsp:include>
	<!--end  contact -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>












