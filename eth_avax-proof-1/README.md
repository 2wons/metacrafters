# Token Contract

A simple token contract for **ScumCoin (SCM)**, featuring minting and burning functionalities with ***error handling***.

## Description

This contract implements a basic token called **ScumCoin (SCM)**. It tracks token balances and provides functions to mint new tokens to an address and burn tokens from an address. The total supply dynamically adjusts as tokens are minted or burned. Additionally, the contract uses `require`, `assert`, and `revert` statements to ensure secure and reliable token management during minting and burning operations.

## Getting Started

### Installing

- Use Remix IDE or any Solidity-supported IDE to deploy the contract.

### Executing Program

1. Compile and deploy the contract in Remix.
2. To mint tokens:
   ```solidity
   mint("address", amount);
   ```
3. To burn tokens:
   ```solidity
   burn("address", amount);
   ```

## Error Handling

This contract incorporates `require`, `assert`, and `revert` statements to safeguard against invalid transactions during minting and burning. For example:
- `require` ensures that conditions are met before proceeding.
- `assert` checks for internal errors.
- `revert` reverts transactions when conditions are not satisfied, rolling back changes.

## Help

For troubleshooting, check Remix IDE for compilation errors, runtime issues, or insufficient gas problems.

## License

This project is licensed under the MIT License.