// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {
    string public constant TOKEN_NAME = "ScumCoin";
    string public constant TOKEN_ABBRV = "SCM";
    uint public totalSupply = 0;

    // mapping variable here
    mapping(address => uint) public balances;

    // mint function
    function mint(address sender, uint amount) public {
        // require a minimum amoun of 100
        require(amount >= 100, "Mint amount must be a minimum of 100"); 

        totalSupply += amount;
        balances[sender] += amount;

        // Assert that totalSupply is not negative
        assert(totalSupply >= amount);
    }

    // burn function
    function burn(address sender, uint amount) public {
        require(balances[sender] >= amount, "Insufficient balance");
        //if (balances[sender] < amount) return;

        totalSupply -= amount;
        balances[sender] -= amount;

        // Assert that totalSupply does not drop below zero
        assert(totalSupply >= 0);

        // Additional check to ensure the sender's balance is correct
        if (balances[sender] < 0) {
            revert("Balance cannot be negative");
        }
    }
}