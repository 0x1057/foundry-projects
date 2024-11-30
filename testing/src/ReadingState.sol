// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ReadingState {
    uint256 public num;

    // must send a tansaction to write to state var
    function set(uint256 _num) public {
        num = _num;
    }

    // can read from state var without transacting
    function get() public view returns (uint256) {
        return num;
    }

}