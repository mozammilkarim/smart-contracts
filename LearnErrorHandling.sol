//  SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract LearnErrorHandling{
    string private name ;
    constructor(string memory _name){
        name=_name;
    }
    //@dev: here _name is used to check if owner knows old name 
    function guessName(string memory _name) public view returns(bool){
        require(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked(name)),"This is not the owner'S chosen name");
        return true;
    }
    //@dev: here _name represents old name to check if user knows old name, and _newName will be set 
    function changeName(string memory _name,string memory _newName) public view{
        //internally check is new name
        assert(bytes(_newName).length>0 && keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked(name)));
        //if user has chosen same name, revert the execution
        if(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked(_newName))){
            revert("Don't waste more gas");
        }
    }
}
