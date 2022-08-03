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

	<!-- Support -->

	<div class="hotro" style="margin-top: 50px;">
		<div class="container">
			${thongbao }
			<c:if test="${not empty thongbao }">
				<div class="alert alert-primary" role="alert">${thongbao }</div>
			</c:if>
			<h4>Chúng tôi đến để đem lại sự hài lòng cho các bạn! chúng tôi
				sẽ phản hồi trong vòng 24 giờ tới</h4>
			<div class="_form">
				<h5>*Hãy chọn vấn đề bên dưới nhé*</h5>
				<sf:form action="${base }/support" method="post" modelAttribute="support">
					<div class="form-group ">

						<select class="form-control list" >
							<option>Chat với Điện thoại giá rẻ</option>
							<option>Bảo hành</option>
							<option>Bảo hiểm</option>
							<option>Chat với nhà bán</option>
							<option>Đặt hàng</option>
						</select>
					</div>
					<div class="form-group">
						<sf:input type="text" class="form-control list"
							id="txtVanDe" name="txtVanDe" path = "txtVanDe"
							placeholder="Vấn đề hỗ trợ chi tiết"/>
					</div>
					<div class="form-group">
						<label for="txtEmail">Địa chỉ email của bạn*</label> <sf:input path="txtEmail" 
							type="email" class="form-control list" id="txtEmail"
							name="txtEmail" placeholder="Nhập địa chỉ email"/>
					</div>
					<div class="form-group">
						<label for="">Số điện thoại*</label>
						<sf:input type="text" id="txtDienThoai" name="txtDienThoai" path = "txtDienThoai"
							class="form-control list" placeholder="Nhập số điện thoại"/>
					</div>

					<div class="form-group">
						<label for="">Mã đơn hàng</label> <sf:input type="text"
							id="txtCode" name="txtCode" path = "txtCode"
							class="form-control list" placeholder="Mã đơn hàng(nếu có)"/>
					</div>
					<div class="form-group">
						<label for="">Tiêu đề*</label> <sf:input type="text" 
						id="txtTitle" name="txtTitle" path = "txtTitle"
							class="form-control list" placeholder="Nhập tiêu đề"/>
					</div>
					<div class="form-group">
						<label for="">Nội dung</label> <sf:input type="text" 
						id="txtContent" name="txtContent" path = "txtContent"
							class="form-control list"
							placeholder="Mô tả chi tiết vấn đề của bạn"/>
					</div>
					<div class="_error">Vui lòng nhập nội dung của bạn*</div>
					
						<button type="submit" class="btn btn-primary">Gửi</button>
						<!-- <button type="button" onclick="saveSupport();" class="btn btn-primary">Call Ajax</button> -->
					</sf:form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function saveSupport(){
		// javascript object.
		// data la du lieu ma day len action cua controller
		let data = {
			txtEmail: jQuery("#txtEmail").val(), // lay theo id
			txtContent: jQuery("#txtContent").val(), // lay theo id
		};
		
		// $ === jQuery
		// json == javascript object
		jQuery.ajax({
			url : "/support-ajax",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(data),

			dataType : "json", // kieu du lieu tra ve tu controller la json
			success : function(jsonResult) {
				alert("Chuc mung! da luu thanh cong dia chi email " + jsonResult.message.txtEmail);
			},
			error : function(jqXhr, textStatus, errorMessage) { // error callback 
				
			}
		});
	}
	</script>
</body>
</html>












