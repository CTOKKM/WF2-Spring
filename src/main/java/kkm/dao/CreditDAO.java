package kkm.dao;

import kkm.entity.Credit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CreditDAO {
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public CreditDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Credit> getCreditsByYear(Integer year) {
        String sql = "SELECT year, semester, SUM(CAST(credit AS DECIMAL)) as total_credits " +
                    "FROM Courses " +
                    (year != null ? "WHERE year = ? " : "") +
                    "GROUP BY year, semester " +
                    "ORDER BY year, semester";
        return year != null ? 
            jdbcTemplate.query(sql, new CreditRowMapper(), year) :
            jdbcTemplate.query(sql, new CreditRowMapper());
    }

    public List<Credit> getCreditDetails(Integer year, Integer semester) {
        String sql = "SELECT * FROM Courses WHERE year = ? AND semester = ?";
        return jdbcTemplate.query(sql, new CreditDetailRowMapper(), year, semester);
    }

    private static class CreditRowMapper implements RowMapper<Credit> {
        @Override
        public Credit mapRow(ResultSet rs, int rowNum) throws SQLException {
            Credit credit = new Credit();
            credit.setYear(rs.getInt("year"));
            credit.setSemester(rs.getInt("semester"));
            credit.setTotalCredits(rs.getInt("total_credits"));
            return credit;
        }
    }

    private static class CreditDetailRowMapper implements RowMapper<Credit> {
        @Override
        public Credit mapRow(ResultSet rs, int rowNum) throws SQLException {
            Credit credit = new Credit();
            credit.setYear(rs.getInt("year"));
            credit.setSemester(rs.getInt("semester"));
            credit.setTotalCredits(Integer.parseInt(rs.getString("credit")));
            credit.setCourseCode(rs.getString("course_code"));
            credit.setCourseName(rs.getString("course_name"));
            credit.setCategory(rs.getString("category"));
            credit.setProfessor(rs.getString("professor"));
            return credit;
        }
    }
} 