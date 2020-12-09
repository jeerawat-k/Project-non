package com.spring.Service;

import com.spring.Repository.ExpenditureCustomRepository;
import com.spring.Repository.ExpenditureRepository;
import com.spring.Repository.ItemsRepository;
import com.spring.Repository.UserRepository;
import com.spring.domain.Expenditure;
import com.spring.domain.Items;
import com.spring.domain.User;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ExpenditureServiceImpl implements ExpenditureService{
    @Autowired
    ExpenditureRepository expenditureRepository;

    @Autowired
    ExpenditureCustomRepository expenditureCustomRepository;

    @Autowired
    ItemsRepository itemsRepository;

    @Autowired
    UserRepository userRepository;


    @Override
    public List<Expenditure> getExpenditureAll() {
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
    public    List<Map<String,Object>> getExpenditureByUserID(String userId) {
        try{
            List<Map<String,Object>> resultList = expenditureCustomRepository.getExpenditureByUserId(userId);
            System.out.println("resultList : "+resultList.size());
            return resultList;
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    @Transactional
    public List<Map<String, Object>> insertExpenditure(String json) {
        List<Map<String, Object>> result = new ArrayList<>();
        Map<String,Object> map = new HashMap<>();
        try{

            JSONObject jsonObject = new JSONObject(json);
            Double incomeVal = jsonObject.get("income").toString()=="" ? 0d:  Double.parseDouble(jsonObject.get("income").toString());
            Double amountVal = jsonObject.get("amount").toString()=="" ? 0d:  Double.parseDouble(jsonObject.get("amount").toString());
            Integer userId = Integer.parseInt(jsonObject.get("user").toString());
            Integer itemId = Integer.parseInt(jsonObject.get("itemId").toString());
            Expenditure expenditureNew = new Expenditure();
            Items items = new Items();

            items = itemsRepository.findOne(itemId);
            User user = new User();
            user = userRepository.findOne(userId);
            expenditureNew.setItems(items);
            expenditureNew.setUser(user);
            expenditureNew.setAmount(amountVal);
            expenditureNew.setIncome(incomeVal);
            expenditureRepository.save(expenditureNew);
            map.put("status","01");
            result.add(map);
        }catch (Exception e){
            map.put("status","02");
            result.add(map);
            System.out.println("Error : "+e);
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }finally {
            return result;
        }

    }


}
