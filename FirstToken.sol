// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/token/ERC20/ERC20.sol";

contract FirstToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("FirstToken", "FST") {
        _mint(msg.sender, initialSupply);
    }
}