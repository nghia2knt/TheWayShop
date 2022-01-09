<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>ThewayShop - Chi tiết sản phẩm</title>
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
   						<li class="nav-item  active">
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

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Chi Tiết Sản Phẩm</h2>
                    <security:authorize access="hasAnyRole('QUANLY')">  
                                 	
 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Chỉnh sửa thông tin</button>
										<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalLabel">Thay đổi các thông tin:</h5>
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										          <span aria-hidden="true">&times;</span>
										        </button>
										      </div>
										      <div class="modal-body">
										        <form:form accept-charset="UTF-8"  method="POST" action="${pageContext.request.contextPath}/sanpham/luusanpham" modelAttribute="sanpham">
										        <form:hidden path="id" />
										          <div class="form-group">
										          
										          <label for="message-text" class="col-form-label">Tên:</label>
										            <form:input type="text"  class="form-control" id="recipient-ten" value="${sanpham.ten}" name="sanphamTen" path="ten"/>
										           <label for="message-text"  class="col-form-label">Loại:</label>
										            <form:input type="text" class="form-control" id="recipient-loai" value="${sanpham.loai}" name="sanphamLoai" path="loai"/>
										            <label for="message-text"  class="col-form-label">Giá:</label>
										            <form:input type="text"  class="form-control" id="recipient-gia" value="${sanpham.gia}" name="sanphamGia" path="gia"/>
										            <label for="message-text" class="col-form-label">Số lượng:</label>
										            <form:input type="text" class="form-control" id="recipient-soluong" value="${sanpham.soluong}" name="sanphamSoluong" path="soluong"/>
										            <label for="message-text"  class="col-form-label">Hình ảnh:</label>
										            <form:input type="text" class="form-control" id="recipient-hinhanh" value="${sanpham.hinhanh}" name="sanphamHinhanh" path="hinhanh"/>
										          </div>
										          <button type="submit" value="Luu"  class="btn btn-primary">Thay đổi</button>
										        </form:form>
										      </div>
										      
										    </div>
										  </div>
										</div>
								   </security:authorize>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop Detail  -->
<form action="${pageContext.request.contextPath}/giohang/add/">
    <div class="shop-detail-box-main">
        <div class="container">

            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6">
                    <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">

                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active"> <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/${sanpham.hinhanh}" alt="First slide"> </div>
                             
                        </div>
                        
                    </div>
                </div>
                
                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div class="single-product-details">
                        <h2>${sanpham.ten}</h2>
                        <h5>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatNumber pattern="#,##0" value="${sanpham.gia}" /> VNĐ</h5>
                        <h4>Mô tả:</h4>
                        <div class="row">
                            <div class="col-md-6 col-lg-6">
                                <p> ${sanpham.loai}
                                </p>
                            </div>

                        </div>
                        
                        <ul>
                            <li>
                                <div class="form-group size-st">
                                    <label class="size-label">Số lượng hiện có: </label>
                                     <input class="form-control" value="${sanpham.soluong}" disabled="disabled">
                                </div>
                            </li>

                            <li>
                                <div class="form-group quantity-box">
                                    <label class="control-label">Chọn mua: </label>
                                     <input class="form-control" value="${sanpham.id}" hidden="hidden" name="sanphamId">
                                        <input class="form-control" value="1" min="1" max="${sanpham.soluong}" type="number" id="slchonmua" name="sluong">
                                        
                                </div>
                                
                            </li>

                        </ul>
 					
                        
                        <div class="add-to-btn">
                            <div class="add-comp"> 
                           
                                <button class="btn hvr-hover" type="submit" value="Add"> <i class="fas fa-shopping-bag"></i> Thêm vào giỏ hàng</a>
                                
                            </div>
                        </div>
                    
                    </div>
                </div>
            </div>
 </form>
  

            <div class="row my-5">
                <div class="col-lg-12">

                    <div class="title-all text-center">
                        <h1>Sản Phẩm Ngẫu Nhiên</h1>
                    </div>

                   <div class="row special-list">
				<c:forEach var="tempSanpham" items="${sanphams}">
                        
                         
                <div class="col-lg-3 col-md-6 special-grid">
                 <c:url var="chitietLink" value="/sanpham/chitiet">
				                            <c:param name="sanphamId" value="${tempSanpham.id}" />
				                        </c:url>		
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <img src="${pageContext.request.contextPath}/resources/images/${tempSanpham.hinhanh}" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="${chitietLink}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>	
                                </ul>
                                <a class="cart" href="${pageContext.request.contextPath}/giohang/add/${tempSanpham.id}">Thêm vào giỏ hàng</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4>${tempSanpham.ten} -${tempSanpham.loai}</h4>
                             <h5>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatNumber pattern="#,##0" value="${tempSanpham.gia}" /> VNĐ</h5>
                        </div>
                    </div>
                
                     </div>  
                    </c:forEach>
   </div>

                      
</div>
        </div>
    </div>
    <!-- End Cart -->

   


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
                                    <li><img class="img-fluid" src="${pageContext.request.contextPath}/images/payment-icon/1.png" alt=""></li>
                                    <li><img class="img-fluid" src="${pageContext.request.contextPath}/images/payment-icon/2.png" alt=""></li>
                                    <li><img class="img-fluid" src="${pageContext.request.contextPath}/images/payment-icon/3.png" alt=""></li>
                                    <li><img class="img-fluid" src="${pageContext.request.contextPath}/images/payment-icon/5.png" alt=""></li>
                                    <li><img class="img-fluid" src="${pageContext.request.contextPath}/images/payment-icon/7.png" alt=""></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </footer>
   


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