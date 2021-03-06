<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>The Way Shop</title>
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

     <!-- ALL JS FILES -->
     <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
     <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
     <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                                <i class="fab fa-opencart"></i> Nh???p Code ????? ???????c Gi???m 20%: #DUCDEPTRAI  
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> Sale 10-20% ?????ng H??? Nam
                            </li>
                            <li>
                                <i class="fab fa-opencart"></i> Sale C???c S???c Cho ?????ng H??? N???
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
                            [QU???N L??]
                        </li>
                         </security:authorize>
			    			<li>Xin ch??o, t??i kho???n <security:authentication property="principal.username" /></li>
			    			 <li><a href="${pageContext.request.contextPath}/dangxuat">????ng xu???t</a></li>
				</c:if>
				<c:if test="${empty myNguoidung}">
			    			
			    			 <li><a href="${pageContext.request.contextPath}/dangnhap">????ng nh???p</a></li>
				</c:if>
				<c:if test="${empty myNguoidung}">
			    			
			    			 <li><a href="${pageContext.request.contextPath}/dangky">????ng k??</a></li>
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
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}">Trang Ch???</a>
                        </li>
   						<li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/sanpham">S???n ph???m</a>
                        </li>
                        <security:authorize access="hasAnyRole('QUANLY','NGUOIDUNG')">  
                          <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/canhan">C?? nh??n</a>
                        </li>
                         </security:authorize>
                        <security:authorize access="hasAnyRole('QUANLY')">  
                         <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/hoadon/list/">Qu???n l?? h??a ????n</a>
                        </li>
                         </security:authorize>
                       <security:authorize access="hasAnyRole('QUANLY')">  
                       <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/nguoidung/list/1?theSearchHo=&theSearchTen=&theSearchSdt=&theSearchDiachi=">Qu???n l?? ng?????i d??ng</a>
                        </li>
                       </security:authorize>
                       
                       
                        
                       
            </div>
  				<div class="attr-nav">
                    <ul>
                        <li class="search">
                            <a href="#"><i class="fa fa-search"></i></a>
                        </li>

                     
                       <li class="">
                            <a href="${pageContext.request.contextPath}/giohang"><i class="fa fa-shopping-bag"></i> Gi??? h??ng</a>
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
					     <input type="text" name = "theSearchName" class="form-control" placeholder="T??m Ki???m"  onkeydown = "if (event.keyCode == 13)
					                        document.getElementById('btnSearch').click()"   >
					    <div class="col">
					     <button hidden="true" type="submit" id = "btnSearch" value="Search"  class="btn hvr-hover">T??m ki???m</button>
					    </div>
					</form>
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>


    <!-- SLIDE -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-left">
                <img src="${pageContext.request.contextPath}/resources/images/banner1.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> Thewayshop</strong></h1>
                            <p class="m-b-40">H??y mua s???m theo s??? th??ch c???a b???n <br> ??am m?? c???a b???n l?? s??? h??i l??ng c???a ch??ng t??i.</p>
                            <p><a class="btn hvr-hover" href="${pageContext.request.contextPath}/sanpham">Mua Ngay</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="${pageContext.request.contextPath}/resources/images/banner2.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> Thewayshop</strong></h1>
                            <p class="m-b-40">H??y mua s???m theo s??? th??ch c???a b???n <br> ??am m?? c???a b???n l?? s??? h??i l??ng c???a ch??ng t??i.</p>
                            <p><a class="btn hvr-hover" href="${pageContext.request.contextPath}/sanpham">Mua Ngay</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-right">
                <img src="${pageContext.request.contextPath}/resources/images/banner3.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> Thewayshop</strong></h1>
                            <p class="m-b-40">H??y mua s???m theo s??? th??ch c???a b???n <br> ??am m?? c???a b???n l?? s??? h??i l??ng c???a ch??ng t??i.</p>
                            <p><a class="btn hvr-hover" href="${pageContext.request.contextPath}/sanpham">Mua Ngay</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    
 				
  
    

    <!-- Start Products  -->
    <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>S???N PH???M</h1>
                        <p>H??y mua s???m theo s??? th??ch c???a b???n <br> ??am m?? c???a b???n l?? s??? h??i l??ng c???a ch??ng t??i.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        
                            <h1>S???n ph???m ng???u nhi??n</h1>
                          
                      
                    </div>
                </div>
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
                                <a class="cart" href="${pageContext.request.contextPath}/giohang/add/${tempSanpham.id}">Th??m v??o gi??? h??ng</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4>${tempSanpham.ten} -${tempSanpham.loai}</h4>
                            <h5>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:formatNumber pattern="#,##0" value="${tempSanpham.gia}" /> VN??</h5>
                        </div>
                    </div>
                
                     </div>  
                    </c:forEach>
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
                                    <p><i class="fas fa-map-marker-alt"></i>?????a ch???: 12 Nguy???n V??n B???o, Ph?????ng 7, Qu???n G?? V???p, Tp.HCM </p>
                                </li>
                                <li>
                                    <p><i class="fas fa-phone-square"></i>??i???n tho???i: <a href="tel:+84-359806602">+84 359 806 602</a></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-envelope"></i>Email: <a href="mailto:12345ddduc@gmail.com">12345ddduc@gmail.com</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>V??? ch??ng t??i</h4>
                            <p>THEWAYSHOP l?? trang web b??n ?????ng h??? v???i t???m nh??n chi???n l?????c d??i h???n lu??n tu??n th??? nh???ng cam k???t v???i kh??ch h??ng.
                                THEWAYSHOP lu??n c??? g???ng mang t???i kh??ch h??ng s???n ph???m th???t - gi?? tr??? th???t gi??p kh??ch h??ng 
                                kh??ng c??n lo l???ng khi ch???n mua s???n ph???m t???i ????y.</p>
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
                            <h4>Th??ng tin chung</h4>
                            <ul>
                                <li><a href="#">V??? ch??ng t??i</a></li>
                                <li><a href="#">D???ch v???</a></li>
                                <li><a href="#">??i???u kho???n</a></li>
                                <li><a href="#">Ch??nh s??ch b???o m???t</a></li>
                                <li><a href="#">Th??ng tin Giao H??ng</a></li>
                            </ul>
                        </div>
                    </div>


                    <div class="col-lg-3 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>H??? tr??? kh??ch h??ng</h4>
                            <p>T?? v???n mua h??ng (mi???n ph??): <br> +84 359 806 602</p>
                            <p>H??? tr??? thanh to??n</p>
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