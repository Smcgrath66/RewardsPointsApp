package com.smcgrath.rewardspointsapp.datasource;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.smcgrath.rewardspointsapp.model.CustomerTransaction;

public interface TransactionRepository extends JpaRepository<CustomerTransaction, Long> {
	@Query(value = "select customer_id, TO_CHAR(transaction_date,'Month') as monthname, sum(rewards_points) from CustomerTransaction group by TO_CHAR(transaction_date,'Month'),customer_id order by customer_id", nativeQuery = true)
	List<Object[]> rewardsPointsPerMonth();

	@Query(value = "select customer_id,sum(rewards_points) from CustomerTransaction group by customer_id order by customer_id", nativeQuery = true)
	List<Object[]> totalRewardsPoints();
}
