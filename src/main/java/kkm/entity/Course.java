package kkm.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.Data;

@Data
@Entity
@Table(name = "Courses")
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "연도는 필수 입력 항목입니다.")
    @Min(value = 2020, message = "연도는 2020년 이후만 입력 가능합니다.")
    @Max(value = 2025, message = "연도는 2025년까지만 입력 가능합니다.")
    @Column(nullable = false)
    private Integer year;

    @NotNull(message = "학기는 필수 입력 항목입니다.")
    @Min(value = 1, message = "학기는 1학기 또는 2학기만 입력 가능합니다.")
    @Max(value = 2, message = "학기는 1학기 또는 2학기만 입력 가능합니다.")
    @Column(nullable = false)
    private Integer semester;

    @NotBlank(message = "강의코드는 필수 입력 항목입니다.")
    @Pattern(regexp = "^.{6}$", message = "강의코드는 6자리로 입력해야 합니다.")
    @Column(name = "course_code", nullable = false, length = 20)
    private String courseCode;

    @NotBlank(message = "강의명은 필수 입력 항목입니다.")
    @Size(min = 2, max = 100, message = "강의명은 2자 이상 100자 이하로 입력해야 합니다.")
    @Column(name = "course_name", nullable = false, length = 100)
    private String courseName;

    @NotBlank(message = "이수구분은 필수 입력 항목입니다.")
    @Pattern(regexp = "^(교필|선필교|일선|전필|전선)$", message = "이수구분은 '교필', '선필교', '일선', '전필', '전선' 중 하나여야 합니다.")
    @Column(nullable = false, length = 20)
    private String category;

    @NotBlank(message = "교수명은 필수 입력 항목입니다.")
    @Size(min = 2, max = 50, message = "교수명은 2자 이상 50자 이하로 입력해야 합니다.")
    @Column(nullable = false, length = 50)
    private String professor;

    @NotBlank(message = "학점은 필수 입력 항목입니다.")
    @Pattern(regexp = "^[1-3]$", message = "학점은 1, 2, 3 중 하나여야 합니다.")
    @Column(length = 10)
    private String credit;
} 