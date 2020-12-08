package com.spring.Service;

import com.spring.Repository.ItemsRepository;
import com.spring.domain.Items;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ItemsServiceImpl implements ItemsService {
    @Autowired
    ItemsRepository itemsRepository;
    @Override
    public List<Map<String, Object>> insertItems(String json) {
        List<Map<String, Object>> result = new ArrayList<>();
        Map<String,Object> map = new HashMap<>();
        try{
            Items items = new Items();
            JSONObject jsonObject = new JSONObject(json);
            items.setItemName(jsonObject.getString("items").toString());
            items.setFlg(jsonObject.getString("statusFlg").toString());
            itemsRepository.save(items);
            System.out.println("Save Success");
            map.put("status","01");
            result.add(map);

        }catch (Exception e){
            map.put("status","02");
            result.add(map);
            System.out.println("Error : "+e);
            throw new RuntimeException(e.getMessage());
        }finally {
            return result;
        }
    }

    @Override
    public List<Items> findAllItems() {
        try{
            return itemsRepository.findAll();
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }
}
