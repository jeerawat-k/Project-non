package com.spring.Repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.util.*;

@Repository
public class ExpenditureCustomRepository {
    @Autowired
    private JdbcTemplate jdbcTemplateSQLLite;

    public List<Map<String,Object>> getExpenditureByUserId(String userId){
        List<Map<String,Object>> resultList = new ArrayList<>();
        Map<String,Object> map = new HashMap<>();
        StringBuilder sql = new StringBuilder();
        try{
            sql.append(" SELECT E.ID AS ID_EXPENDITURE \n ");
            sql.append(" ,E.ID_ITEM \n ");
            sql.append(" ,E.ID_USER \n ");
            sql.append(" ,E.INCOME \n ");
            sql.append(" ,E.FLG \n ");
            sql.append(" ,E.AMOUNT \n ");
            sql.append(" ,U.ID AS CODE_USER \n ");
            sql.append(" ,U.NAME AS USER_NAME \n ");
            sql.append(" ,U.AGE \n ");
            sql.append(" ,I.ID AS CODE_ITEM \n ");
            sql.append(" ,I.ITEM_NAME,E.CREATE_DATE,E.REMARK \n ");
            sql.append(" FROM EXPENDITURE E \n ");
            sql.append(" INNER JOIN USER U ON E.ID_USER = U.ID \n ");
            sql.append(" INNER JOIN ITEMS I ON E.ID_ITEM = I.ID \n ");
            sql.append(" WHERE E.ID_USER = '"+userId+"' \n ");
            System.out.println(" SQL : "+sql.toString());
            resultList = jdbcTemplateSQLLite.queryForList(sql.toString());

            return resultList;
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }

}
