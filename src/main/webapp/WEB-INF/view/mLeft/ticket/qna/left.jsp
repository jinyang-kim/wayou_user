<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	var idx="${subMenu}";
	if(!idx) idx=0;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});
</script>
<div class="container">
<div class="list-group">
       <!-- <div class="list-group-item lefthead"><i></i> 고객센터</div> -->
       <a href="<%=cp%>/ticket/qna/list" class="list-group-item">질문과 답변</a>
       <a href="<%=cp%>/ticket/faq/list" class="list-group-item">자주하는 질문</a>
       <a href="#" class="list-group-item">1:1문의</a>
       
</div>
</div>