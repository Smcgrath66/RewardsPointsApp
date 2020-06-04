package com.smcgrath.rewardspointsapp.service;


import com.smcgrath.rewardspointsapp.dao.RewardsRequest;
import com.smcgrath.rewardspointsapp.model.CustomerTransaction;

public interface CustomerTransactionService {

	public CustomerTransaction calculateRewards(RewardsRequest rewardsRequest);

	
}
