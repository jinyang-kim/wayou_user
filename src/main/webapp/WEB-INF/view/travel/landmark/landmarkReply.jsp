<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>

<c:if test="${not empty list}">
	<c:forEach var="reply" items="${list}">
		<div class="single-room-review-area d-flex align-items-center">
		    <div class="reviwer-thumbnail">
		        <img src="<%=cp%>/resources/images/common/defaultImg.jpeg" alt="">
		    </div>
		    <div class="reviwer-content w100p" data-replyNum="${reply.replyCode}" data-userIdx="${reply.userIdx}">
		        <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
		            <div class="reviwer-title">
		                <span>${reply.created}</span>
		                <h6>${reply.userId}(${reply.userName})</h6>
		            </div>
		            <div class="reviwer-rating" style="position:relative;top:12px;">
		            	<c:if test="${reply.starNum < 5}">
			            	<c:forEach begin="${reply.starNum}" end="4">
			            		<i class="fa fa-star" style="color: #b3b3b3;"></i>
			            	</c:forEach>
		            	</c:if>
		            	<c:if test="${reply.starNum > 0}">
			            	<c:forEach begin="1" end="${reply.starNum}">
			            		<i class="fa fa-star"></i>
			            	</c:forEach>
		            	</c:if>
		            </div>
		        </div>
		        <p>${reply.content}</p>
		        <c:if test="${reply.userIdx == sessionScope.member.userIdx}">
					<div class="mt10 f_right">
						<button class="btn_deleteReply button btn_blk">삭제</button>
					</div>
				</c:if>
		    </div>
		</div>
	</c:forEach>
	<div class="t_center mb30">
		${paging}
	</div>
</c:if>
<c:if test="${empty list}">
	<div class="t_center mb30">
		<span style="line-height: 25px;font-size: 14px;">등록된 커뮤니티 글이 없습니다.<br/>커뮤니티 글을 등록해주세요.</span>
	</div>
</c:if>