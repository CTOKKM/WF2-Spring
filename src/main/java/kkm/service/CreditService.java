package kkm.service;

import kkm.dao.CreditDAO;
import kkm.entity.Credit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class CreditService {
    private final CreditDAO creditDAO;

    @Autowired
    public CreditService(CreditDAO creditDAO) {
        this.creditDAO = creditDAO;
    }

    public List<Credit> getCreditsByYear(Integer year) {
        return creditDAO.getCreditsByYear(year);
    }

    public List<Credit> getCreditDetails(Integer year, Integer semester) {
        return creditDAO.getCreditDetails(year, semester);
    }

    public Map<Integer, List<Credit>> getCreditsByAllYears() {
        List<Credit> allCredits = creditDAO.getCreditsByYear(null);
        return allCredits.stream()
                .collect(Collectors.groupingBy(Credit::getYear));
    }
} 