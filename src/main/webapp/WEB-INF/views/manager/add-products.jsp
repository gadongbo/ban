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

	<!-- header -->
	<jsp:include page="/WEB-INF/views/manager/layout/header.jsp"></jsp:include>
	<!-- end header -->


	<!-- add Product -->

	<div class="container-fuild main">
		<!-- menu -->
		<jsp:include page="/WEB-INF/views/manager/layout/menu.jsp"></jsp:include>
		<!-- end menu -->
		<!-- Spring form -->
		<div class="content col-9">
			<h1>Add Products</h1>
			<sf:form action="${base }/admin/add-products"
				modelAttribute="product" enctype="multipart/form-data">
			<sf:hidden path="id"/>
				<div class="form-group">
					<label for="category">Category(required)</label>
					<sf:select path="categories.id" class="form-control" id="category">
						<sf:options items="${categories }" itemValue="id" itemLabel="name" />
					</sf:select>
				</div>
				<div class="form-group">
					<label for="title">Title(required)</label>
					<sf:input path="title" autocomplete="off" type="text"
						class="form-control" id="title" placeholder="Title" />
				</div>

				<div class="form-group">
					<label for="price">Price(required)</label>
					<sf:input path="price" autocomplete="off" type="number"
						class="form-control" id="price" placeholder="Price" />
				</div>

				<div class="form-group">
					<label for="priceSale">Price Sale(required)</label>
					<sf:input path="priceSale" autocomplete="off" type="number"
						class="form-control" id="priceSale" placeholder="Price Sale" />
				</div>

				<div class="form-group">
					<label for="short_description">Description (required)</label>
					<sf:textarea path="shortDes" autocomplete="off" type="number"
						class="form-control" id="shortDes" placeholder="Short Des" />
				</div>

				<div class="form-group">
					<label for="detail_description">Description (required)</label>
					<sf:textarea class="ckeditor" name="editor" path="details" autocomplete="off" type="number"
						 id="detail_description"
						placeholder="Details" />
				</div>

				<div class="form-group form-check">
					<sf:checkbox path="isHot" class="form-check-input" id="isHot" />
					<label class="form-check-label" for="isHot">Is Hot Product?</label>
				</div>

				<div class="form-group">
					<label for="fileProductAvatar">Avatar</label> <input
						id="fileProductAvatar" name="productAvatar" type="file"
						class="form-control-file">
				</div>

				<div class="form-group">
					<label for="fileProductPictures">Picture(Multiple)</label> <input
						id="fileProductPictures" name="productPictures" type="file"
						class="form-control-file" multiple="multiple">
				</div>
				
				<br />
				<div class="form-group">
					<label for="createdDate">Created date:</label>
					<sf:input path="createdDate" />
				</div>
				<a href="/admin/products" class="btn btn-secondary active"
					role="button" aria-pressed="true">Back to list</a>
				<button type="submit" class="btn btn-primary" onclick="save();">Save product</button>
			</sf:form>
		</div>
	</div>

	<!-- end add Product -->
<script type="text/javascript">
		function save() {
			// javascript object.
			// data la du lieu ma day len action cua controller
			let data = {
					title : jQuery("#title").val(),
			};

			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : "/add-products-ajax",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					alert(" SUCCESS ");
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 

				}
			});
		}
	</script>


</body>
</html>












