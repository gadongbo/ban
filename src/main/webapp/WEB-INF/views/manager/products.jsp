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
				<h1>Products</h1>
			</div>
			<!--end title -->
			<!-- products -->
			<div class="products">
				<form action="${base }/admin/products" method="get">
					<a class="btn btn-outline-primary mb-1"
						href="${base }/admin/add-products" role="button">Add New</a> <input
						type="text" name="keyword" />
					<button type="submit" value="Search">Search</button>

					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Title</th>
								<th scope="col">Price</th>
								<th scope="col">Category</th>
								<th scope="col">Status</th>
								<th scope="col">Avatar</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${products }" var="product" varStatus="loop">
								<tr>
									<th scope="row">${loop.index +1 }</th>
									<td>${product.title }</td>
									<td>${product.price }</td>
									<td>${product.categories.name }</td>
									<td><span id="_product_status_${product.id }"> <c:choose>
												<c:when test="${product.status }">
													<span class="badge badge-primary">Active</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-warning">InActive</span>
												</c:otherwise>
											</c:choose>
									</span></td>
									<td><img class="picture" alt=""
										src="${base }/upload/${product.avatar}" style="width: 70px;"></td>
									<td><a class="btn btn-primary edit-product"
										href="${base }/admin/edit-products/${product.seo}"
										role="button" style="font-size: 13px;"> Edit </a>
										<button type="button" style="font-size: 13px;"
											class="btn btn-danger" onclick="deleteProduct(${product.id});">Delete</button></td>
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
		<!--end content -->
		<!--end products -->
	</div>
	// chạy thử đi em
	<script type="text/javascript">
	function deleteProduct(id){
		
		/* console.log(id)
		console.log(123); */
		
		 const isConfirm = window.confirm('Bạn có chắc muốn xóa sản phẩm này?')
		if(!isConfirm) return
		let data = {
				id: id,// lay theo id
		};
		jQuery.ajax({
			url : "/removeProduct/" +id,
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),
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












