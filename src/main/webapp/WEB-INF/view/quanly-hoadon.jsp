
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>ThewayShop - Quản lý hóa đơn</title>
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
	

 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Reference Bootstrap files -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"  rel="stylesheet" type="text/css">
<script src="<c:url value='${pageContext.request.contextPath}/resources/jquery/jquery-3.5.0.min.js' />" ></script>
<script src="<c:url value='${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.js' />" ></script>


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
                            <a class="nav-link active" href="${pageContext.request.contextPath}/nguoidung/list/1?theSearchHo=&theSearchTen=&theSearchSdt=&theSearchDiachi=">Quản lý người dùng</a>
                        </li>
                       </security:authorize>
                         
                       
            </div>
  				<div class="attr-nav">
                    <ul>
                        <li class="search">
                            <a href="#"><i class="fa fa-search"></i></a>
                        </li>

                     
                       <li class="">
                            <a href="${pageContext.request.contextPath}/giohang"><i class="fa fa-shopping-bag"></i>Giỏ hàng</a>
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

    <!-- Start Top Search -->
    
  <div class="container">

	<h3>Danh sách hóa đơn</h3>
	<hr>
	 
	 	<c:if test="${param.thongbao != null}">
                                <div class="alert alert-success col-xs-offset-1 col-xs-10">
                                        Thành công!
                                </div>
         </c:if>
       
	<!-- Add a button -->
	
	<div class="container-fluid justify-content-center">
	  <form action="${pageContext.request.contextPath}/hoadon/list/1" method="GET">
			<div class="row">
				   
				    <div class="col">
				    <input type="date" class="form-control" placeholder="Ngày bắt đầu" name="theSearchDateBD" value = <%=request.getParameter("theSearchDateBD")%>>
				    </div>
			 	
				    <div class="col">
				        <input type="date"  class="form-control" placeholder="Ngày kết thúc" name="theSearchDateKT"  value = <%=request.getParameter("theSearchDateKT")%>>
				    </div>
				    <div class="col">
				     <button type="submit" class="btn btn-primary mb-2">Tìm kiếm</button>
				    </div>
				    
				     
				  
  			</div>				
	  </form>
	</div>
	
	
	<table class="table table-bordered table-striped">
		<thead class="thead-dark">
			<tr>
				<th>ID</th>
				<th>Tên người dùng</th>
				<th>Ngày lập</th>
				<th>Tổng tiền</th>
				<th>Chi tiết</th>
			</tr>
		</thead>
		<c:forEach var="tempHoadon" items="${hoadons}">
               
				  	
                 <tr>
                  			<td> ${tempHoadon.id} </td>
                            <td> ${tempHoadon.nguoidung.ho} ${tempHoadon.nguoidung.ten} </td>
                            <td> ${tempHoadon.ngaylap} </td>
                            <td><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  <fmt:formatNumber pattern="#,##0" value="${tempHoadon.tongtien}" /> VNĐ</td>
                            <td>  
                                 
                                   	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal-${tempHoadon.id}" data-whatever="@mdo">Xem</button>
										
										<div class="modal fade" id="exampleModal-${tempHoadon.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalLabel">Danh sách các sản phẩm:</h5>
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										          <span aria-hidden="true">&times;</span>
										        </button>
										      </div>
										      <div class="modal-body">
										      <table  class="table table-bordered table-striped">
										      	<thead class="thead-dark">
														<tr>
															<th>Tên sản phẩm</th>
															<th>Số lượng</th>
															<th>Thành tiền</th>
															<th>Chi tiết</th>
														</tr>
													</thead>
										        <c:forEach var="tempChitiet" items="${tempHoadon.cthoadon}">
										         	<tr>
										         		<td>
										         			${tempChitiet.sanpham.ten}
										         		</td>
										         		<td>
										         			${tempChitiet.soluong}
										         		</td>
										         		<td>
										         		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
										         		<fmt:formatNumber pattern="#,##0" value="${tempChitiet.gia}" /> VNĐ
										         			
										         		</td>
										         		<td>
										         		
										         		<a href="${pageContext.request.contextPath}/sanpham/chitiet?sanphamId=${tempChitiet.sanpham.id}">Xem</a>
										         		</td>
										         	</tr>
										         </c:forEach>
										      </table>
										       
										        
										        
										      </div>
										      
										    </div>
										  </div>
										</div>
										</td>
                          
                 </tr>
                     
        </c:forEach>
		<tbody>
			
		</tbody>	
		
	</table>
	
</div>

      <div class="container-fluid">
      <nav aria-label="Page navigation">
       <ul class="pagination justify-content-center">
            <c:if test="${currentPage != 1}">
                <li class="page-item"><a class="page-link"
                    href="${pageContext.request.contextPath}/hoadon/list/${currentPage-1}?theSearchDateBD=<%=request.getParameter("theSearchDateBD")%>&theSearchDateKT=<%=request.getParameter("theSearchDateKT")%>">Trang trước</a>
                </li>
            </c:if>

            <c:forEach begin="1" end="${noOfPages}" var="i">
                <c:choose>
                    <c:when test="${currentPage eq i}">
                        <li class="page-item active"><a class="page-link">
                                ${i} <span class="sr-only">(current)</span></a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link"
                             href="${pageContext.request.contextPath}/hoadon/list/${i}?theSearchDateBD=<%=request.getParameter("theSearchDateBD")%>&theSearchDateKT=<%=request.getParameter("theSearchDateKT")%>">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${currentPage lt noOfPages}">
                <li class="page-item"><a class="page-link"
                    href="${pageContext.request.contextPath}/hoadon/list/${currentPage+1}?theSearchDateBD=<%=request.getParameter("theSearchDateBD")%>&theSearchDateKT=<%=request.getParameter("theSearchDateKT")%>
                    ">Trang sau</a>
                </li>
            </c:if>
        </ul>
      </nav></div>	

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
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

</body>

</html>