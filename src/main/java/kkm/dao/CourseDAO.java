package kkm.dao;

import kkm.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CourseDAO {
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public CourseDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Course> courseRowMapper = new RowMapper<Course>() {
        @Override
        public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
            Course course = new Course();
            course.setId(rs.getLong("id"));
            course.setYear(rs.getInt("year"));
            course.setSemester(rs.getInt("semester"));
            course.setCourseCode(rs.getString("course_code"));
            course.setCourseName(rs.getString("course_name"));
            course.setCategory(rs.getString("category"));
            course.setProfessor(rs.getString("professor"));
            course.setCredit(rs.getString("credit"));
            return course;
        }
    };

    public List<Course> findAll() {
        String sql = "SELECT * FROM Courses";
        return jdbcTemplate.query(sql, courseRowMapper);
    }

    public List<Course> findByYearAndSemester(int year, int semester) {
        String sql = "SELECT * FROM Courses WHERE year = ? AND semester = ?";
        return jdbcTemplate.query(sql, courseRowMapper, year, semester);
    }

    public List<Course> findByCategory(String category) {
        String sql = "SELECT * FROM Courses WHERE category = ?";
        return jdbcTemplate.query(sql, courseRowMapper, category);
    }

    public List<Course> findByProfessor(String professor) {
        String sql = "SELECT * FROM Courses WHERE professor = ?";
        return jdbcTemplate.query(sql, courseRowMapper, professor);
    }

    public List<Course> findByCourseNameContaining(String courseName) {
        String sql = "SELECT * FROM Courses WHERE course_name LIKE ?";
        return jdbcTemplate.query(sql, courseRowMapper, "%" + courseName + "%");
    }

    public Course findById(Long id) {
        String sql = "SELECT * FROM Courses WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, courseRowMapper, id);
    }

    public void save(Course course) {
        if (course.getId() == null) {
            String sql = "INSERT INTO Courses (year, semester, course_code, course_name, category, professor, credit) VALUES (?, ?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sql, course.getYear(), course.getSemester(), course.getCourseCode(),
                    course.getCourseName(), course.getCategory(), course.getProfessor(), course.getCredit());
        } else {
            String sql = "UPDATE Courses SET year = ?, semester = ?, course_code = ?, course_name = ?, category = ?, professor = ?, credit = ? WHERE id = ?";
            jdbcTemplate.update(sql, course.getYear(), course.getSemester(), course.getCourseCode(),
                    course.getCourseName(), course.getCategory(), course.getProfessor(), course.getCredit(), course.getId());
        }
    }

    public void deleteById(Long id) {
        String sql = "DELETE FROM Courses WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
} 