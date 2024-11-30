// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract GasPrice {
    uint256 public i = 0;

    // using up all gas sent causes transact fail
    // state changes undone
    // gas spent not refunded

    function forever() public {
        // loop until all gas spent + transact fails
        while(true) { i += 1; }
    }
}