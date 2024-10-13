// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

// Only contract owner should be able to mint tokens
// Any user can transfer tokens
// Any user can burn tokens

contract CorToken is ERC20, ERC20Burnable, Ownable {
    constructor(address initialOwner) 
        ERC20("CoinOfRadius", "COR")
        Ownable(initialOwner)
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}