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
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
</head>
<body>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>
	<!-- end menu -->

	<!-- lien he -->

	<div class="container px-4 px-lg-5 mt-5">

		<c:if test="${not empty thongbao }">
			<div class="alert alert-primary" role="alert">${thongbao }</div>
		</c:if>
		<!-- Normal -->
		<%-- 		<form action="${base }/contact" method="post"> --%>
		<!-- 			<div class="form-group"> -->
		<!-- 				<label for="txtEmail">Email address</label> <input type="email" -->
		<!-- 					class="form-control" id="txtEmail" name="txtEmail" -->
		<!-- 					aria-describedby="emailHelp" placeholder="Enter email"> <small -->
		<!-- 					id="emailHelp" class="form-text text-muted">We'll never -->
		<!-- 					share your email with anyone else.</small> -->
		<!-- 			</div> -->
		<!-- 			<div class="form-group"> -->
		<!-- 				<label for="txtContent">Content</label> <input type="text" -->
		<!-- 					class="form-control" id="txtContent" name="txtContent"> -->
		<!-- 			</div> -->
		<!-- 			<div class="form-group form-check"> -->
		<!-- 				<input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
		<!-- 				<label class="form-check-label" for="exampleCheck1">Check me -->
		<!-- 					out</label> -->
		<!-- 			</div> -->
		<!-- 			<button type="submit" class="btn btn-primary">Submit</button> -->
		<!-- 		</form> -->

		<!-- Spring form -->
		<sf:form action="${base }/contact" method="post"
			modelAttribute="contact" enctype="multipart/form-data">
			<div class="form-group">
				<label for="txtEmail">Email address</label>
				<sf:input path="txtEmail" type="email" class="form-control"
					id="txtEmail" name="txtEmail" aria-describedby="emailHelp" />
				<small id="emailHelp" class="form-text text-muted">We'll
					never share your email with anyone else.</small>
			</div>
			<div class="form-group">
				<label for="txtContent">Content</label>
				<sf:input path="txtContent" type="text" class="form-control"
					id="txtContent" name="txtContent" />
			</div>
			<div class="form-group form-check">
				<sf:checkbox path="chkCheckbox" class="form-check-input"
					id="exampleCheck1" />
				<label class="form-check-label" for="exampleCheck1">Check me
					out</label>
			</div>
			<div class="form-group">
				<label for="inputFile">Picture(Multiple)</label> <input
					id="inputFile" name="inputFile" type="file"
					class="form-control-file" multiple="multiple">
			</div>
			<button type="submit" class="btn btn-primary">Gửi</button>
			<!-- <button type="button" onclick="saveContact();"
				class="btn btn-primary ">Call Ajax</button> -->
		</sf:form>
	</div>

	<!-- /lien he -->

	<!-- contact -->
	<jsp:include page="/WEB-INF/views/user/layout/lh.jsp"></jsp:include>
	<!--end  contact -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	<!-- end footer -->
	<script type="text/javascript">
		 function saveContact() {
			// javascript object.
			// data la du lieu ma day len action cua controller
			let data = {
				txtEmail : jQuery("#txtEmail").val(), // lay theo id
				txtContent : jQuery("#txtContent").val(), // lay theo id
			};

			// $ === jQuery
			// json == javascript object
			jQuery.ajax({
				url : "/contact-ajax",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json", // kieu du lieu tra ve tu controller la json
				success : function(jsonResult) {
					alert("Chuc mung! da luu thanh cong dia chi email "
							+ jsonResult.message.txtEmail);
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 

				}
			});
		} 
		
	</script>
</body>
</html>












