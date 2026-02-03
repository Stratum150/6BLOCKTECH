//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ServiceFeeHash {
    function CalculateService(
        string memory firstName,
        string memory middleName,
        string memory lastName,
        uint8 serviceCode
    ) public pure returns (uint256 totalFee, bytes32 hashValue) {
        require(serviceCode == 1 || serviceCode == 2, "Invalid service code.");
        if (serviceCode == 1) {
            uint256 base = 10000;
            uint256 tax = (base * 12) / 10000;
            totalFee = base + tax;
        } else {
            uint256 base = 2000;
            uint256 serviceCharge = (base * 10) / 100;
            uint256 tax = (base * 12) / 100;
            totalFee = base + serviceCharge + tax;
        }

        bytes memory f = bytes(firstName);
        bytes memory m = bytes(middleName);
        bytes memory l = bytes(lastName);

        bytes1 firstCharFirst = f[0];
        bytes1 lastCharMiddle = m[m.length - 1];
        bytes1 firstCharLast = l[0];

        uint8 firstDigit = _firstDigit(totalFee);

        if (serviceCode == 1) {
            hashValue = keccak256(
                abi.encodePacked(
                    firstCharFirst,
                    lastCharMiddle,
                    firstCharLast,
                    serviceCode,
                    firstDigit
                )
            );
        } else {
            hashValue = keccak256(
                abi.encode(
                    firstCharFirst,
                    lastCharMiddle,
                    firstCharLast,
                    serviceCode,
                    firstDigit
                )
            );
        }
    }

           function _firstDigit(uint256 number) internal pure returns (uint8) {
            while (number >= 10) {
                number /=10;
            }
            return uint8(number);
        }
} 