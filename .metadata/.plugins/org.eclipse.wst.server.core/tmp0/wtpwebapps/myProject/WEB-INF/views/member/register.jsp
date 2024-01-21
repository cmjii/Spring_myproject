<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<br>
<div class="container" style="max-width: 600px; border: 2px solid gray; padding: 50px; border-radius: 30px; margin-top: 40px;">
<h2 style="font-family: 'Jua', sans-serif; text-align: center;">회원가입</h2><br>
<form action="/member/register" method="post">
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">이메일</label>
    <input type="email" name="email" class="form-control" id="email" placeholder="Email">
  </div>
  <div class="col-auto">
    <button type="submit" class="btn mb-3 btn-warning" id="emailBtn">이메일 확인</button>
  </div>

<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">비밀번호</label>
  <input type="password" name="pwd" class="form-control" id="exampleFormControlInput1" placeholder="PassWord">
</div>
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">닉네임</label>
  <input type="text" name="nickName" class="form-control" id="exampleFormControlInput1" placeholder="Nick_name">
</div><br>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button type="submit" class="btn btn-outline-success">가입</button>
<a href="/"><button type="button"class="btn btn-outline-secondary" style="float: right;">돌아가기</button></a>
</div>
</form>
</div>


<script src="/resources/js/MemberRegister.js"></script>
