// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";
import "../Ownable.sol";

contract CheckOdd is Ownable {
    // library usage
    using Address for address payable;

    // state variables
    address private _owner; 
    uint256 public result;
    uint256 private _profit;
    uint256 private _nbOp;

    // events
    event Calculated(uint256 result);
    event Withdrew(address indexed recipient, uint256);

    // constructor
    constructor(address owner_) Ownable(_owner) {
        
    }

    // modifiers
    // Le modifier onlyOwner a été défini dans le smart contract Ownable

    // functions
    function add(uint256 nb1_, uint256 nb2_) public returns (uint256) {
        require(msg.value == 0.001 , "PayableCalculator: Fees are 1 finney");
        _deposit(owner_, msg.value);
        _profit += msg.value;
        _nbOp += 1;
        return result = nb1_ + nb2_; 
        emit Calculated(result);
    }
    function sub(uint256 nb1_, uint256 nb2_) public returns (uint256) {
        require(msg.value == 0.001 , "PayableCalculator: Fees are 1 finney");
        _deposit(owner_, msg.value);
        _profit += msg.value;
        _nbOp += 1;
        return result = nb1_ - nb2_; 
        emit Calculated(result);
    }
    function mul(uint256 nb1_, uint256 nb2_) public returns (uint256) {
        require(msg.value == 0.001 , "PayableCalculator: Fees are 1 finney");
        _deposit(owner_, msg.value);
        _profit += msg.value;
        _nbOp += 1;
        return result = nb1_ * nb2_; 
        emit Calculated(result);
    }
    function div(uint256 nb1_, uint256 nb2_) public returns (uint256) {
        require(msg.value == 0.001 , "PayableCalculator: Fees are 1 finney");
        _deposit(owner_, msg.value);
        _profit += msg.value;
        _nbOp += 1;
        return result = nb1_ / nb2_; 
        emit Calculated(result);
    }
    function mod(uint256 nb1_, uint256 nb2_) public returns (uint256) {
        require(msg.value == 0.001 , "PayableCalculator: Fees are 1 finney");
        _deposit(owner_, msg.value);
        _profit += msg.value;
        _nbOp += 1;
        return result = nb1_ % nb2_; 
        emit Calculated(result);
    }
    
    function _withdraw() public onlyOwner {
        require(_profit > 0, "PayableCalculator: can not withdraw 0 ether");
        uint256 amount = _profit;
        _profit = 0;
        payable(msg.sender).sendValue(amount);
        emit Withdrew(msg.sender, amount);
    }
    
    function getNbOp() public onlyOwner returns (uint256) {
        return _nbOp;
    }
}