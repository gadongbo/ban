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

		<form method="post" action="${base }/cart/finish">

			<c:choose>
				<c:when test="${isLogined }">
					<div class="form-group">
						<label for="customerName">customerName</label> <input type="text"
							readonly value="${userLogined.username}" class="form-control"
							id="customerName" name="customerName"
							aria-describedby="customerName" placeholder="customerName">
					</div>

					<div class="form-group">
						<label for="customerAddress">customerAddress</label> <input
							type="text" class="form-control" id="customerAddress"
							name="customerAddress" aria-describedby="customerAddress"
							placeholder="customerAddress">
					</div>

					<div class="form-group">
						<label for="customerEmail">customerEmail</label> <input readonly
							value="${userLogined.email }" type="email" class="form-control"
							id="customerEmail" name="customerEmail"
							aria-describedby="emailCostomer" placeholder="customerEmail">
						<small id="emailHelp" class="form-text text-muted">We'll
							never share your email with anyone else</small>
					</div>
					<button type="submit" class="btn btn-primary" onclick="saveCart();" >Place order</button>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<label for="customerName">customerName</label> <input type="text"
							class="form-control" id="customerName" name="customerName"
							aria-describedby="customerName" placeholder="customerName">
					</div>

					<div class="form-group">
						<label for="customerAddress">customerAddress</label> <input
							type="text" class="form-control" id="customerAddress"
							name="customerAddress" aria-describedby="customerAddress"
							placeholder="customerAddress">
					</div>

					<div class="form-group">
						<label for="customerEmail">customerEmail</label> <input
							type="email" class="form-control" id="customerEmail"
							name="customerEmail" aria-describedby="emailCostomer"
							placeholder="customerEmail"> <small id="emailHelp"
							class="form-text text-muted">We'll never share your email
							with anyone else</small>
					</div>
					<button type="submit" class="btn btn-primary" onclick="saveCart();">Place order</button>
				</c:otherwise>
			</c:choose>


		</form>
		<table class="table table-striped " style="margin-top: 10px;">
			<thead>
				<tr>

					<th scope="col">ProductName</th>
					<th scope="col">Quality</th>
					<th scope="col">Price</th>
					<th scope="col">Total</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cart.cartItems}" var="cartItem">
					<tr>
						<td>${cartItem.productName }</td>
						<td>${cartItem.quanlity }</td>
						<td>${cartItem.priceUnit }</td>
						<td>${cartItem.total }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
		function saveCart() {
			// javascript object.
			// data la du lieu ma day len action cua controller
			let data = {
					productName : jQuery("#productName").val(),
			};

			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : "/cart-ajax",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					alert("Bạn đã đặt hàng thành công ");
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 

				}
			});
		}
	</script>


</body>
</html>













