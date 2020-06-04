package com.smcgrath.rewardspointsapp.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "customertransaction")
public class CustomerTransaction extends AbstractEntity {

	@NotBlank
	private String customer_id;
	private double transaction_amount;
	private Date transaction_date;
	private int rewards_points;

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public double getTransaction_amount() {
		return transaction_amount;
	}

	public void setTransaction_amount(double transaction_amount) {
		this.transaction_amount = transaction_amount;
	}

	public Date getTransaction_date() {
		return transaction_date;
	}

	public void setTransaction_date(Date transaction_date) {
		this.transaction_date = transaction_date;
	}

	public int getRewards_points() {
		return rewards_points;
	}

	public void setRewards_points(int rewards_points) {
		this.rewards_points = rewards_points;
	}

	@Override
	public String toString() {
		return "CustomerTransaction [customer_id=" + customer_id + ", transaction_amount=" + transaction_amount
				+ ", transaction_date=" + transaction_date + ", rewards_points=" + rewards_points + "]";
	}

}