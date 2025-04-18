<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강의 목록</title>
    <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>강의 목록</h1>
        
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
                        <button type="submit" class="btn btn-primary">검색</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- 강의 목록 -->
        <div class="card">
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3">
                    <h5 class="card-title">강의 목록</h5>
                    <a href="<c:url value='/courses/new' />" class="btn btn-success">새 강의 등록</a>
                </div>
                
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>연도</th>
                            <th>학기</th>
                            <th>강의코드</th>
                            <th>강의명</th>
                            <th>이수구분</th>
                            <th>교수명</th>
                            <th>학점</th>
                            <th>작업</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${courses}" var="course">
                            <tr>
                                <td>${course.year}</td>
                                <td>${course.semester}</td>
                                <td>${course.courseCode}</td>
                                <td>${course.courseName}</td>
                                <td>${course.category}</td>
                                <td>${course.professor}</td>
                                <td>${course.credit}</td>
                                <td>
                                    <a href="<c:url value='/courses/edit/${course.id}' />" class="btn btn-sm btn-primary">수정</a>
                                    <a href="<c:url value='/courses/delete/${course.id}' />" class="btn btn-sm btn-danger" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 