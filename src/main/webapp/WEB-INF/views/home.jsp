<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학사 정보 시스템</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
</head>
<body>
    <div class="container">
        <h1>학사 정보 시스템</h1>
        <div class="menu-container">
            <div class="menu-item">
                <h2>① 학년별 이수 학점 조회</h2>
                <p>각 학년별로 이수한 학점을 조회할 수 있습니다.</p>
                <a href="<c:url value='/credits'/>" class="btn">조회하기</a>
            </div>
            
            <div class="menu-item">
                <h2>② 수강 신청하기</h2>
                <p>새로운 강의를 수강 신청할 수 있습니다.</p>
                <a href="<c:url value='/courses/new'/>" class="btn">신청하기</a>
            </div>
            
            <div class="menu-item">
                <h2>③ 수강 신청 조회</h2>
                <p>현재 수강 신청한 강의를 조회할 수 있습니다.</p>
                <a href="<c:url value='/courses'/>" class="btn">조회하기</a>
            </div>
        </div>
    </div>
</body>
</html> 