package kkm.entity;

import lombok.Data;

@Data
public class Credit {
    private Long id;
    private Integer year;
    private Integer semester;
    private Integer totalCredits;
    private Double averageGrade;
    private String studentId;
    
    // 강의 상세 정보를 위한 필드들
    private String courseCode;
    private String courseName;
    private String category;
    private String professor;
} 