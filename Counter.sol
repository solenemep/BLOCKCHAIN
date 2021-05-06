// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Counter {
    // '_' when private
  address private _owner1; 
  address private _owner2;
  uint256 private _counter;
  uint256 private _step;

  constructor(uint256 step_) {
    // the one that deploys is owner1
    _owner1 = msg.sender; 
    _step = step_;
  }
  
  function setOwner() public {
      require(msg.sender == _owner1, "Counter: Only owner1 can set owner2");
  }

  function increment() public {
      require(msg.sender == _owner1 || msg.sender == _owner2, "Counter: Only owners can increment counter");
      _counter += _step;
  }
  
    function decrement() public {
      require(msg.sender == _owner1 || msg.sender == _owner2, "Counter: Only owners can decrement counter");
      _counter -= _step;
  }

  function reset() public {
      require(msg.sender == _owner1 || msg.sender == _owner2, "Counter: Only owners can reset counter");
      _counter = 0;
  }

  function owner1() public view returns (address) {
      return _owner1;
  }
    function owner2() public view returns (address) {
      return _owner2;
  }

  function counter() public view returns (uint256) {
      return _counter;
  }

  function step() public view returns (uint256) {
      return _step;
  }

}