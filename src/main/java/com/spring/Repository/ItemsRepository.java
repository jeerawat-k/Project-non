package com.spring.Repository;



import com.spring.domain.Items;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ItemsRepository extends JpaSpecificationExecutor<Items>,JpaRepository<Items,Integer> {
}
