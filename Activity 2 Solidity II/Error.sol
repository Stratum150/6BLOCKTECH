//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MappingExample {
//Define a mapping to store values associated with addresses
mapping(address => uint256) public valueMapping;

//Function to set a value for the sender's address
function setValue(uint256 _value) public {
//Ensure the value is not being set to zero
require(_value != 0, "Value cannot be zero.");
valueMapping[msg.sender] = _value;
}

//Function to retrieve the value associated with the sender's address
function getValue() public view returns (uint256) {
//Ensure the sender has a set value before retrieving
require(valueMapping[msg.sender] != 0, "No value set for sender.");
return valueMapping[msg.sender];
}
}