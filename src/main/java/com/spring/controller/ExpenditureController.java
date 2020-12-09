package com.spring.controller;

import com.spring.Service.ExpenditureService;
import com.spring.Service.ItemsService;
import com.spring.domain.Items;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/expenditureCon")
public class ExpenditureController {


    @Autowired
    ExpenditureService expenditureService;

    @RequestMapping(value = "/ajaxInsertExpenditureCon", method = RequestMethod.POST)
    public @ResponseBody
    List<Map<String,Object>> ajaxInsertItems(@RequestBody String json, HttpSession session){
        try{
            List<Map<String,Object>> result = expenditureService.insertExpenditure(json);
            return result;
        }catch (Exception e){
            System.out.println("Exception : "+e);
            throw new RuntimeException(e.getMessage());
        }
    }

    @RequestMapping(value = "/ajaxGetExpenditureByUserId", method = RequestMethod.GET)
    public @ResponseBody
    List<Map<String,Object>> ajaxGetExpenditureByUserId(@RequestParam String userId, HttpSession session){
        try{
            List<Map<String,Object>> result = expenditureService.getExpenditureByUserID(userId);
            return result;
        }catch (Exception e){
            System.out.println("Exception : "+e);
            throw new RuntimeException(e.getMessage());
        }
    }


}
