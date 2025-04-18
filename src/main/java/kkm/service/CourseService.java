package kkm.service;

import kkm.dao.CourseDAO;
import kkm.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {
    private final CourseDAO courseDAO;

    @Autowired
    public CourseService(CourseDAO courseDAO) {
        this.courseDAO = courseDAO;
    }

    public List<Course> getAllCourses() {
        return courseDAO.findAll();
    }

    public List<Course> getCoursesByYearAndSemester(Integer year, Integer semester) {
        return courseDAO.findByYearAndSemester(year, semester);
    }

    public List<Course> getCoursesByCategory(String category) {
        return courseDAO.findByCategory(category);
    }

    public List<Course> getCoursesByProfessor(String professor) {
        return courseDAO.findByProfessor(professor);
    }

    public List<Course> searchCoursesByName(String courseName) {
        return courseDAO.findByCourseNameContaining(courseName);
    }

    public Course getCourseById(Long id) {
        return courseDAO.findById(id);
    }

    public void saveCourse(Course course) {
        courseDAO.save(course);
    }

    public void deleteCourse(Long id) {
        courseDAO.deleteById(id);
    }
} 