package kkm.controller;

import kkm.entity.Credit;
import kkm.service.CreditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Map;

@Controller
public class CreditController {
    private final CreditService creditService;

    @Autowired
    public CreditController(CreditService creditService) {
        this.creditService = creditService;
    }

    @GetMapping("/credits")
    public String showCredits(Model model) {
        Map<Integer, List<Credit>> creditsByYear = creditService.getCreditsByAllYears();
        model.addAttribute("creditsByYear", creditsByYear);
        return "credits/list";
    }

    @GetMapping("/credits/{year}")
    public String showCreditDetails(@PathVariable Integer year, Model model) {
        List<Credit> credits = creditService.getCreditsByYear(year);
        model.addAttribute("year", year);
        model.addAttribute("credits", credits);
        return "credits/details";
    }

    @GetMapping("/credits/{year}/{semester}")
    public String showSemesterDetails(@PathVariable Integer year, 
                                    @PathVariable Integer semester, 
                                    Model model) {
        List<Credit> details = creditService.getCreditDetails(year, semester);
        model.addAttribute("year", year);
        model.addAttribute("semester", semester);
        model.addAttribute("details", details);
        return "credits/semester-details";
    }
} 