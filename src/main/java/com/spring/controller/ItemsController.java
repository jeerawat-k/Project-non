package com.spring.controller;

import com.spring.Service.ItemsService;
import com.spring.domain.Expenditure;
import com.spring.domain.Items;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/itemsCon")
public class ItemsController {
    @Autowired
    ItemsService itemsService;

    @RequestMapping(value = "/ajaxInsertItems", method = RequestMethod.POST)
    public @ResponseBody
    List<Map<String,Object>> ajaxInsertItems(@RequestBody String json, HttpSession session){
        try{
            List<Map<String,Object>> result = itemsService.insertItems(json);
            return result;
        }catch (Exception e){
            System.out.println("Exception : "+e);
            throw new RuntimeException(e.getMessage());
        }
    }

    @RequestMapping(value = "/findAllItems", method = RequestMethod.GET)
    public @ResponseBody
    List<Items> findAllItems(HttpSession session){
        try{
            List<Items> result = itemsService.findAllItems();
            return result;
        }catch (Exception e){
            System.out.println("Exception : "+e);
            throw new RuntimeException(e.getMessage());
        }
    }
}
