<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>


<script type="text/javascript">
$(function(){
	var id=$("#tabContent1");
	var url="tab1.jsp";
	viewTabContent(id, url);
	
	$(".nice-select").css("width", "100%");
	$(".nice-select .current").html("날짜 선택");
	$(".nice-select ul.list").css("width", "100%");
});

$(function(){
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		  // alert(e.target); // newly activated tab
		  // e.relatedTarget // previous active tab
		  var tab=$(this).attr("aria-controls");
		  var id=$("#tabContent"+tab);
		  
		  var url;
		  if(tab=="1") {
			  url="tab1.jsp";
		  } else if(tab=="2") {
			  url="tab2.jsp";
		  } else if(tab=="3") {
			  url="tab3.jsp";
		  }
		  
		  viewTabContent(id, url);
	});	
});

function viewTabContent(id, url) {
	$.post(url, {}, function(data){
		  id.html(data);
	  });
}
</script>

  
 

    <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(img/bg-img/16.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-end">
                <div class="col-12">
                    <div class="breadcrumb-content d-flex align-items-center justify-content-between pb-5">
                        <h2 class="room-title">Room View Sea</h2>
                        <h2 class="room-price">$180 <span>/ Per Night</span></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


 
 
    <!-- Rooms Area Start -->
    <div class="roberto-rooms-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-7">
                    <!-- Single Room Details Area -->
                    <div class="single-room-details-area mb-50">
                        <!-- Room Thumbnail Slides -->
                        <div class="room-thumbnail-slides mb-50">
                            <div id="room-thumbnail--slide" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner mb-50">
                                    <div class="carousel-item active">
                                        <img src="<%=cp%>/resources/images/bg-img/everland.jpeg" class="d-block w-100" alt="">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="<%=cp%>/resources/images/bg-img/everland2.jpeg" class="d-block w-100" alt="">
                                    </div>
                                   
                                </div>

                                <ol class="carousel-indicators">
                                    <li data-target="#room-thumbnail--slide" data-slide-to="0" class="active">
                                        <img src="<%=cp%>/resources/images/bg-img/everland.jpeg" class="d-block w-100" alt="">
                                    </li>
                                    <li data-target="#room-thumbnail--slide" data-slide-to="1">
                                        <img src="<%=cp%>/resources/images/bg-img/everland2.jpeg" class="d-block w-100" alt="">
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-12 col-lg-5">
                    <div class="roberto-sidebar-area pl-md-4">

                        <!-- Newsletter -->
                        <div class="single-widget-area mb-100">
                            <div class="newsletter-form" style="height: 500px;">
                            	<!-- <div style="margin-bottom: 10px;">경기도 용인
                            	<p style="font-size: 20px;">에버랜드 입장권</p></div>
                            	<div>판매가격:</div>
                            	<div style="margin-bottom: 10px;">판매기간:</div>
                            	<div>
                            	<p>티켓선택</p>
                            	<p style="text-align: right;">1인당 최대 4개 구매</p>
                            	</div>
          						
          						<div>
                            	<p><select class="nice-select">
                            		<option>날짜선택</option>
                            	</select></p>
								</div>
								<div>
                            	<p style="margin-bottom: 30px;"><select class="nice-select">
                            		<option>옵션선택</option>
                            	</select></p>
                            	</div>
                            	<div>
                            	<p>총 상품금액: 50000원</p>
                            	</div>
                            </div>	 -->
                            	
                            	
                            <ul class="detail">
                            		<li>경기도 용인</li>
                            		<li style="font-size:20px;">에버랜드 입장권</li>
                            		<li>판매가격: 50000원</li>
                            		<li>판매기간: 2019년 1월 14일 ~ 2019년 2월 14일</li>
                            		<li>티켓선택
                            		<li style="text-align: right">1인당 최대 4개 구매 가능</li>
                            		
                  					<li>
                            		<select class="nice-select" style="width: 300px;">
                            			<option value=""></option>
                            			<option value=""></option>
                            		</select>
                            		</li>
                            		
                            		
                            		<li class="clear">
                            		<select class="nice-select">
                            		<optgroup label="날짜선택">
                            			<option value="">2019-10-10</option>
                            			</optgroup>
                            		</select>
                            		</li>
                            		
                            		<li class="clear">
                            		총 상품금액 <span>50000원</span>
                            		</li>
                            		
                            		<li class="mb-10 t_center">
                            		<button type="button" class="btn roberto-btn w-40">카트담기</button>
                            		
                            		<button type="button" class="btn roberto-btn w-40">바로구매</button>
                            		</li>
                            </ul>

                            
                        </div>
                    
                           <!--  <div class="form-group">
                                <button type="submit" class="btn roberto-btn w-100">Check Available</button>
                            </div> -->
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- Rooms Area End -->

    <!-- tab -->
        <div class="container">
            <div class="row align-items-center mb-100">
				<div style="margin: 30px auto; width: 100%;">
					<div role="tabpanel">
	  					<ul id="myTab" class="nav nav-tabs" role="tablist">
	      					<li role="presentation"  class="active"><a href="#tabContent1" aria-controls="1" role="tab" data-toggle="tab">상품설명</a></li>
	      					<li role="presentation"><a href="#tabContent2" aria-controls="2" role="tab" data-toggle="tab">상품리뷰</a></li>
	      					<li role="presentation"><a href="#tabContent3" aria-controls="3" role="tab" data-toggle="tab">환불규정/상품고시</a></li>
	  					</ul>
	
	  				<div class="tab-content">
	      				<div role="tabpanel" class="tab-pane active" id="tabContent1"></div>
	      				<div role="tabpanel" class="tab-pane" id="tabContent2"></div>
	      				<div role="tabpanel" class="tab-pane" id="tabContent3"></div>
	  				</div>
   					</div>
				</div>
			</div>
       	</div>
      



