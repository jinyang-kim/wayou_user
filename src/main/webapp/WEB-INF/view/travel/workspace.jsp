<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=591cb76973b1a523d68f564d17c08ff0"></script>
<script>
	$(function(){
		listLocation('All');
		drawMap(37.5643368, 126.9756091);
	});
	$(function(){
		$("#locSearch").keyup(function(){
			var value = $(this).val();
			if(!value) value='All';
			listLocation(value);
		});
		
		$("body").on("click",".LocList", function(){
			var $info = $(this).children("input[type=hidden]");
			/* $info.attr("data-locCode")+","+$info.attr("data-lat")+","+$info.attr("data-lng")); */
			drawMap($info.attr("data-lat"),$info.attr("data-lng"));
			$("#createWorkspace").css("background","teal");
			$("#createWorkspace").prop("disabled",false);
			
			//해당 지역 정보 가져와서 뿌리기
			var url = "<%=cp%>/travel/basicInfo"
			var data = "locCode="+$info.attr("data-locCode");
			$.ajax({
				type:"get",
				url:url,
				data:data,
				success:function(data){
					$("#landInfo").html(data);
				},
				beforesend:function(e){
					e.setRequestHeader("AJAX",true);
				},
				error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
	
	function listLocation(data){
		var url = "<%=cp%>/travel/locList";
		var query = "name="+encodeURIComponent(data);	
		$.ajax({
			type:"get",
			url:url,
			data:query,
			success:function(data){
				$("#locScrollBox").html(data);
			},
			beforesend:function(e){
				e.setRequestHeader("AJAX",true);
			},
			error:function(e){
				console.log(e.responseText);
			}
			
		});
	}
	function drawMap(lat,lng){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
			level : 3, // 지도의 확대 레벨
			mapTypeId : daum.maps.MapTypeId.ROADMAP
		// 지도종류
		};
		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption);
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(lat, lng), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		
	}

	
</script>



<div id="container">
	<div class="row" style="margin-left: 0; margin-right: 0">
		<div class="col12 col-lg-3" id="navBar">
			<div class="workspace-title" align="center">
				<h6 style="color: white;">여행할 도시를 선택해 주세요</h6>
				<input type="text" style="height:31px; width: 90%; margin-top: 5px;" id="locSearch">
			</div>
			<div id="locScrollBox" class="scrollbox"></div>
			</div>

		<div class="col12 col-lg-3" style="height: 750px; border: 1px solid #e4e4e4; border-left: none;margin: 0;
  padding : 0;">
			<div class="landmark-title" align="center">
				<h5 style="color: white; padding-top: 20px;">도시 정보</h5>
			</div>
			<div id="landInfo" style="height: 635px;">
				
			</div>
			<div>
				<button id="createWorkspace" class="button" style="background: gray; width: 100%; color: white; font-size: 16px; height: 50px;" disabled="disabled" data-toggle="modal" data-target="#basicModal">일정만들기</button>
			</div>
		</div>

		<div class="col12 col-lg-6" style="height: 750px; overflow: hidden;"id="map"></div>
		
	</div>
</div>


<!-- basic modal -->
<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">일정만들기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form>
	      <div class="modal-body" style="height: auto;" align="center">
			<input type="text" placeholder="여행 일정 제목" style="width: 90%;" name="title"><br>
			<input type="text" id="from" style="margin-top: 10px;width: 90%;"><br>
			<input type="text" id='to' style="margin-top: 10px;width: 90%;">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" style="background: teal;">만들기</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<script src="<%=cp%>/resource/user/js/sangkeun.js"></script>