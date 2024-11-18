/*
 * Copyright (c) 2018 The Pigeon Core developers
 * Distributed under the MIT software license, see the accompanying
 * file COPYING or http://www.opensource.org/licenses/mit-license.php.
 * 
 * FounderPayment.h
 *
 *  Created on: Jun 24, 2018
 *      Author: Tri Nguyen
 */

#ifndef SRC_FOUNDERPAYMENT_H_
#define SRC_FOUNDERPAYMENT_H_
#include <string>
#include "amount.h"
#include "primitives/transaction.h"
#include "script/standard.h"

// using namespace std;

// static const std::string DEFAULT_FOUNDER_ADDRESS = "se2fwN7zKxyz8MfjgvUYpov6YTZLZt4Hyf";
struct FounderRewardStrcuture {
	int blockHeight;
	int rewardPercentage;
};

class FounderPayment {
public:
	FounderPayment(std::vector<FounderRewardStrcuture> rewardStructures = {}, int startBlock = 0, const std::string &address = "") {
		this->founderAddress = address;
		this->startBlock = startBlock;
		this->rewardStructures = rewardStructures;
	}
	~FounderPayment(){};
	CAmount getFounderPaymentAmount(int blockHeight, CAmount blockReward);
	void FillFounderPayment(CMutableTransaction& txNew, int nBlockHeight, CAmount blockReward, CTxOut& txoutFounderRet);
	bool IsBlockPayeeValid(const CTransaction& txNew, const int height, const CAmount blockReward);
	int getStartBlock() {return this->startBlock;}
private:
	std::string founderAddress;
	int startBlock;
	std::vector<FounderRewardStrcuture> rewardStructures;
};



#endif /* SRC_FOUNDERPAYMENT_H_ */