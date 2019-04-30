<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>



<section class="welcome-area">
	<div class="welcome-slides owl-carousel noImg">
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/16.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/16.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInLeft" data-delay="200ms">Hotel &amp; Resort</h6>
	                            <h2 data-animation="fadeInLeft" data-delay="500ms">Welcome To Roberto</h2>
	                            <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInLeft" data-delay="800ms">Discover Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/17.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                    <div class="col-12">
	                        <div class="welcome-text text-center">
	                            <h6 data-animation="fadeInUp" data-delay="200ms">Hotel &amp; Resort</h6>
	                            <h2 data-animation="fadeInUp" data-delay="500ms">Welcome To Roberto</h2>
	                            <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInUp" data-delay="800ms">Discover Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <!-- Single Welcome Slide -->
	    <div class="single-welcome-slide bg-img bg-overlay" style="background-image: url(<%=cp%>/resources/images/bg-img/18.jpg);" data-img-url="<%=cp%>/resources/images/bg-img/18.jpg">
	        <!-- Welcome Content -->
	        <div class="welcome-content h-100">
	            <div class="container h-100">
	                <div class="row h-100 align-items-center">
	                    <!-- Welcome Text -->
	                        <div class="col-12">
	                            <div class="welcome-text text-center">
	                                <h6 data-animation="fadeInDown" data-delay="200ms">Hotel &amp; Resort</h6>
	                                <h2 data-animation="fadeInDown" data-delay="500ms">Welcome To Roberto</h2>
	                                <a href="#" class="btn roberto-btn btn-2" data-animation="fadeInDown" data-delay="800ms">Discover Now</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

	 
    <div class="roberto-rooms-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8" >
                    <!-- Single Room Area -->
                        <c:forEach var="dto" items="${list}">
                    <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
                        <!-- Room Thumbnail -->
                        <div class="room-thumbnail">
                            <img src="<%=cp%>/resources/images/bg-img/43.jpg" alt="">
                        </div>
                        <!-- Room Content -->
                        <div class="room-content">
                            <h2>${dto.hName}</h2>
                            <h4>가격 <span>${dto.price }/ Day</span></h4>
                            <div class="room-feature">
                                <h6>위치<span>${dto.locCode }</span></h6>
                                <h6>최대인원: <span>${dto.HCount }</span></h6>
                                <h6>별찍기?: <span>몇점?</span></h6>
                            </div>
                          	<a href="<%=cp%>/hotel/hotel/article" class="btn view-detail-btn">View Details <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                        </div>
                    </div>
                        </c:forEach>

                  

                    <!-- Pagination -->
					<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
					   <tr height="35">
						<td align="center">
					        ${dadtaCount==0?"등록된 자료가 없습니다.": paging}
						</td>
					   </tr>
					</table>
                </div>

                <div class="col-12 col-lg-4">
                    <!-- Hotel Reservation Area -->
                    
                    <div class="hotel-reservation--area mb-100" style="border: 2px  solid; border-color:gray; padding: 13px;">
                        <form action="#" method="post">
                            <div >
                                <label style="font-size: 25px;" >날짜 검색</label>
                                <div>
                                    <div class="row no-gutters">
			                            <div class="col-6 col-md-6 col-lg-6">                              
			                                <input type="date" class="form-control" id="checkIn" name="checkin-date">
			                            </div>
			                           	<div class="col-6 col-md-6 col-lg-6">                              
			                                <input type="date" class="form-control" id="checkIn" name="checkin-date">
			                            </div>
                                    </div>
                                </div>
                            </div>
                            <div >
                                <label style="font-size: 25px; padding-top: 30px;">가격순 보기</label>
                            
                                    <div class="row no-gutters">
			                            <div class="col-6 col-md-6 col-lg-6" style="font-size: 20px;">  
			                           		<input type="checkbox">낮은 가격순                               
			                            </div>
			                            <div class="col-6 col-md-6 col-lg-6" style="font-size: 20px;">  
			                           		<input type="checkbox">높은 가격순                               
			                            </div>
                                    </div>
                           
                            </div>
                            <div  class="form-group mb-50">
                                 <label style="font-size: 25px; padding-top: 30px;">지역 검색</label>
                                <div>
                                    <div class="row no-gutters">
                                    <div class="col-6" >                         
				                        <input type="text" class="form-control" id="key" name="key" value="검색하기"/>
				                          	   	                 
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="">
                                <button type="submit" class="btn roberto-btn w-100">호텔 찾아보자</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="roberto-cta-area" style="padding-bottom: 80px;">
        <div class="container">
            <div class="cta-content bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/1.jpg);">
                <div class="row align-items-center">
                    <div class="col-12 col-md-7">
                        <div class="cta-text mb-50">
                            <h2>Contact us now!</h2>
                            <h6>Contact (+12) 345-678-9999 to book directly or for advice</h6>
                        </div>
                    </div>
                    <div class="col-12 col-md-5 text-right">
                        <a href="#" class="btn roberto-btn mb-50">Contact Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	