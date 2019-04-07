<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
	function insert_party() {
		var f = document.form_party;
		
		var val = f.subject.value;
		if(!val) {
			alert("제목을 입력해주세요.");
			f.subject.focus();
			return;
		}
		
		val = f.startDate.value;
		if(!val) {
			alert("모집 시작일을 지정해주세요.");
			f.startDate.focus();
			return;
		}
		
		val = f.endDate.value;
		if(!val) {
			alert("모집 종료일을 지정해주세요.");
			f.endDate.focus();
			return;
		}
		
		val = f.max.value;
		if(!val) {
			alert("참여인원을 입력해주세요.");
			f.max.focus();
			return;
		}
		
		val = f.enabled.value;
		if(!val) {
			alert("활성 여부를 선택해주세요.");
			f.enabled.focus();
			return;
		}
		
		val = f.content.value;
		if(!val) {
			alert("내용을 입력해주세요.");
			f.content.focus();
			return;
		}
		
		/* alert("${mode}"); */
		f.action = "<%=cp%>/travel/party/${mode}";
		f.submit();
	}
</script>

<!-- Breadcrumb Area Start -->
<div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(<%=cp%>/resources/images/bg-img/17.jpg);">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="breadcrumb-content text-center">
                    <h2 class="page-title">여행 동료 모으기</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Area End -->

<!-- Blog Area Start -->
<div class="mt-50 mb-100">
	<div class="container">
		<div class="mb20">
			<h2>파티 생성</h2>
		</div>
		<form name="form_party" method="post">
			<div>
				<table class="tb_basic_row">
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input type="text" name="subject" class="form-control" placeholder="Your Name">
						</td>
					</tr>
					<tr>
						<th>모집 시작일</th>
						<td>
							<input type="date" name="startDate" class="form-control" placeholder="Your Name">
						</td>
						<th>모집 종료일</th>
						<td>
							<input type="date" name="endDate" class="form-control" placeholder="Your Name">
						</td>
					</tr>
					<tr>
						<th>참여인원</th>
						<td>
							<input type="text" name="max" class="form-control" placeholder="Your Name">
						</td>
						<th>활성여부</th>
						<td>
							<input type="radio" name="enabled" value="0"/>활성
							<input type="radio" name="enabled" value="1"/>비활성
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea class="content" name="content"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="mt-30">
				<div class="col-12 text-right">
			    	<button type="button" class="btn roberto-btn mb-50" onclick="insert_party()">파티 생성</button>
			    	<button type="button" class="btn roberto-btn mb-50" onclick="location.href='<%=cp%>/travel/party'">생성 취소</button>
			    </div>
			</div>
		</form>
	</div>
</div>
<!-- Blog Area End -->