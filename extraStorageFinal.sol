// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./simpleStorage.sol";

// contract extraStorage inherits all the functions of simpleStorage, acts a child to simpleStorage

contract extraStorage is simpleStorage {
    // virtual & override
    function store (uint256 _fNum) public override {
        fNum = _fNum +5 ;
    }
}
