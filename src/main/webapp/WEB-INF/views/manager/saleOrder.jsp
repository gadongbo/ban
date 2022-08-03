<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${projectTitle }</title>
<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>


<!-- css, js -->
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/manager/layout/js.jsp"></jsp:include>
</head>
<body>
	<script src="${base}/manager/js/product.js" defer></script>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/manager/layout/header.jsp"></jsp:include>
	<!-- end header -->
	<div class="container-fuild main">
		<!-- menu -->
		<jsp:include page="/WEB-INF/views/manager/layout/menu.jsp"></jsp:include>
		<!-- end menu -->
		<div class="content">

			<!-- title -->


			<!--end title -->

			<!-- products -->
			<div class="products">
				<form action="${base }/admin/saleOrder" method="get">
					<input type="text" name="keyword"  style="margin-top: 10px;"/>
					<button type="submit" value="Search">Search</button>
					<div class="title">
						<h1>Danh sách hoá đơn</h1>

					</div>

					<table class="table table-striped">
						<thead>
							<tr>

								<th scope="col">code</th>
								<th scope="col">Name Customer</th>
								<th scope="col">Address</th>
								<th scope="col">Total</th>
								<th scope="col">Control</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${saleOrder }" var="saleoder">
								<tr>

									<td>${saleoder.code }</td>
									<td>${saleoder.customerName }</td>
									<td>${saleoder.customerAddress }</td>
									<td>${saleoder.total }</td>


									<td><a class="btn btn-primary edit-product"
										href="${base }/admin/chitiet" role="button"
										style="font-size: 13px;">Detail </a>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a class="btn btn-primary btn-redirect" data-direct="prev" href="#"
						role="button">Back</a> <a class="btn btn-primary btn-redirect"
						data-direct="next" href="#" role="button">Next</a>
				</form>
			</div>
			<!--end products -->
		</div>
	</div>





</body>
</html>












