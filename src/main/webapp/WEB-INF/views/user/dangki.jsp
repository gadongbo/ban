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
		<div class="container main-dangki">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h2 class="text-center">Đăng kí</h2>
        </div>
        <div class="panel-body">
            <div class="form-group">
              <label for="usr">Tên:</label>
              <input required="true" type="text" class="form-control" id="usr">
            </div>
            <div class="form-group">
              <label for="email">Email:</label>
              <input required="true" type="email" class="form-control" id="email">
            </div>
            <div class="form-group">
              <label for="birthday">Ngày sinh:</label>
              <input type="date" class="form-control" id="birthday">
            </div>
            <div class="form-group">
              <label for="pwd">Password:</label>
              <input required="true" type="password" class="form-control" id="pwd">
            </div>
            <div class="form-group">
              <label for="confirmation_pwd">Confirmation Password:</label>
              <input required="true" type="password" class="form-control" id="confirmation_pwd">
            </div>
            <div class="form-group">
              <label for="address">Địa chỉ:</label>
              <input type="text" class="form-control" id="address">
            </div>
            <button class="btn btn-success">Đăng kí</button>
        </div>
    </div>
</div>



	</div>
	<jsp:include page="/WEB-INF/views/user/layout/lh.jsp"></jsp:include>
	<!--end  contact -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
	
</body>
</html>












