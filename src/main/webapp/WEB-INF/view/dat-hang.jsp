<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>ThewayShop - Đặt hàng</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->     
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    
    <!-- Site CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">

  

</head>

<body>
   
     <!-- Start Main Top -->
    <div class="main-top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                <div class="text-slid-box">
                    <div id="offer-box" class="carouselTicker">
                        <ul class="offer-box">
                    
                      
                            <li>
                                <i class="fab fa-opencart"></i> Welcome To THEWAYSHOP
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> Nhập Code Để Được Giảm 20%: #DUCDEPTRAI  
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> Sale 10-20% Đồng Hồ Nam
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> Sale Cực Sốc Cho Đồng Hồ Nữ
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12">
                
                <div class="right-phone-box">
                    <p>Fax : <a href="#"> +84 359 806 602</a></p>
                </div>

                <div class="our-link">
                <ul>
			   <c:if test="${not empty myNguoidung}">
			   <security:authorize access="hasAnyRole('QUANLY')">  
                         <li class="nav-item ">
                            [QUẢN LÝ]
                        </li>
                         </security:authorize>
			    			<li>Xin chào, tài khoản <security:authentication property="principal.username" /></li>
			    			 <li><a href="${pageContext.request.contextPath}/dangxuat">Đăng xuất</a></li>
				</c:if>
				<c:if test="${empty myNguoidung}">
			    			
			    			 <li><a href="${pageContext.request.contextPath}/dangnhap">Đăng nhập</a></li>
				</c:if>
				<c:if test="${empty myNguoidung}">
			    			
			    			 <li><a href="${pageContext.request.contextPath}/dangky">Đăng ký</a></li>
				</c:if>
				</ul>
   
   

    
                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- MENU -->
     <c:if test="${not empty thongbao}">
        <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                      ${thongbao}
    	</div>
    </c:if>
    <header class="main-header">
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            
            <div class="container">

                <!-- LOGO -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/logo.png" class="logo" alt=""></a>
                </div>

                <!-- MENU -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}">Trang Chủ</a>
                        </li>
   						<li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/sanpham">Sản phẩm</a>
                        </li>
                        <security:authorize access="hasAnyRole('QUANLY','NGUOIDUNG')">  
                          <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/canhan">Cá nhân</a>
                        </li>
                         </security:authorize>
                        <security:authorize access="hasAnyRole('QUANLY')">  
                         <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/hoadon/list/">Quản lý hóa đơn</a>
                        </li>
                         </security:authorize>
                       <security:authorize access="hasAnyRole('QUANLY')">  
                       <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/nguoidung/list/1?theSearchHo=&theSearchTen=&theSearchSdt=&theSearchDiachi=">Quản lý người dùng</a>
                        </li>
                       </security:authorize>
                        
                        
                       
            </div>
  				<div class="attr-nav">
                    <ul>
                        <li class="search">
                            <a href="#"><i class="fa fa-search"></i></a>
                        </li>

                     
                       <li class="">
                            <a href="${pageContext.request.contextPath}/giohang"><i class="fa fa-shopping-bag"></i> Giỏ hàng</a>
                        </li>
                    </ul>
                </div>
                
               
            </div>
            
        
        </nav>
        
    </header>
     <!-- VIEW GIO HANG -->
                

    <!-- VIEW ICON SEARCH -->
    <div class="top-search " class="float-right">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
					<form action="${pageContext.request.contextPath}/sanpham/search" method="GET">
					     <input type="text" name = "theSearchName" class="form-control" placeholder="Tìm Kiếm"  onkeydown = "if (event.keyCode == 13)
					                        document.getElementById('btnSearch').click()"   >
					    <div class="col">
					     <button hidden="true" type="submit" id = "btnSearch" value="Search"  class="btn hvr-hover">Tìm kiếm</button>
					    </div>
					</form>
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>

    <!-- Start Cart  -->
    
    <div class="cart-box-main">
        <div class="container">

            <div class="row">
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3>Địa Chỉ Người Nhận</h3>
                        </div>
                        <form class="needs-validation" novalidate>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="firstName">Họ: </label>
                                    <input type="text" class="form-control" id="firstName"  value="${sessionScope.myNguoidung.ho}" disabled="disabled">
                                   
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Tên: </label>
                                    <input type="text" class="form-control" id="lastName" value="${sessionScope.myNguoidung.ten}"  disabled="disabled">
                                    
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="sdt">Số điện thoại: </label>
                                <input type="sdt" class="form-control" id="sdt" value="${sessionScope.myNguoidung.sdt}"  disabled="disabled">
                               
                            </div>
                            <div class="mb-3">
                                <label for="address">Địa Chỉ: </label>
                                <input type="text" class="form-control" id="address" value="${sessionScope.myNguoidung.diachi}"  disabled="disabled">
                               
                            </div>
                          

                            
                        </form>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="shipping-method-box">
                                <div class="title-left">
                                    <h3>Phương thức giao hàng</h3>
                                </div>
                                <div class="mb-4">
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption1" name="shipping-option" class="custom-control-input" checked="checked" type="radio">
                                        <label class="custom-control-label" for="shippingOption1">Giao Hàng Tiêu Chuẩn</label> 
                                        <span class="float-right font-weight-bold">Miễn Phí</span> 
                                    </div>
                                    <div class="ml-4 mb-2 small">(3-7 ngày)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption2" name="shipping-option" class="custom-control-input" type="radio">
                                        <label class="custom-control-label" for="shippingOption2">Giao Hàng Nhanh</label> 
                                        <span class="float-right font-weight-bold">Miễn phí</span> 
                                    </div>
                                    <div class="ml-4 mb-2 small">(2-4 business days)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption3" name="shipping-option" class="custom-control-input" type="radio">
                                        <label class="custom-control-label" for="shippingOption3">Giao Hàng Trong Ngày Mai</label> 
                                        <span class="float-right font-weight-bold">Miễn phí</span> 
                                    </div>
                                </div>
                            </div>
                        </div>
                         
                    </div>
                </div>
            </div>
 
            <div class="title-left">
                <h3>Giỏ Hàng</h3>
            </div>

             <!--TABLE-->
             <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Hình Ảnh</th>
                                    <th>Tên Sản Phẩm</th>
                                    <th>Gía</th>
                                    <th>Số Lượng</th>
                                    <th>Tổng Cộng</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                              <c:forEach var="map" items="${sessionScope.myGiohangs}">
                               <c:url var="chitietLink" value="${pageContext.request.contextPath}/sanpham/chitiet">
				                            <c:param name="sanphamId" value="${map.value.sanpham.id}" />
				                        </c:url>		
                                   <tr>
                                    <td class="thumbnail-img">
                                        <a href="${chitietLink}"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/images	/${map.value.sanpham.hinhanh}" alt="" /></a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="${chitietLink}">${map.value.sanpham.ten}</a>
                                    </td>
                                    <td class="price-pr">
                                       <p><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatNumber pattern="#,##0" value="${map.value.sanpham.gia}" /> VNĐ</p>
                                    </td>
                                    <td>
                                        <p>${map.value.soluong}</p>
                                    </td>
                                    <td class="total-pr">
                                         <p><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatNumber pattern="#,##0" value="${map.value.soluong * map.value.sanpham.gia}" /> VNĐ</p>
                                    </td>
                                   
                                </tr>
                   				</c:forEach>
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 col-lg-3">
                </div>

                <div class="col-md-6 col-lg-6">
                    <div class="order-box">
                        <div class="title-left">
                            <h3>Đơn Hàng Của Bạn</h3>
                        </div>
                        <div class="d-flex">
                            <h4>Tổng Tiền</h4>
                            <div class="ml-auto font-weight-bold"> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatNumber pattern="#,##0" value="${sessionScope.myTongtien1}" /> VNĐ</div></div>
                        </div>
                       
                        <hr class="my-1">
                        <div class="d-flex">
                            <h4>Thuế</h4>
                            <div class="ml-auto font-weight-bold"> 10% </div>
                        </div>
                        <div class="d-flex">
                            <h4>Phí Vận Chuyển</h4>
                            <div class="ml-auto font-weight-bold"> Miễn Phí </div>
                        </div>
                        <hr class="my-1">
                        <div class="d-flex gr-total">
                            <h5>Tổng Cộng</h5>
                            <div class="ml-auto h5"> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatNumber pattern="#,##0" value="${sessionScope.myTongtien2}" /> VNĐ</div> </div>
                        </div>
                        <hr> 
                    </div>
                    <div class="col-12 d-flex shopping-box"> 
                   
						   <a href="${pageContext.request.contextPath}/dathang/tienhanh"  onclick="if (!(confirm('Bạn có chắc muốn tiến hành đặt hàng không?'))) return false" class="ml-auto btn hvr-hover">Tiến hành đặt hàng</a> 
                    </div>
                </div>
                
                <div class="col-md-3 col-lg-3">
                </div>

                
            </div>

        </div>
    </div>



     <!-- Start Footer  -->
     <footer>
        <div class="footer-main">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 col-md-12 col-sm-12">
                        <div class="footer-link-contact">
                            <h4>THEWAYSHOP</h4>
                            <ul>
                                <li>
                                    <p><i class="fas fa-map-marker-alt"></i>Địa chỉ: 12 Nguyễn Văn Bảo, Phường 7, Quận Gò Vấp, Tp.HCM </p>
                                </li>
                                <li>
                                    <p><i class="fas fa-phone-square"></i>Điện thoại: <a href="tel:+84-359806602">+84 359 806 602</a></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-envelope"></i>Email: <a href="mailto:12345ddduc@gmail.com">12345ddduc@gmail.com</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>Về chúng tôi</h4>
                            <p>THEWAYSHOP là trang web bán đồng hồ với tầm nhìn chiến lược dài hạn luôn tuân thủ những cam kết với khách hàng.
                                THEWAYSHOP luôn cố gắng mang tới khách hàng sản phẩm thật - giá trị thật giúp khách hàng 
                                không còn lo lắng khi chọn mua sản phẩm tại đây.</p>
                            <ul>
                                <li><a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </div>


                    

                    <div class="col-lg-3 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>Thông tin chung</h4>
                            <ul>
                                <li><a href="#">Về chúng tôi</a></li>
                                <li><a href="#">Dịch vụ</a></li>
                                <li><a href="#">Điều khoản</a></li>
                                <li><a href="#">Chính sách bảo mật</a></li>
                                <li><a href="#">Thông tin Giao Hàng</a></li>
                            </ul>
                        </div>
                    </div>


                    <div class="col-lg-3 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>Hỗ trợ khách hàng</h4>
                            <p>Tư vấn mua hàng (miễn phí): <br> +84 359 806 602</p>
                            <p>Hỗ trợ thanh toán</p>
                            <div class="payment-icon">
                                <ul>
                                    <li><img class="img-fluid" src="images/payment-icon/1.png" alt=""></li>
                                    <li><img class="img-fluid" src="images/payment-icon/2.png" alt=""></li>
                                    <li><img class="img-fluid" src="images/payment-icon/3.png" alt=""></li>
                                    <li><img class="img-fluid" src="images/payment-icon/5.png" alt=""></li>
                                    <li><img class="img-fluid" src="images/payment-icon/7.png" alt=""></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer  -->

    

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
       
    
    <!-- ALL PLUGINS -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.superslides.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/inewsticker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootsnav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/images-loded.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/isotope.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/baguetteBox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/form-validator.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/contact-form-script.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>

</html>