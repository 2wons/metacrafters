# Token Contract

A simple token contract for **ScumCoin (SCM)**, with minting and burning functions.

## Description

This contract creates a basic token called **ScumCoin (SCM)**. It tracks token balances, allows minting new tokens to an address, and burning tokens from an address. The total supply adjusts as tokens are minted or burned.

## Getting Started

### Installing

- Use Remix IDE or any Solidity-supported IDE to deploy the contract.

### Executing program

1. Compile and deploy the contract in Remix.
2. Mint tokens:
   ```solidity
   mint("address", amount);
   ```
3. Burn tokens:
   ```solidity
   burn("address", amount);
   ```

## Help

Check Remix IDE for errors or insufficient gas issues.

## License

This project is licensed under the MIT License.
