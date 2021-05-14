// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage {
    // library usage

    // state variables
    uint256 private _storedData;

    // events

    // constructor
    /*
    constructor(uint256 storedData_) {
        _storedData = storedData_;
    }
    */

    // modifiers

    // functions
    function setStoredData(uint256 storedData_) public {
        _storedData = storedData_;
    }
    
    function storedData() public view returns (uint256) {
        return _storedData;
    }
    
}