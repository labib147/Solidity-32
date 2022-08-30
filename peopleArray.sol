// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Person{

    // visibility is set to private by default if "public" is not declared after the datatype
    // writing "public" is secretly declaring a function which returns the fNum
    uint256 fNum;  // By default set to 0 if not defined 
        

    struct People {
        // created a new type called People
        
        string name;
        uint256 fNum;
        // serial of the array push depends on which variable was defined first
    }
    uint256[] public fNumList;  // "fNumList" is the name of the array fNumList[]
    People [] public peopleArr; // "peopleArr" is the name of the array People[]

    function addPerson(string memory _name, uint256 _fNum) public {
        // creating newPerson object then push
        //People memory newPerson = People({name: _name, fNum: _fNum}); // Explicit definition
        
        People memory newPerson = People(_name, _fNum); // Remove description & {}
        peopleArr.push(newPerson);

        //peopleArr.push(People(_name, _fNum));  // replace newPerson with the R.H.S.
        // Single line push     
    }
}
