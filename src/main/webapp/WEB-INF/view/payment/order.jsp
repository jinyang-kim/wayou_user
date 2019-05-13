<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
	.container.payment .title{margin-top:100px;margin-bottom:30px;padding-bottom:20px;border-bottom:1px solid #c4c4c4;}
</style>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(function(){
	$(".paymentBtn").click(function(){
		var mode="${mode}";
		var IMP = window.IMP; // 생략가능
		var sum = 1000;
		IMP.init("imp16254268");
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 100,
			buyer_email : '${dto.userEmail}',
		    buyer_name : '${dto.userName}',
		    buyer_tel : '${dto.userTel}',
		    buyer_addr : '${dto.userAddr1} + ${dto.userAddr2} + ${dto.etc}',
		    buyer_postcode : '${dto.postCode}'
		}, function(rsp) {
		    if ( rsp.success ) { 
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		       
		        var impCode = rsp.imp_uid;
		        var paymethod= rsp.pay_method;
		        var status=rsp.status;

				var memo=$("#d_txt").val();
				
				<c:if test="${not empty dto1}">
					var wishCode=${dto1.wishCode};
					var url = "<%=cp%>/payment/insertPayment_wish";
					var data="wishCode="+wishCode+"&mode="+mode+"&memo="+memo+"&impCode="+impCode+"&paymethod="+paymethod+"&status="+status;
					alert(data);
		        $.ajax({
		        	type:"post",
					url:url, 
					data:data,
					dataType:"json",
					success:function(data){
						alert("구매해주셔서 감사합니다.");
						location.href="<%=cp%>/payment/complete"
					},
					beforesend:function(e){
						e.setRequestHeader("AJAX",true);
					},
					error:function(e){
				    	if(e.status==403) {
				    		location.href="<%=cp%>/member/login";
				    		return;
				    	}
					}
		        });
				</c:if>
				<c:if test="${mode==3}">
				if((mode==3)){
					alert("mode3");
					var url = "<%=cp%>/payment/insertPayment_wishA";
					var data="mode="+mode+"&memo="+memo+"&impCode="+impCode+"&paymethod="+paymethod+"&status="+status;
		        $.ajax({
		        	type:"post",
					url:url, 
					data:data,
					dataType:"json",
					success:function(data){
						alert("구매해주셔서 감사합니다.");
						location.href="<%=cp%>/payment/complete"
					},
					beforesend:function(e){
						e.setRequestHeader("AJAX",true);
					},
					error:function(e){
				    	if(e.status==403) {
				    		location.href="<%=cp%>/member/login";
				    		return;
				    	}
					}
		        });
				}
			</c:if>
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	});
});

</script>


<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);"></div>

<div class="container payment">
	<div class="row">
		<div class="title col-md-12">
			<h3>주문내역</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="order_complate">
				<div class="mt20 mb40 t_center">
					<input type="hidden" >
					<h1><strong class="t_red">${dto.userName}님</strong> <strong class="t_red">주문</strong>내역 리스트</h1>
				</div>
				
				<h5 class="cont_tit tit2">주문 리스트</h5>
				<table class="table mt10 mb40">
					<colgroup>			
						<col />
						<col style="width:100px" />
						<col style="width:120px" />
						<col style="width:120px" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">주문상품</th>
							<th scope="col">수량</th>
							<th scope="col">상품가격</th>
							<th scope="col">최종결제금액</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th scope="row" colspan="3" class="f14">합계</th>
						<c:if test="${not empty dto1}">
							<!-- <td><strong class="f18"></strong>${dto1.price}</td> -->
							<td><strong class="f20 t_red"  id="totalMoney" value="${dto1.totalMoney}">${dto1.totalMoney}</strong></td>
						</c:if>
						<c:if test="${not empty totalMoney}">
							<!-- <td><strong class="f18"></strong>${dto1.price}</td> -->
							<td><strong class="f20 t_red"  id="totalMoney" value="${totalMoney}">${totalMoney}</strong></td>
						</c:if>
						</tr>
					</tfoot>
					<tbody>
					<c:if test="${not empty dto1}">
						<tr>
						<c:if test="${dto1.departCode == 1}">
							<td class="t_left">${dto1.ticketName}&nbsp;${dto1.ticketdetailName}</td>
						</c:if>
						<c:if test="${dto1.departCode == 2 }">
							<td class="t_left">${dto1.hName}&nbsp;${dto1.roomNum}</td>
						</c:if>
							<td class="t_gray">${dto1.amount}</td>
							<td><strong>${dto1.price}</strong></td>
							<td><strong>${dto1.price*dto1.amount}</strong></td>
						</tr>
					</c:if>
					<c:if test="${not empty list_dh}">
					<c:forEach var="dto" items="${list_dh}">
						<tr>
							<td class="t_left">${dto.hName}&nbsp;${dto.roomNum} </td>
							<td class="t_gray">${dto.amount}</td>
							<td><strong>${dto.price}</strong></td>
							<td><strong>${dto.price*dto.amount}</strong></td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${not empty list_dt}">
					<c:forEach var="dto" items="${list_dt}">
						<tr>
							<td class="t_left">${dto.ticketdetailName } </td>
							<td class="t_gray">${dto.amount}</td>
							<td><strong>${dto.price}</strong></td>
							<td><strong>${dto.price*dto.amount}</strong></td>
						</tr>
					</c:forEach>
					</c:if>
					</tbody>
				</table>

				<div class="order_wrap">
					<section class="l_order">
						<h5 class="cont_tit tit2">1.고객정보</h5>
						<table class="table mt10 myInfo_form">
							<caption>고객정보 입력폼</caption>
							<colgroup>
								<col style="width:170px" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">주문유형</th>
									<td class="t_left"><span class="line35">온라인</span></td>
								</tr>
								<tr>
									<th scope="row"><label for="d_name" style="margin-bottom:0;">주문자 정보</label></th>
									<td class="t_left">
										<div>
											<span class="line30" >${dto.userName}</span>
										</div>
									</td>
								</tr>								
								
								<!-- 회원 -->
								<tr>
									<th scope="row"><label for="d_phone" style="margin-bottom:0;">연락처</label></th>
									<td class="t_left">
										<div>
											<span class="line30">${dto.userTel}</span>
										</div>
									</td>
								</tr>
								<!-- /회원 -->
				
								<tr>
									<th scope="row">주소</th>
									<td class="t_left">
										<div>
											<span class="line30">${dto.postCode}<br>${dto.userAddr1}<br>${dto.userAddr2 }<br>${dto.etc }</span>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="d_txt" style="margin-bottom:0;">메모</label></th>
									<td class="t_left">
										<p>
											<input type="text" id="d_txt" style="width:546px;" placeholder="메모 메시지를 입력해주세요" title="요청 메시지 입력" />
										</p>
									</td>										
								</tr>
							</tbody>
						</table>

						<h5 class="cont_tit tit2 mt60">2.결제수단</h5>
						<table class="table mt10 myInfo_form">
							<caption>결제수단 입력폼</caption>
							<colgroup>
								<col style="width:170px" />
								<col />
							</colgroup>
							<tbody>							
								<tr>
									<th scope="row"><label for="pay_rdo2" style="margin-bottom:0;">인터넷 결제</label></th>
									<td class="t_left">
										<label class="radio" style="margin-bottom:0;">
											<input name="pay_rdo" id="pay_rdo2" type="radio" class="radio" />
											<span class="lbl">신용카드</span>
										</label>
										<label class="radio ml20" style="margin-bottom:0;">
											<input name="pay_rdo" type="radio" class="radio" />
											<span class="lbl">휴대폰</span>
										</label>
									</td>
								</tr>
							</tbody>
						</table>
						<p class="t_center mt30 mb50">
							<a href="<%=cp%>/travel" class="button btn_wht w200 h40">메인가기</a>
							<a href="#" class="paymentBtn button btn_blk w200 h40 ml10">결제하기</a>
						</p>
					</section>
				</div>
			</div>
		</div>
	</div>
</div>