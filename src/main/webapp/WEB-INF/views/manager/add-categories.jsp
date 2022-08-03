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
			<h1>Add Category</h1>
			<sf:form action="${base }/admin/add-categories"
				modelAttribute="categories">
				<sf:hidden path="Id" />

				<div class="form-group">
					<label for="name">Name(required)</label>
					<sf:input path="name" autocomplete="off" type="text"
						class="form-control" id="name" placeholder="Name" />
				</div>

				<div class="form-group">
					<label for="description">Description (required)</label>
					<sf:textarea path="description" autocomplete="off" type="text"
						class="form-control summernote" id="description"
						placeholder="description" />
				</div>
				
				<div class="form-group">
					<label for="seo">Seo</label>
					<sf:textarea path="seo" autocomplete="off" type="text"
						class="form-control summernote" id="seo"
						placeholder="seo" />
				</div>
				<br />
				<button type="submit" class="btn btn-primary" onclick="saveCategory();">Save</button>
			</sf:form>
		</div>
	</div>

	<!-- end add Product -->

<script type="text/javascript">
		function saveCategory() {
			// javascript object.
			// data la du lieu ma day len action cua controller
			let data = {
					name : jQuery("#name").val(),
			};

			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : "/add-category-ajax",
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












