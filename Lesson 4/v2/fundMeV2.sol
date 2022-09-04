// Functionalities of contract: Get funds from user, Withdraw funds, set a minimum funding value USD 

// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

import "./priceConv.sol";

contract fundMe {
    using priceConv for uint256;

    uint256 public  minUSD = 50 * 1e18;
    address[] public funders;
    mapping (address=>uint256) public addressToAmountFunded;
    
    address public owner;

    constructor(){
        owner = msg.sender; // single equal set value to variable/ set parameter
    }

    function fund() public payable {
        // msg.value.getConversionRate();
        // We can add functions as if uint256 was an object/struct/contract that we created

        //require(getConvRate(msg.value)>= minUSD, "Didn't send enough"); // 1e18 == 1*10^18 == 1000000000000000000
        require(msg.value.getConvRate() >= minUSD, "Didn't send enough!"); 

        // If the first section is false then revert back with the error in the string ""
        // Revert: Undo any action before, send remaining gas back

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    } 

    function withdraw() public onlyOwner {
        //require(msg.sender == owner, "sender is not the owner!"); //\\ Double equal for checking if the parameters are equal 


        // for(starting index, ending index, step amount) \\ 1,10,2
        for(uint256 funderIndex = 0; funderIndex< funders.length; funderIndex++ ){
            address funder = funders[funderIndex]; //access the 0th index of funders array
            //now we have a funder address, a varible named funder of type address
            addressToAmountFunded[funder]=0;
        }
        // reset the array  
        funders = new address[](0);
        //actually withdraw the funds: 3 ways -> transfer, send, call

        /*
        // transfer - ( 2300 gas, throws error) If error, will revert the transation 
        payable(msg.sender).transfer(address(this).balance);
        // send - (2300 gas, returns bool) Won't error, will return if successful or not
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "send failed"); // if fails, we'll revert by our require statement
        */

        //call - Returns 2 varibles \\ forwards all gas or set gas, returns bool
        (bool callSuccess, /*bytes memory dataRetruned*/) = payable(msg.sender).call{value: address(this).balance}("");
        // since bytes objects are arrays, data returned should be kept in memory
        require (callSuccess, "Call Failed"); // requiring call success to be true or revert with an error         
    }
    modifier onlyOwner {
        require(msg.sender == owner, "sender is not the owner!");
        _; // _; for running the rest of the code, can be put above the statement
    }
}
