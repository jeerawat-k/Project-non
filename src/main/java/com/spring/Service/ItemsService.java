package com.spring.Service;

import com.spring.domain.Items;

import java.util.List;
import java.util.Map;

public interface ItemsService {
    public List<Map<String,Object>> insertItems (String json);
    public List<Items> findAllItems();
}
