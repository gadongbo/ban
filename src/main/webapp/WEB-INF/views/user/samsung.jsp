<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${projectTitle }</title>
<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- css, js -->
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
	
	<div class="content">
		<div class="container">
			<h4>Điện thoại Samsung</h4>

			<div class="row image-container">
				<div class="col-12 col-sm-6  col-md-3 bg-dark image">

					<div class="item-label">
						<span class="lb-img">Trả góp 0%</span>
					</div>
					<div class="content-img">
						<a href="${base }/samsunggalaxy"><img
							src="${base }/user/images/img8.jpg" alt=""></a>
					</div>
					<a href="${base }/samsunggalaxy" class="link"><h3>Samsung Galaxy S21
							</h3></a> <strong class="price">14.690.000₫</strong>
					<div class="item-rating">
						<p>
							<i class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i>
						</p>
						<p class="item-rating-total count">77</p>
					</div>
				</div>
				<div class="col-12 col-sm-6  col-md-3 bg-dark image">

					<div class="item-label">
						<span class="lb-img">Trả góp 0%</span>
					</div>
					<div class="content-img">
						<a href="../frontend/iphone12.html"><img
							src="${base }/user/images/img8.jpg" alt=""></a>
					</div>
					<a href="../frontend/iphone12.html" class="link"><h3>Samsung Galaxy S21
							</h3></a> <strong class="price">14.690.000₫</strong>
					<div class="item-rating">
						<p>
							<i class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i>
						</p>
						<p class="item-rating-total count">77</p>
					</div>
				</div>
				<div class="col-12 col-sm-6  col-md-3 bg-dark image">

					<div class="item-label">
						<span class="lb-img">Trả góp 0%</span>
					</div>
					<div class="content-img">
						<a href="../frontend/iphone12.html"><img
							src="${base }/user/images/img8.jpg" alt=""></a>
					</div>
					<a href="../frontend/iphone12.html" class="link"><h3>Samsung Galaxy S21
							</h3></a> <strong class="price">14.690.000₫</strong>
					<div class="item-rating">
						<p>
							<i class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i>
						</p>
						<p class="item-rating-total count">77</p>
					</div>
				</div>
				<div class="col-12 col-sm-6  col-md-3 bg-dark image">

					<div class="item-label">
						<span class="lb-img">Trả góp 0%</span>
					</div>
					<div class="content-img">
						<a href="../frontend/iphone12.html"><img
							src="${base }/user/images/img8.jpg" alt=""></a>
					</div>
					<a href="../frontend/iphone12.html" class="link"><h3>Samsung Galaxy S21
							</h3></a> <strong class="price">14.690.000₫</strong>
					<div class="item-rating">
						<p>
							<i class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i>
						</p>
						<p class="item-rating-total count">77</p>
					</div>
				</div>
				<div class="col-12 col-sm-6  col-md-3 bg-dark image">

					<div class="item-label">
						<span class="lb-img">Trả góp 0%</span>
					</div>
					<div class="content-img">
						<a href="../frontend/iphone12.html"><img
							src="${base }/user/images/img8.jpg" alt=""></a>
					</div>
					<a href="../frontend/iphone12.html" class="link"><h3>Samsung Galaxy S21
							</h3></a> <strong class="price">14.690.000₫</strong>
					<div class="item-rating">
						<p>
							<i class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i>
						</p>
						<p class="item-rating-total count">77</p>
					</div>
				</div>
				<div class="col-12 col-sm-6  col-md-3 bg-dark image">

					<div class="item-label">
						<span class="lb-img">Trả góp 0%</span>
					</div>
					<div class="content-img">
						<a href="../frontend/iphone12.html"><img
							src="${base }/user/images/img8.jpg" alt=""></a>
					</div>
					<a href="../frontend/iphone12.html" class="link"><h3>Samsung Galaxy S21
							</h3></a> <strong class="price">14.690.000₫</strong>
					<div class="item-rating">
						<p>
							<i class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i>
						</p>
						<p class="item-rating-total count">77</p>
					</div>
				</div>
				<div class="col-12 col-sm-6  col-md-3 bg-dark image">

					<div class="item-label">
						<span class="lb-img">Trả góp 0%</span>
					</div>
					<div class="content-img">
						<a href="../frontend/iphone12.html"><img
							src="${base }/user/images/img8.jpg" alt=""></a>
					</div>
					<a href="../frontend/iphone12.html" class="link"><h3>Samsung Galaxy S21
							</h3></a> <strong class="price">14.690.000₫</strong>
					<div class="item-rating">
						<p>
							<i class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i>
						</p>
						<p class="item-rating-total count">77</p>
					</div>
				</div>
				<div class="col-12 col-sm-6  col-md-3 bg-dark image">

					<div class="item-label">
						<span class="lb-img">Trả góp 0%</span>
					</div>
					<div class="content-img">
						<a href="../frontend/iphone12.html"><img
							src="${base }/user/images/img8.jpg" alt=""></a>
					</div>
					<a href="../frontend/iphone12.html" class="link"><h3>Samsung Galaxy S21
							</h3></a> <strong class="price">14.690.000₫</strong>
					<div class="item-rating">
						<p>
							<i class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i> <i
								class="icon-star fas fa-star"></i>
						</p>
						<p class="item-rating-total count">77</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- contact -->
	<jsp:include page="/WEB-INF/views/user/layout/lh.jsp"></jsp:include>
	<!--end  contact -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- end footer -->

	<!-- end content -->
</body>
</html>