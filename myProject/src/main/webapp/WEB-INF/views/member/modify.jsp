<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<br>
<div class="container" style="max-width: 600px; border: 2px solid gray; padding: 50px; border-radius: 30px; margin-top: 40px;">
<h2 style="font-family: 'Jua', sans-serif; text-align: center;">회원수정</h2><br>
<form action="/member/modify" method="post">
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">이메일</label>
    <input type="email" name="email" class="form-control" id="email" value="${mvo.email }" readonly="readonly">
  </div>

<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">비밀번호</label>
  <input type="password" name="pwd" class="form-control" id="exampleFormControlInput1" placeholder="PassWord">
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">닉네임</label>
  <input type="text" name="nickName" class="form-control" id="exampleFormControlInput1" placeholder="${mvo.nickName }">
</div><br>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button type="submit" class="btn btn-outline-success">수정</button>
<a href="/member/remove"><button type="button"class="btn btn-outline-danger" style="float: right;">회원탈퇴</button></a>
<a href="/"><button type="button"class="btn btn-outline-secondary" style="float: right;">돌아가기</button></a>
</div>
</form>
</div>