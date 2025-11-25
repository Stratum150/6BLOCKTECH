//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingExample {
//Define a mapping to store values associated with addresses
mapping(address => uint256) public valueMapping;

//Function to set a value to sender's address
function setValue(uint256 _value) public {
valueMapping[msg.sender] = _value;
}

//Function to retrieve the value associated with sender's address
function getValue() public view returns (uint256) {
return valueMapping[msg.sender];
}
}