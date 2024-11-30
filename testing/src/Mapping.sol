// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Mapping {
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        // mapping always returns a value
        // if val was never set it will return default
        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public {
        // update the value at this addy
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // reset the val to the default
        delete myMap[_addr];
    }
}

contract NestedMapping {
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address _addr1, uint256 _i) public view returns (bool) {
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint256 _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint256 _i) public {
        delete nested[_addr1][_i];
    }
}