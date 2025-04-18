package kkm.controller;

import kkm.entity.Course;
import kkm.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CourseController {
    private final CourseService courseService;

    @Autowired
    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/courses")
    public String listCourses(Model model) {
        List<Course> courses = courseService.getAllCourses();
        model.addAttribute("courses", courses);
        return "course/list";
    }

    @GetMapping("/courses/search")
    public String searchCourses(@RequestParam(required = false) Integer year,
                              @RequestParam(required = false) Integer semester,
                              @RequestParam(required = false) String category,
                              @RequestParam(required = false) String professor,
                              @RequestParam(required = false) String courseName,
                              Model model) {
        List<Course> courses;
        
        if (year != null && semester != null) {
            courses = courseService.getCoursesByYearAndSemester(year, semester);
        } else if (category != null && !category.isEmpty()) {
            courses = courseService.getCoursesByCategory(category);
        } else if (professor != null && !professor.isEmpty()) {
            courses = courseService.getCoursesByProfessor(professor);
        } else if (courseName != null && !courseName.isEmpty()) {
            courses = courseService.searchCoursesByName(courseName);
        } else {
            courses = courseService.getAllCourses();
        }
        
        model.addAttribute("courses", courses);
        return "course/list";
    }

    @GetMapping("/courses/new")
    public String showCourseForm(Model model) {
        Course course = new Course();
        course.setYear(2025);  // 기본값 설정
        course.setSemester(2); // 기본값 설정
        model.addAttribute("course", course);
        return "course/form";
    }

    @PostMapping("/courses/save")
    public String saveCourse(@Validated @ModelAttribute Course course, 
                           BindingResult bindingResult,
                           Model model) {
        if (bindingResult.hasErrors()) {
            return "course/form";
        }

        // 2025년 2학기인지 확인
        if (course.getYear() != 2025 || course.getSemester() != 2) {
            bindingResult.rejectValue("year", "error.course", "2025년 2학기만 수강 신청이 가능합니다.");
            return "course/form";
        }

        courseService.saveCourse(course);
        return "redirect:/courses";
    }

    @GetMapping("/courses/edit/{id}")
    public String editCourse(@PathVariable Long id, Model model) {
        Course course = courseService.getCourseById(id);
        model.addAttribute("course", course);
        return "course/form";
    }

    @GetMapping("/courses/delete/{id}")
    public String deleteCourse(@PathVariable Long id) {
        courseService.deleteCourse(id);
        return "redirect:/courses";
    }
} 