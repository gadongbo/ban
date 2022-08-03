<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- directive cua JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- menu-->


	<!-- menu-left -->

	<div class="menu-left">
		<ul>
			<li><a href="${base }/admin/index">Dashboard</a></li>
			<li><a href="${base }/admin/categories">Categories</a></li>
			<li><a href="${base }/admin/products">Products</a></li>
			<c:if test="${isAdmin }">
			<li><a href="${base }/admin/contact">Contact</a></li>
			</c:if>
			<li><a href="${base }/admin/saleOrder">SaleOrder</a></li>
			<li><a href="${base }/admin/user">Users</a></li>
		</ul>
	</div>
	<!-- end menu-left -->
