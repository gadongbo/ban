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
			<div class="title">
				<h1>User</h1>
			</div>
			<!--end title -->

			<!-- products -->
			<div class="products">
				<form action="${base }/admin/user" method="get">
					<a class="btn btn-outline-primary mb-1"
						href="${base }/admin/add-user" role="button">Add New</a> <input
						type="text" name="keyword" />
					<button type="submit" value="Search">Search</button>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">UserName</th>
								<th scope="col">Password</th>
								<th scope="col">Email</th>
								<th scope="col">Status</th>
								<th scope="col">Control</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<c:forEach var="user" items="${users }" varStatus="loop">
									<th scope="row">${loop.index +1 }</th>
									<td>${user.username }</td>
									<td>${user.password }</td>
									<td>${user.email }</td>
									<
									<td><span id="_product_status_${user.id }"> <c:choose>
												<c:when test="${user.status }">
													<span class="badge badge-primary">Active</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-warning">InActive</span>
												</c:otherwise>
											</c:choose>
									</span></td>
									<td><a class="btn btn-primary " href="" role="button"
										style="font-size: 13px;"> Edit </a> <a role="button"
										class="btn btn-danger delete-product" href=""
										style="font-size: 13px;">Delete</a></td>
									<tr>
								</c:forEach>
						</tbody>
					</table>
					<a class="btn btn-primary btn-redirect" data-direct="prev" href="#"
						role="button">Back</a> <a class="btn btn-primary btn-redirect"
						data-direct="next" href="#" role="button">Next</a>
				</form>
				<!--end products -->
			</div>
		</div>
	</div>



</body>
</html>












