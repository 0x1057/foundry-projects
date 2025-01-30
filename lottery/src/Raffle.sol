// Layout of the contract file:
// version
// imports
// errors
// interfaces, libraries, contract

// Inside Contract:
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private

// view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @title A lottery/raffle contract
 * @author Zachary Childress
 * @notice This contract is for creating a lottery raffle
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    /* Errors (placed here for testing) */
    error Raffle__NotEnoughEthSent();

    uint256 private immutable i_entranceFee;
    uint256 private immutable i_interval;
    address payable[] private s_players; // store addresses that enter the raffle
    uint256 private s_lastTimeStamp;

    /* Events */
    event EnteredRaffle(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        // @dev the duration of the lottery in seconds
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        //require(msg.value >= i_extranceFee, "Not enough ETH sent");
        if(msg.value < i_entranceFee) revert Raffle__NotEnoughEthSent();
        s_players.push(payable(msg.sender)); // push caller address into players list
        emit EnteredRaffle(msg.sender);
    }

    function pickWinner() external {
        // check to see if enough time has passed
        if (block.timestamp - s_lastTimeStamp < i_interval) revert();
    }

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}