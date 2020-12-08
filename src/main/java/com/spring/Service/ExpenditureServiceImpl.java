package com.spring.Service;

import com.spring.Repository.ExpenditureRepository;
import com.spring.Repository.ItemsRepository;
import com.spring.domain.Expenditure;
import com.spring.domain.Items;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ExpenditureServiceImpl implements ExpenditureService{
    @Autowired
    ExpenditureRepository expenditureRepository;


    @Override
    public List<Expenditure> getExpenditureById() {
        try{
            Expenditure expenditure = new Expenditure();

            List<Expenditure> reuslt  = expenditureRepository.findAll();
            System.out.println("result : "+reuslt.size());
            return reuslt;
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }

    }

    @Override
    @Transactional
    public List<Map<String, Object>> insertExpenditure(String json) {
        try{
            JSONObject jsonObject = new JSONObject(json);
            System.out.println(jsonObject.get("item").toString());

            return null;
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }

    }


}
