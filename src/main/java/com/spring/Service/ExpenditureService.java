package com.spring.Service;

import com.spring.domain.Expenditure;

import java.util.*;

public interface ExpenditureService {
    public List<Expenditure> getExpenditureById();
    public List<Map<String,Object>> insertExpenditure (String json);


}
