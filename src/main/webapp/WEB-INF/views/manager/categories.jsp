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
			<div class="title">
				<h1>Categories</h1>
			</div>
			<!--end title -->

			<!-- products -->
			<div class="products">
				<form action="${base }/admin/categories" method="get">
					<a class="btn btn-outline-primary mb-1"
						href="${base }/admin/add-categories" role="button">Add New</a> <input
						type="text" name="keyword" />
					<button type="submit" value="Search">Search</button>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Name</th>
								<th scope="col">Description</th>
								<th scope="col">Status</th>
								<th scope="col">Action</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<c:forEach var="category" items="${categories }"
									varStatus="loop">
									<th scope="row">${loop.index +1 }</th>
									<td>${category.name }</td>
									<td>${category.description }</td>
									<td><span id="_product_status_${category.id }"> <c:choose>
												<c:when test="${category.status }">
													<span class="badge badge-primary">Active</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-warning">InActive</span>
												</c:otherwise>
											</c:choose>
									</span></td>
									<td><a class="btn btn-primary "
										href="${base }/admin/edit-categories/${category.seo}"
										role="button" style="font-size: 13px;"> Edit </a>
										<button type="button" style="font-size: 13px;"
											class="btn btn-danger"
											onclick="deleteCategory(${category.id});">Delete</button>
									</td>
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

	<script type="text/javascript">
function deleteCategory(id){
	const isConfirm = window.confirm('Bạn có chắc muốn xóa category này?')
	if(!isConfirm) return
	let data = {
			id: id,// lay theo id
	};
	jQuery.ajax({
		url: "/removeCategory/" +id,
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		dataType: "json", // kieu du lieu tra ve la json
		success: function(jsonResult){
			console.log(JsonResult)
			var arr = document.querySelectorAll('tr')
			arr.forEach(x=>{if(x.getAttribute('data-id')==id)x.remove()})
		},
		error: function(jqXhr, textStatus, errorMessage){
			
		}
	});
}
</script>
</body>
</html>












