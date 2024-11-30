// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract PrimitiveTypes {
    bool public boo = true;

    // uint stands for unsigned integer (no negatives)
    // uint8 range 0 to 2 ** 8 - 1
    // uint16 range 0 to 2 ** 16 - 1
    // uint256 range 0 to 2 ** 256 - 1

    uint8 public u8 = 1;
    uint16 public u16 = 55;
    uint256 public u256 = 456;
    uint public u = 12; // uint is an alias for uint256

    // negative numbers are allowed for int types
    // diff ranges available for int8 to int256 etc
    // int256 range -2 ** 255 to 2 ** 255 - 1
    // int128 range -2 ** 127 to 2 ** 127 - 1

    int8 public i8 = -1;
    int256 public i256 = 456;
    int256 public i = -123;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    // byte reps seq of bytes
    // 2 bytes types:
    // - fixed-sized byte arrays
    // - dynamically-sized byte arrays
    bytes1 a = 0xb5;
    bytes1 b = 0x56;

    // unassigned vars have default value
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
    


}