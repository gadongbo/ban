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
	<!-- content -->
<div class="main">
<!-- main-product -->
  <div class="main-product">
    <!-- left -->
    <div class="left">
      <img src="${base }/user/images/img8.jpg" alt="">
    </div>      
    <!-- /left -->
    <!-- right -->
    <div class="right">
      <h3>Samsung Galaxy S21</h3>
      <strong class="price">14.690.000₫</strong>
      <p>Với những tính năng vượt trội như 3 camera, bộ nhớ<br>  lên tới 
        128GB, hứa hẹn sẽ mang đến những trải<br> nghiệm tuyệt vời đến người
        dùng
      </p>
       <a class="btn btn-warning" href="#">Add to cart</a>
    </div>
     <!-- right -->
  </div>
<!-- main-product -->
  <h3 class="sptt">Sản phẩm tương tự</h3>
  <div class="row">
    <div class ="col-12 col-sm-6  col-md-3 bg-dark image">
    
        <div class="item-label" ><span class="lb-img">Trả góp 0%</span></div>
        <div class="content-img">
        <a href="../frontend/iphone12.html"><img src="${base }/user/images/img11.jpg" alt=""></a>
        </div>
        <a href="../frontend/iphone12.html" class="link"><h3>Iphone12 Pro Max</h3></a>
        <strong class="price">23.690.000₫</strong>
        <div class="item-rating">
          <p>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
          </p>
          <p class="item-rating-total count">77</p>
        </div>
       </div>
       <div class ="col-12 col-sm-6  col-md-3 bg-dark image">

        <div class="item-label" ><span class="lb-img">Trả góp 0%</span></div>
        <div class="content-img">
        <a href="../frontend/iphone12.html"><img src="${base }/user/images/img11.jpg" alt=""></a>
        </div>
        <a href="../frontend/iphone12.html" class="link"><h3>Iphone12 Pro Max</h3></a>
        <strong class="price">23.690.000₫</strong>
        <div class="item-rating">
          <p>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
          </p>
          <p class="item-rating-total count">77</p>
        </div>
       </div>
       <div class ="col-12 col-sm-6  col-md-3 bg-dark image">

        <div class="item-label" ><span class="lb-img">Trả góp 0%</span></div>
        <div class="content-img">
        <a href="../frontend/iphone12.html"><img src="${base }/user/images/img11.jpg" alt=""></a>
        </div>
        <a href="../frontend/iphone12.html" class="link"><h3>Iphone12 Pro Max</h3></a>
        <strong class="price">23.690.000₫</strong>
        <div class="item-rating">
          <p>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
          </p>
          <p class="item-rating-total count">77</p>
        </div>
       </div>
       <div class ="col-12 col-sm-6  col-md-3 bg-dark image">

        <div class="item-label" ><span class="lb-img">Trả góp 0%</span></div>
        <div class="content-img">
        <a href="../frontend/iphone12.html"><img src="${base }/user/images/img11.jpg" alt=""></a>
        </div>
        <a href="../frontend/iphone12.html" class="link"><h3>Iphone12 Pro Max</h3></a>
        <strong class="price">23.690.000₫</strong>
        <div class="item-rating">
          <p>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
          </p>
          <p class="item-rating-total count">77</p>
        </div>
       </div>
       <div class ="col-12 col-sm-6  col-md-3 bg-dark image">

        <div class="item-label" ><span class="lb-img">Trả góp 0%</span></div>
        <div class="content-img">
        <a href="../frontend/iphone12.html"><img src="${base }/user/images/img11.jpg" alt=""></a>
        </div>
        <a href="../frontend/iphone12.html" class="link"><h3>Iphone12 Pro Max</h3></a>
        <strong class="price">23.690.000₫</strong>
        <div class="item-rating">
          <p>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
          </p>
          <p class="item-rating-total count">77</p>
        </div>
       </div>
       <div class ="col-12 col-sm-6  col-md-3 bg-dark image">

        <div class="item-label" ><span class="lb-img">Trả góp 0%</span></div>
        <div class="content-img">
        <a href="../frontend/iphone12.html"><img src="${base }/user/images/img11.jpg" alt=""></a>
        </div>
        <a href="../frontend/iphone12.html" class="link"><h3>Iphone12 Pro Max</h3></a>
        <strong class="price">23.690.000₫</strong>
        <div class="item-rating">
          <p>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
          </p>
          <p class="item-rating-total count">77</p>
        </div>
       </div>
       <div class ="col-12 col-sm-6  col-md-3 bg-dark image">

        <div class="item-label" ><span class="lb-img">Trả góp 0%</span></div>
        <div class="content-img">
        <a href="../frontend/iphone12.html"><img src="${base }/user/images/img11.jpg" alt=""></a>
        </div>
        <a href="../frontend/iphone12.html" class="link"><h3>Iphone12 Pro Max</h3></a>
        <strong class="price">23.690.000₫</strong>
        <div class="item-rating">
          <p>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
          </p>
          <p class="item-rating-total count">77</p>
        </div>
       </div>
       <div class ="col-12 col-sm-6  col-md-3 bg-dark image">

        <div class="item-label" ><span class="lb-img">Trả góp 0%</span></div>
        <div class="content-img">
        <a href="../frontend/iphone12.html"><img src="${base }/user/images/img11.jpg" alt=""></a>
        </div>
        <a href="../frontend/iphone12.html" class="link"><h3>Iphone12 Pro Max</h3></a>
        <strong class="price">23.690.000₫</strong>
        <div class="item-rating">
          <p>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
            <i class="icon-star fas fa-star"></i>
          </p>
          <p class="item-rating-total count">77</p>
        </div>
       </div>
  </div>
</div>
         
	<jsp:include page="/WEB-INF/views/user/layout/lh.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>

</body>
</html>












