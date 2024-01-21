<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<br>
<div class="container" style="max-width: 600px; border: 2px solid gray; padding: 50px; border-radius: 30px; margin-top: 70px;">
<h2 style="font-family: 'Jua', sans-serif; text-align: center;">로그인</h2><br>
<form action="/member/login" method="post">
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">이메일</label>
  <input type="email" name="email" class="form-control" id="exampleFormControlInput1" placeholder="Email">
</div>
<div class="mb-3">
  <button type="button" class="btn btn-warning">이메일 확인</button>
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">비밀번호</label>
  <input type="password" name="pwd" class="form-control" id="exampleFormControlInput1" placeholder="PassWord">
</div>

<c:if test="${not empty param.errMsg }">
	<div class="mb-3 text-danger">
		<c:choose>
			<c:when test="${param.errMsg eq 'Bad credentials' }">
				<c:set var="errText" value="이메일 또는 비밀번호가 일치하지 않습니다."></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="errText" value="관리자에게 문의해주세요."></c:set>
			</c:otherwise>
		</c:choose>
		${errText }
	</div>
</c:if>

<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button type="submit" class="btn btn-outline-success">로그인</button>
<a href="/member/register"><button type="button"class="btn btn-outline-secondary" style="float: right;">회원가입</button></a>
</div>
</form>
</div>


<script>
const modifyOK = `<c:out value="${modifyOK}"/>`;
if(modifyOK === "1"){
	alert("수정 성공 다시 로그인 해주세요.");
}
</script>
<script>
const logout = `<c:out value="${logout}"/>`;
if(logout === "1"){
	alert("탈퇴 완료");
}
</script>

