// Functionalities of contract: Get funds from user, Withdraw funds, set a minimum funding value USD 

// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract fundMe {

    uint256 public  minUSD = 50 * 1e18;

    function fund() public payable {

        
        require(getConvRate(msg.value)>= minUSD, "Didn't send enough"); // 1e18 == 1*10^18 == 1000000000000000000

        // If the first section is false then revert back with the error in the string ""
        // Revert: Undo any action before, send remaining gas back

    }

    function getPrice() public view returns (uint256) {
        // Since we are interacting with a contract outside our project we will need ABI and Address 

        //Create an AggregatorV3Interface variable(datatype) called priceFeed
        // Contract at 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e address will have all functionalities of AV3IntF
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);        
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConvRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethInUSD = (ethPrice*ethAmount)/1e18; // always +,* in solidity before /
        return ethInUSD;
    }

    function withdraw() public {

    }
}
