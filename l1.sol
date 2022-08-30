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



    
    // visibility is set to private by default if "public" is not declared after the datatype
    // writing "public" is secretly declaring a function which returns the fNum

    // Automatically becomes a storage varible as it is not defined in any function
    uint256 fNum;  // By default set to 0 if not defined 
    mapping (string => uint256) public nameToFavNum; //nameToFavNum is the name of the Map
    // We have a dictionary where every single name is mapped to specific number 
    // Map is an Associative Array. Like a Dictionary.

    

    struct People {
        // created a new type called People
        
        string name;
        uint256 fNum;
        // serial of the array push depends on which variable was defined first
    }

    //People public person = People({fNum: 2, name: "Flame"});  // using {} inside to tell it is grabbed from struct
    // better to declare in an array for storing multiple data

    uint256[] public fNumList;  // "fNumList" is the name of the array fNumList[]
    People [] public peopleArr; // "peopleArr" is the name of the array People[]



    function strore( uint256 _fNum) public { 
        // Changes fNum to a new value we give in _fNum
        fNum = _fNum;
        //fNum = fNum+1; // The more stuff you do, higher gas fees required
    }

    // view, pure functions only Read State of the blockchain, so no gas required
    function retrieve() public view returns (uint256){
        return fNum;
    }

    /*
    Storage: Permanent variables that can be modified
    Memory: Temporary variables that can be modified
    Calldata: Temporary variable that can’t be modified

    */




    // can be calldata instead of memory as we won't modify the name
    // cannot give Storage for string data in function
    function addPerson(string memory _name, uint256 _fNum) public {
        // data location only required for array, struct or mapping types so not required for uint256
        // uint256 in memory by default not same for String as it is an Array of Bytes
        // Array, Struct, Mapping special types in solidity

        // creating newPerson object then push
        //People memory newPerson = People({name: _name, fNum: _fNum}); // Explicit definition

        People memory newPerson = People(_name, _fNum); // Remove description & {}
        peopleArr.push(newPerson);
         
        //peopleArr.push(People(_name, _fNum));  // replace newPerson with the R.H.S.
        // Single line push     

        nameToFavNum[_name] =_fNum; // A number is being mapped to string
        // The variable of key from the map is kept in [] and the variable pinned to the key is in R.H.S.

        // _name = "cat"; won't show error for memory but error for calldata
    }

    // calling a view function is free unless you are calling it from a function that costs gas
    // function add() public pure returns(uint256){
    //     return(1+1); 
        // No change of state on the blockchain
    //}
}
