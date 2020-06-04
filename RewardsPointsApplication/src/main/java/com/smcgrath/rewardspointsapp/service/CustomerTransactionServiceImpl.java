package com.smcgrath.rewardspointsapp.service;

import org.hibernate.exception.ConstraintViolationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smcgrath.rewardspointsapp.dao.RewardsRequest;
import com.smcgrath.rewardspointsapp.datasource.TransactionRepository;
import com.smcgrath.rewardspointsapp.model.CustomerTransaction;

@Service
public class CustomerTransactionServiceImpl implements CustomerTransactionService {

	private static final int hundred = 100;
	private static final int fifty = 50;

	@Autowired
	TransactionRepository transactionRepository;

	private static final Logger LOGGER = LoggerFactory.getLogger(CustomerTransactionServiceImpl.class);

	@Override
	public CustomerTransaction calculateRewards(RewardsRequest rewardsRequest) {

		LOGGER.info("DEBUG_BOMB: we are in calculateRewards():\n");
		int pointsOverfifty = 0;
		int pointsOverHundred = 0;
		int totalRewardPoints = 0;
		double transaction_amount = rewardsRequest.getTransactionAmount();

		if (transaction_amount >= hundred) {
			pointsOverHundred = (int) ((transaction_amount - hundred) * 2);
			pointsOverfifty = (int) ((transaction_amount - fifty) - (transaction_amount - hundred));

		} else if (transaction_amount >= fifty) {
			pointsOverfifty = (int) (transaction_amount - fifty);
		}

		if (pointsOverHundred > 0 || pointsOverfifty > 0) {
			totalRewardPoints = pointsOverHundred + pointsOverfifty;
		} else {
			totalRewardPoints = 0;
		}

		CustomerTransaction customerTransaction = new CustomerTransaction();
		customerTransaction.setCustomer_id(rewardsRequest.getCustomerId());
		customerTransaction.setTransaction_amount(transaction_amount);
		customerTransaction.setTransaction_date(rewardsRequest.getTransactionDate());
		customerTransaction.setRewards_points(totalRewardPoints);
		try {
			CustomerTransaction savedTransaction = transactionRepository.save(customerTransaction);
			return savedTransaction;
		} catch (ConstraintViolationException e) {
			LOGGER.info("ERROR - [" + e + "]");
			return null;
		}
	}

}
