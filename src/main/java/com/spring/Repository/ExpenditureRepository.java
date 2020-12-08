package com.spring.Repository;

import com.spring.domain.Expenditure;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ExpenditureRepository extends JpaSpecificationExecutor<Expenditure>, JpaRepository<Expenditure,Integer> {
}
