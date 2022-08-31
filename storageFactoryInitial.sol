//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./simpleStorage.sol";

contract storageFactory {
    simpleStorage[] public ssArr;

    function createSimpleStorageContract() public{
        simpleStorage ssN  = new simpleStorage(); // "new" is deploying a contract here
        ssArr.push(ssN);

        //ssArr.push(simpleStorage());

    }
}
