// Contract used for Week1 hw4.md Question 1
// Same as Contract_one.sol but to save storage slots similar type variables are 
// grouped together with the variables taking less memory listed above variables consuimng more

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Store {

    

    bool flag1;
    bool flag2;
    bool flag3;
    uint8 index;
    uint256 public number;
    address admin;
    address admin2;
    mapping (address=>uint256) balances;
    payments[8] topPayments;
    

    struct payments {
        bool valid;
        bool checked;
        uint8 paymentType;
        uint256 amount;
        uint256 finalAmount;
        uint256 initialAmount;
        address sender;
        address receiver;  
    }
    
    


    constructor(){

    }


    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}