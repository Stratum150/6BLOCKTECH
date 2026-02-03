//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LocationStringHash {
    string public fullName;

    string public barangayFirstTwo;
    string public cityFirstTwo;
    string public provinceLastTwo;
    string public countryLastTwo;

    string public combinedString;

    bytes32 public hashAbiEncode;
    bytes32 public hashAbiEncodePacked;

    constructor(string memory _fullName) {
        fullName = _fullName;
    }

    function processStrings(
        string memory barangay,
        string memory city,
        string memory province,
        string memory country
    ) public {
        barangayFirstTwo = _firstTwoChars(barangay);
        cityFirstTwo = _firstTwoChars(city);
        provinceLastTwo = _lastTwoChars(province);
        countryLastTwo = _lastTwoChars(country);

        combinedString = string(
            abi.encodePacked(
                barangayFirstTwo,
                cityFirstTwo,
                provinceLastTwo,
                countryLastTwo
            )
        );

        hashAbiEncode = keccak256(
            abi.encode(
                barangayFirstTwo,
                cityFirstTwo,
                provinceLastTwo,
                countryLastTwo
            )
        );

        hashAbiEncodePacked = keccak256(
            abi.encodePacked(
                barangayFirstTwo,
                cityFirstTwo,
                provinceLastTwo,
                countryLastTwo
            )
        );
    }

    function _firstTwoChars(string memory str) internal pure returns (string memory) {
        bytes memory b = bytes(str);
        require(b.length >= 2, "String too short");
        bytes memory result = new bytes(2);
        result[0] = b[0];
        result[1] = b[1];
        return string(result);
    }

    function _lastTwoChars(string memory str) internal pure returns (string memory) {
        bytes memory b = bytes(str);
        require(b.length >=2, "String too short");
        bytes memory result = new bytes(2);
        result[0] = b[b.length - 2];
        result[1] = b[b.length - 1];
        return string(result);
    }
}