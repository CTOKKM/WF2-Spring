<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${year}학년 ${semester}학기 수강 내역</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="<c:url value='/resources/images/KRENGSignature.png'/>" alt="한성대학교 로고" style="height: 60px; margin-bottom: 15px;">
            <h1>${year}학년 ${semester}학기 이수 학점</h1>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>과목코드</th>
                    <th>과목명</th>
                    <th>구분</th>
                    <th>담당교수</th>
                    <th>학점</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="detail" items="${details}">
                    <tr>
                        <td>${detail.courseCode}</td>
                        <td>${detail.courseName}</td>
                        <td>${detail.category}</td>
                        <td>${detail.professor}</td>
                        <td>${detail.totalCredits}</td>
                    </tr>
                </c:forEach>
                <tr class="total-row">
                    <td colspan="4">총계</td>
                    <td>
                        <c:set var="totalCredits" value="0" />
                        <c:forEach var="detail" items="${details}">
                            <c:set var="totalCredits" value="${totalCredits + detail.totalCredits}" />
                        </c:forEach>
                        ${totalCredits}
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="back-link">
            <a href="<c:url value='/credits'/>" class="btn">목록으로</a>
        </div>
    </div>
</body>
</html> 