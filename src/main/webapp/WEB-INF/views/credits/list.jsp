<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학년별 이수 학점 조회 - 한성대학교</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="<c:url value='/resources/images/KRENGSignature.png'/>" alt="한성대학교 로고" style="height: 60px; margin-bottom: 15px;">
            <h1>학년별 이수 학점 조회</h1>
        </div>
        
        <c:forEach var="yearEntry" items="${creditsByYear}">
            <div class="year-section">
                <h2>${yearEntry.key}학년도</h2>
                <table>
                    <thead>
                        <tr>
                            <th>학기</th>
                            <th>이수 학점</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="credit" items="${yearEntry.value}">
                            <tr>
                                <td>${credit.semester}학기</td>
                                <td>${credit.totalCredits}</td>
                                <td>
                                    <a href="<c:url value='/credits/${yearEntry.key}/${credit.semester}'/>" class="btn btn-sm">상세보기</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr class="total-row">
                            <td>총계</td>
                            <td>
                                <c:set var="totalCredits" value="0" />
                                <c:forEach var="credit" items="${yearEntry.value}">
                                    <c:set var="totalCredits" value="${totalCredits + credit.totalCredits}" />
                                </c:forEach>
                                ${totalCredits}
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </c:forEach>

        <div class="back-link">
            <a href="<c:url value='/'/>" class="btn">홈으로</a>
        </div>
    </div>
</body>
</html> 