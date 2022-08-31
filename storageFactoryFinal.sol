//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./simpleStorage.sol";

contract storageFactory {
    simpleStorage[] public ssArr; //simpleStorage is a contract here, being saved as an array of contracts called ssArr
    // Addresses being stored in this array

    /*
    storageFactory contract allows us to create simpleStorage contracts
    Then saves to ssArr array
    From there we can call diffent functions on i.e. store value, read value from for any simpleStorage contracts created
    */

    function createSimpleStorageContract() public{
        simpleStorage ssN  = new simpleStorage(); // "new" is deploying a contract here, (created and deployed), 
        // ssN is being saved as a memory variable
        ssArr.push(ssN);

        //ssArr.push(simpleStorage()); // will not work like this for a contract

    }

    function sfStore (uint256 _ssIndex, uint256 _ssNum) public {
        // Address
        // ABI - Application Binary Interface

        //simpleStorage ssN = simpleStorage(ssArr[_ssIndex]); // '()' for accessing elements of the array 
        // If it was array of address[] of contract objects instead of simpleStorage[] we'd use^^^

        //since simpleStorage[] is an array of simpleStorage contracts, we can acccess it using the index
        simpleStorage ssN = ssArr[_ssIndex]; // saving the contract object at the index _ssIndex to sStorage var.
        // ssArr is keeping track of the addresses and ABI comes from the contract
        ssN.store(_ssNum);

        //ssArr[_ssIndex].store(_ssNum); //\\ single line execution


    }

    function sfGet(uint256 _ssIndex) public view returns (uint256) {
        simpleStorage ssN = ssArr[_ssIndex]; // using the same syntax from above to get the contract
        return ssN.retrieve(); // to get the number we stored in the above function

        //return ssArr[_ssIndex].retrieve(); //\\ single line execution
    }
    // we can call retrieve function directly on ssArr[_ssIndex] which returns a simpleStorage object (ssN)
}
