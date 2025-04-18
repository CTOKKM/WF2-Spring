<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강의 목록 - 한성대학교</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="<c:url value='/resources/images/KRENGSignature.png'/>" alt="한성대학교 로고" style="height: 60px; margin-bottom: 15px;">
            <h1>강의 목록</h1>
        </div>
        
        <!-- 검색 폼 -->
        <div class="card">
            <div class="card-body">
                <form action="<c:url value='/courses/search' />" method="get" class="row g-3">
                    <div class="col-md-2">
                        <input type="number" name="year" class="form-control" placeholder="연도">
                    </div>
                    <div class="col-md-2">
                        <input type="number" name="semester" class="form-control" placeholder="학기">
                    </div>
                    <div class="col-md-2">
                        <input type="text" name="category" class="form-control" placeholder="이수구분">
                    </div>
                    <div class="col-md-2">
                        <input type="text" name="professor" class="form-control" placeholder="교수명">
                    </div>
                    <div class="col-md-2">
                        <input type="text" name="courseName" class="form-control" placeholder="강의명">
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn w-100">검색</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- 강의 목록 -->
        <div class="card">
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3">
                    <h5 class="card-title">강의 목록</h5>
                    <a href="<c:url value='/courses/new' />" class="btn">새 강의 등록</a>
                </div>
                
                <c:forEach var="yearEntry" items="${coursesByYear}">
                    <div class="year-section">
                        <h2>${yearEntry.key}학년도</h2>
                        <c:forEach var="semesterEntry" items="${yearEntry.value}">
                            <div class="semester-section">
                                <h3>${semesterEntry.key}학기</h3>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>강의코드</th>
                                            <th>강의명</th>
                                            <th>이수구분</th>
                                            <th>교수명</th>
                                            <th>학점</th>
                                            <th>작업</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${semesterEntry.value}" var="course">
                                            <tr>
                                                <td>${course.courseCode}</td>
                                                <td>${course.courseName}</td>
                                                <td>${course.category}</td>
                                                <td>${course.professor}</td>
                                                <td>${course.credit}</td>
                                                <td>
                                                    <a href="<c:url value='/courses/edit/${course.id}' />" class="btn btn-sm">수정</a>
                                                    <a href="<c:url value='/courses/delete/${course.id}' />" class="btn btn-sm" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="back-link">
            <a href="<c:url value='/' />" class="btn">홈으로</a>
        </div>
    </div>
</body>
</html> 