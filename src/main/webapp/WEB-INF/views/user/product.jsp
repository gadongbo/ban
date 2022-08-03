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
	<div class="container">
		<h1 style="padding-left: 10px;">Products</h1>
		<div class="row py-3">
			<c:forEach items="${products }" var="product">
				<div class="col-lg-3 col-md-4 col-sm-6 mb-4">

					<div class="card">
						<img alt="" src="${base }/upload/${product.avatar}"
							class="card-img-top" style="width: 200px;">
						<div class="card-body">
							<h5 class="card-title">${product.title }</h5>
							<p class="card-text">${product.price }</p>
							<a href="detailProduct/${product.id}" class="btn btn-primary">Detail</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	

	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>

</body>
</html>












