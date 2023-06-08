// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts@4.9.1/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.1/token/ERC20/extensions/ERC20Capped.sol";

contract KittyToken is ERC20Capped {
    address payable public owner;
    constructor(uint256 cap) ERC20("KittyToken", "KYT") ERC20Capped(cap * (10 ** decimals())) {
        owner = msg.sender
        _mint(owner, 70000 * (10 ** decimals()));
    }
}