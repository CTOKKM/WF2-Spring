<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${empty course.id ? '새 강의 등록' : '강의 수정'}</title>
    <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h2 class="card-title">${empty course.id ? '새 강의 등록' : '강의 수정'}</h2>
                
                <form:form modelAttribute="course" action="${pageContext.request.contextPath}/courses/save" method="post">
                    <form:hidden path="id"/>
                    
                    <div class="mb-3">
                        <label for="year" class="form-label">연도</label>
                        <form:input path="year" class="form-control" required="required" readonly="true"/>
                        <form:errors path="year" class="text-danger"/>
                    </div>
                    
                    <div class="mb-3">
                        <label for="semester" class="form-label">학기</label>
                        <form:input path="semester" class="form-control" required="required" readonly="true"/>
                        <form:errors path="semester" class="text-danger"/>
                    </div>
                    
                    <div class="mb-3">
                        <label for="courseCode" class="form-label">강의코드</label>
                        <form:input path="courseCode" class="form-control" required="required"/>
                        <form:errors path="courseCode" class="text-danger"/>
                    </div>
                    
                    <div class="mb-3">
                        <label for="courseName" class="form-label">강의명</label>
                        <form:input path="courseName" class="form-control" required="required"/>
                        <form:errors path="courseName" class="text-danger"/>
                    </div>
                    
                    <div class="mb-3">
                        <label for="category" class="form-label">이수구분</label>
                        <form:select path="category" class="form-control" required="required">
                            <form:option value="">선택하세요</form:option>
                            <form:option value="교필">교필</form:option>
                            <form:option value="선필교">선필교</form:option>
                            <form:option value="일선">일선</form:option>
                            <form:option value="전필">전필</form:option>
                            <form:option value="전선">전선</form:option>
                        </form:select>
                        <form:errors path="category" class="text-danger"/>
                    </div>
                    
                    <div class="mb-3">
                        <label for="professor" class="form-label">교수명</label>
                        <form:input path="professor" class="form-control" required="required"/>
                        <form:errors path="professor" class="text-danger"/>
                    </div>
                    
                    <div class="mb-3">
                        <label for="credit" class="form-label">학점</label>
                        <form:select path="credit" class="form-control" required="required">
                            <form:option value="">선택하세요</form:option>
                            <form:option value="1">1학점</form:option>
                            <form:option value="2">2학점</form:option>
                            <form:option value="3">3학점</form:option>
                        </form:select>
                        <form:errors path="credit" class="text-danger"/>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a href="<c:url value='/' />" class="btn btn-secondary me-md-2">취소</a>
                        <button type="submit" class="btn btn-primary">저장</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 