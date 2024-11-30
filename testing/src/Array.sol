// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Array {
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];

    uint256[10] public myFixedSizeArr;

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    // can return entire arr (avoid for arr that grow indef)
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 index) public {
        // del does not change arr length
        // resets val deleted to def val: 0
        delete arr[index];
    }

    function examples() external pure {
        // only fixed size can be created in mem
        uint256[] memory a = new uint256[](5);
    }
}