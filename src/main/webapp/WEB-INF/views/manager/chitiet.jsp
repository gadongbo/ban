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
			<h1>Chi tiet</h1>
			<sf:form action="${base }/admin/chitiet"
				modelAttribute="saleOrder" enctype="multipart/form-data">
			<sf:hidden path="id"/>
				<div class="form-group">
					<label for="saleOrder"></label>
					<sf:select path="saleOrder.id" class="form-control" id="saleOrder">
						<sf:options items="${saleOrder }" itemValue="id" itemLabel="name" />
					</sf:select>
				</div>
				
				<br />
				<a href="/manager/list-product" class="btn btn-secondary active"
					role="button" aria-pressed="true">Back to list</a>
				<button type="submit" class="btn btn-primary">Save product</button>
			</sf:form>
		</div>
	</div>

	<!-- end add Product -->



</body>
</html>












