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


	<jsp:include page="/WEB-INF/views/user/layout/menu.jsp"></jsp:include>


	<div class="container-fuild main">
		<div class="login-form">
			<h2 class="text-center">Log in</h2>
			<form method="POST" action="/perform_login" class="form-signin">
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }" />

				<c:if test="${not empty param.login_error }">
					<div class="alert alert-danger" role="alert">Login attempt
						was not successful, try again!</div>
				</c:if>
				<div class="form-group">
					<input type="text" class="form-control" name="username"
						placeholder="Username" required="required">
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control"
						placeholder="Password" required="required">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block login-text">Log
						in</button>
				</div>
				<div class="clearfix">
					<label class="float-left form-check-label"> <input
						type="checkbox"> Remember me
					</label> <a href="#" class="float-right">Forgot Password?</a>

				</div>
			</form>
			<p class="text-center">
				<a href="#">Create an Account</a>
			</p>
		</div>



	</div>
	<jsp:include page="/WEB-INF/views/user/layout/lh.jsp"></jsp:include>
	<!--end  contact -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	
</body>
</html>












