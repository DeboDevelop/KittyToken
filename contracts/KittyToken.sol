// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract KittyToken is ERC20Capped, ERC20Burnable {
    address payable public owner;
    uint256 public blockReward;
    constructor(uint256 cap, uint256 initialMint, uint256 reward) ERC20("KittyToken", "KYT") ERC20Capped(cap * (10 ** decimals())) {
        owner = payable(msg.sender);
        _mint(owner, initialMint * (10 ** decimals()));
        blockReward = reward * (10 ** decimals());
    }

    function _mint(address account, uint256 amount) internal override(ERC20Capped, ERC20) {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        super._mint(account, amount);
    }

    function setBlockReward(uint256 reward) public onlyOwner {
        blockReward = reward * (10 ** decimals());
    }

    function _mintMinerReward() internal {
        _mint(block.coinbase, blockReward);
    }

    function _beforeTokenTransfer(address from, address to,uint256 value) internal override {
        if (from != address(0) && to != address(0) && to != block.coinbase) {
            _mintMinerReward();
        }
        super._beforeTokenTransfer(from, to, value);
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only Owner can call this function");
        _;
    }
}