// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts@4.9.1/token/ERC20/ERC20.sol";

contract KittyToken is ERC20 {
    address payable public owner;
    constructor(uint256 intialSupply) ERC20("KittyToken", "KYT") {
        owner = msg.sender
        _mint(owner, intialSupply);
    }
}