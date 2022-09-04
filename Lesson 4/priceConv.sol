// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library priceConv {

    function getPrice() internal view returns (uint256) {
        // Since we are interacting with a contract outside our project we will need ABI and Address 

        //Create an AggregatorV3Interface variable(datatype) called priceFeed
        // Contract at 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e address will have all functionalities of AV3IntF
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);        
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10); 
        //ETH in terms of USD 3000.00000000 No decimals in solidity
    }

    function getVersion() internal view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    function getConvRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethInUSD = (ethPrice*ethAmount)/1e18; // always +,* in solidity before /
        return ethInUSD;
    }

}
