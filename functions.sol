// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract simpleStorage{
    //boolean, uint, int, address, bytes
    bool hasFav = true;
    uint numb = 256; // by default takes uint256 if not defined,     
    string numberS = "Six";
    int negNum = -7;
    address myAddress = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    bytes32 favCat = "cat"; //cat is a string but can be converter to bytes objects, look like 0x34asd  

    uint256 public fNum;  // By default set to 0 if not defined 
    // visibility is set to private by default if "public" is not declared after the datatype
    // writing "public" is secretly declaring a function which returns the fNum

    function strore( uint256 _fNum) public { 
        // Changes fNum to a new value we give in _fNum
        fNum = _fNum;
        //fNum = fNum+1; // The more stuff you do, higher gas fees required
    }

    // view, pure functions only Read State of the blockchain, so no gas required
    function retrieve() public view returns (uint256){
        return fNum;
    }

    // calling a view function is free unless you are calling it from a function that costs gas
    function add() public pure returns(uint256){
        return(1+1); 
        // No change of state on the blockchain
    }
}
