// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// make sure EVM version and VM set to Cancun (01.25.25)

// Storage - data is stored on-chain
// Memory - data is cleared out after a function call
// Transient Storage - data is cleared out after a transaction

interface ITest {
    function val() external view returns (uint256);
    function test() external;
}

// Contract for tetsting TestStorage and TestTransientStorage
// Shows the difference between normal storage and transient storage
contract Callback {
    uint256 public val;

    fallback() external {
        val = ITest(msg.sender).val();
    }

    function test(address target) external {
        ITest(target).test();
    }
}

contract TestStorage {
    uint256 public val;

    function test() public {
        val = 123;
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract TestTransientStorage {
    bytes32 constant SLOT = 0;

    function test() public {
        assembly {
            tstore(SLOT, 321)
        }
        bytes memory b = "";
        msg.sender.call(b);
    }

    function val() public view returns (uint256 v) {
        assembly {
            v := tload(SLOT)
        }
    }
}

// Contract for testing reentrancy protection
contract MaliciousCallback {
    uint256 public count = 0;

    // try to re-enter the target contract multiple times
    fallback() external {
        ITest(msg.sender).test();
    }

    // test function to initiate reentrance attack
    function attack(address _target) external {
        // first call to test()
        ITest(_target).test();
    }
}

contract ReentrancyGuard {
    bool private locked;

    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    function test() public lock {
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract ReentrancyTransient {
    bytes32 constant SLOT = 0;

    modifier lock() {
        assembly {
            if tload(SLOT) {revert(0, 0) }
            tstore(SLOT, 1)
        }
        _;
        assembly {
            tstore(SLOT, 0)
        }
    }

    function test() external lock {
        // ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}