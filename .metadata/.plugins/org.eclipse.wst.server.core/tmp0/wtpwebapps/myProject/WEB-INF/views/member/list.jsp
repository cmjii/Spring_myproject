<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<jsp:include page="../layout/header.jsp"></jsp:include>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<div class="container text-center md" style="margin-top: 60px;">
<h2 style="font-family: 'Jua', sans-serif; text-align: center;">회원 리스트</h2><br>
<div class="row" >
<c:forEach items="${list }" var="mvo">
<div class="col" style="margin-top: 60px;">
<div class="card " style="width: 18rem;">
  <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fplay-lh.googleusercontent.com%2F38AGKCqmbjZ9OuWx4YjssAz3Y0DTWbiM5HB0ove1pNBq_o9mtWfGszjZNxZdwt_vgHo&type=sc960_832" class="card-img-top" alt="...">
  <div class="card-body" style="padding-top: 0; text-align: left;">
    <h4 class="card-title" style="text-align: center; font-weight: 800; font-family: 'Jua', sans-serif;">${mvo.nickName }</h4>
    <p class="card-text" style="font-family: 'Jua', sans-serif;">이메일 : ${mvo.email }</p>
    <p class="card-text" style="font-family: 'Jua', sans-serif;">가입날짜 : ${mvo.regAt }</p>
    <p class="card-text" style="font-family: 'Jua', sans-serif;">마지막 로그인 : ${mvo.lastLogin }</p>
      </div>
</div>
</div>
</c:forEach>
</div>
</div>








<jsp:include page="../layout/footer.jsp"></jsp:include>