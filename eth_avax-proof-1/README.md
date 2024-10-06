# TicketLord Contract

A Solidity contract for handling ticket sales and cancellations, with built-in error handling using `require`, `assert`, and `revert` to ensure correct seat transactions.

## Description

The `TicketLord` contract allows users to purchase and cancel tickets for a predefined set of seats (10 in total). It ensures that each seat can only be purchased once and can only be canceled by its owner. The contract also includes validation for seat IDs to ensure proper format, and allows batch purchasing of multiple seats.

## Getting Started

### Installing

- Use Remix IDE or any Solidity-supported IDE to deploy and interact with the contract.

### Executing Program

1. Deploy the contract using the Remix IDE.
2. Use the `purchase` function to buy a ticket by providing a valid seat ID (e.g., "1A").
3. Use the `cancel` function to cancel a purchased ticket, but only if you're the owner of that ticket.
4. Use the `multPurchase` function to buy multiple seats in one transaction, passing an array of valid seat IDs.

### Valid Seat IDs

The valid seat IDs range from "1A" to "1F" and "2A" to "2F". Each seat can only be purchased once.

## Error Handling

This contract incorporates `require`, `assert`, and `revert` statements to safeguard against invalid transactions during purchasing and cancelling. For example:
- `require`: Used to ensure that the seat ID format is valid and that a seat is not already purchased.
- `assert`: Ensures that after any transaction, the seat's status is correctly updated (purchased or canceled).
- `revert`: Used in batch seat purchases to revert the entire transaction if any seat in the batch is invalid or already purchased.

## Help

For troubleshooting, check Remix IDE for compilation errors, runtime issues, or gas limit problems.

## License

This project is licensed under the MIT License.
