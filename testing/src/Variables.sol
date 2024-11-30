// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Variables {
    // state vars are stored on chain
    string public text = "Ayyy";
    uint256 public num = 1233;

    function doSomething() public pure {
        // local vars are note stored on chain
        uint256 i = 456;
    }

    // global vars
    uint256 timestamp = block.timestamp; // current block timestamp
    address sender = msg.sender; // address of the caller

}