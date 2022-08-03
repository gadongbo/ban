<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-branch" href="#"> <img
		src="${pageContext.servletContext.contextPath}/user/images/logo.png"
		height="50">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto danhmuc">
			<li class="nav-item active"><a class="nav-link" href="${base }/index">Trang
					chủ <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Giới thiệu</a>
			</li>
			<li class="nav-item dropdown sanpham"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Sản phẩm </a>
				<div class="dropdown-menu " aria-labelledby="navbarDropdown">
					<a class="dropdown-item product" href="${base }/iphone">Iphone</a>
					<a class="dropdown-item product" href="${base }/samsung">Samsung</a>
					<a class="dropdown-item product" href="../frontend/oppo.html">Oppo</a>
					<a class="dropdown-item product" href="../frontend/xiaomi.html">Xiaomi</a>

					<div class="dropdown-divider"></div>
					<a class="dropdown-item product"
						href="../frontend/phukiendienthoai.html">Phụ kiện điện thoại</a>
				</div></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Tin
					tức</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="${base }/contact">Liên
					hệ</a></li>
			<c:if test="${isLogined }">
          	<a class="nav-link disabled" href="#">${userLogined.email }</a>
          </c:if>

		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Tìm kiếm sản phẩm" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
		<li class="nav-item login"><a
			class="nav-link disabled menu-right" href="${base }/dangki">Đăng
				kí</a></li>

		<li class="nav-item login"><a
			class="nav-link disabled menu-right" href="${base }/login">Login</a>
		</li>
		<form class="d-flex" action="${base }/cart/view">
			<button class = "btn btn-yellow" type="submit">
				<i class="fas fa-shopping-cart"></i>
				
				<span id = "totalCartItemId" class="badge bg-dark text-white ms-1 rounded-pill" >${totalItems }</span>
			</button>
		</form>
				
				
	</div>
</nav>