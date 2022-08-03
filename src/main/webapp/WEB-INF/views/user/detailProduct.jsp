<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- directive SPRING-FORM -->

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
	<div class="main">
		<div class="main-product">
			<div class="left">

				<img alt="" src="${base }/upload/${product.avatar}"
					style="width: 400px" />
			</div>
			<div class="right">
				<div class="detail_product">
					<h3>${product.title }</h3>
					<p>${product.details }</p>
					<p>
						Price:<span> ${product.price }</span>
					</p>
					
					
					<a class="btn btn-warning" href="#"
						onclick="addToCart(${product.id},1)" style="margin-left: 7px;">Add to cart</a>


				</div>
			</div>
		</div>
		<h3 class="sptt" style="color: rgb(226, 103, 154);">Sản phẩm
			tương tự</h3>
		<div class="row">
			<div class="col-12 col-sm-6  col-md-3 bg-primary image">
				<div class="item-label">
					<span class="lb-img">Trả góp 0%</span>
				</div>
				<div class="content-img">
					<a href="../frontend/oppo_reno5.html"><img
						src="${base }/user/images/img6.jpg" alt=""></a>
				</div>
				<a href="../frontend/oppo_reno5.html" class="link"><h3>OPPO
						Reno5</h3></a> <strong class="price">8.690.000₫</strong>
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
			<div class="col-12 col-sm-6  col-md-3 bg-primary image">
				<div class="item-label">
					<span class="lb-img">Trả góp 0%</span>
				</div>
				<div class="content-img">
					<a href="../frontend/oppo_reno5.html"><img
						src="${base }/user/images/img6.jpg" alt=""></a>
				</div>
				<a href="../frontend/oppo_reno5.html" class="link"><h3>OPPO
						Reno5</h3></a> <strong class="price">8.690.000₫</strong>
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
			<div class="col-12 col-sm-6  col-md-3 bg-primary image">
				<div class="item-label">
					<span class="lb-img">Trả góp 0%</span>
				</div>
				<div class="content-img">
					<a href="../frontend/oppo_reno5.html"><img
						src="${base }/user/images/img6.jpg" alt=""></a>
				</div>
				<a href="../frontend/oppo_reno5.html" class="link"><h3>OPPO
						Reno5</h3></a> <strong class="price">8.690.000₫</strong>
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
			<div class="col-12 col-sm-6  col-md-3 bg-primary image">
				<div class="item-label">
					<span class="lb-img">Trả góp 0%</span>
				</div>
				<div class="content-img">
					<a href="../frontend/oppo_reno5.html"><img
						src="${base }/user/images/img6.jpg" alt=""></a>
				</div>
				<a href="../frontend/oppo_reno5.html" class="link"><h3>OPPO
						Reno5</h3></a> <strong class="price">8.690.000₫</strong>
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
			<div class="col-12 col-sm-6  col-md-3 bg-primary image">
				<div class="item-label">
					<span class="lb-img">Trả góp 0%</span>
				</div>
				<div class="content-img">
					<a href="../frontend/oppo_reno5.html"><img
						src="${base }/user/images/img6.jpg" alt=""></a>
				</div>
				<a href="../frontend/oppo_reno5.html" class="link"><h3>OPPO
						Reno5</h3></a> <strong class="price">8.690.000₫</strong>
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
			<div class="col-12 col-sm-6  col-md-3 bg-primary image">
				<div class="item-label">
					<span class="lb-img">Trả góp 0%</span>
				</div>
				<div class="content-img">
					<a href="../frontend/oppo_reno5.html"><img
						src="${base }/user/images/img6.jpg" alt=""></a>
				</div>
				<a href="../frontend/oppo_reno5.html" class="link"><h3>OPPO
						Reno5</h3></a> <strong class="price">8.690.000₫</strong>
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
			<div class="col-12 col-sm-6  col-md-3 bg-primary image">
				<div class="item-label">
					<span class="lb-img">Trả góp 0%</span>
				</div>
				<div class="content-img">
					<a href="../frontend/oppo_reno5.html"><img
						src="${base }/user/images/img6.jpg" alt=""></a>
				</div>
				<a href="../frontend/oppo_reno5.html" class="link"><h3>OPPO
						Reno5</h3></a> <strong class="price">8.690.000₫</strong>
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
			<div class="col-12 col-sm-6  col-md-3 bg-primary image">
				<div class="item-label">
					<span class="lb-img">Trả góp 0%</span>
				</div>
				<div class="content-img">
					<a href="../frontend/oppo_reno5.html"><img
						src="${base }/user/images/img6.jpg" alt=""></a>
				</div>
				<a href="../frontend/oppo_reno5.html" class="link"><h3>OPPO
						Reno5</h3></a> <strong class="price">8.690.000₫</strong>
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
		</div>
	</div>

	<script type="text/javascript">
		addToCart = function(productId,quality) {

			let data = {
				productId : productId,
				quanlity : quality
			};

			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : "/cart/add",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					let totalItems = jsonResult.totalItems;
					$("#totalCartItemId").html(totalItems);
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 

				}
			});
		}
		
	</script>


	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
</body>
</html>












