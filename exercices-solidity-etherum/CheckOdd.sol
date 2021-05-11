// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CheckOdd {
    // library usage

    // state variables

    // events

    // constructor

    // modifiers

    // functions
    function check(uint256 number) public pure returns(bool) {
        if (number%2 == 0) return true;
        else return false;
    }
    
}