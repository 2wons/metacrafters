// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
 
contract TicketLord {
    struct Ticket {
        address owner;
        bool isPurchased;
    }

    mapping(string => Ticket) public seats;
    uint public constant TOTAL_SEATS = 10;

    // Modifier to validate seatId format
    modifier validSeatId(string memory seatId) {
        require(bytes(seatId).length == 2, "Invalid seat ID format.");

        // Convert string to bytes for indexing
        bytes memory seatIdBytes = bytes(seatId);

        require(seatIdBytes[0] >= '1' && seatIdBytes[0] <= '2', "Row must be 1 or 2.");
        require(seatIdBytes[1] >= 'A' && seatIdBytes[1] <= 'F', "Column must be A to F.");

        _;
    }

    constructor() {
        string[6] memory seatLetters = ["A", "B", "C", "D", "E", "F"];

        // Initialize seats 1A-1F and 2A - 2F
        for (uint row = 1; row <= 2; row++) 
        {
            for (uint column = 0; column < 6; column++) 
            {
                string memory seatId = string(abi.encodePacked(row, seatLetters[column]));
                seats[seatId] = Ticket(address(0), false);
            }
        }
    }

    function purchase(string memory seatId) public validSeatId(seatId) {
        require(!seats[seatId].isPurchased, "Seat is already sold.");

        seats[seatId] = Ticket(msg.sender, true);

        // Ensure that the seat is now marked as purchased
        assert(seats[seatId].isPurchased == true);
    }

    function cancel(string memory seatId) public validSeatId(seatId) {
        require(seats[seatId].isPurchased, "Seat has not been purchased.");
        require(seats[seatId].owner == msg.sender, "Seat may only be cancelled by ticket owner.");

        seats[seatId] = Ticket(address(0), false);

        // Ensure that the seat is now marked as purchased
        assert(seats[seatId].isPurchased == false);
    }

    function multPurchase(string[] memory seatIds) public {
        for (uint i = 0; i < seatIds.length; i++) {
            string memory seatId = seatIds[i];

            require(bytes(seatId).length == 2, "Invalid seat ID format.");

            // Convert string to bytes for indexing
            bytes memory seatIdBytes = bytes(seatId);

            if (bytes(seatId).length != 2 || 
                seatIdBytes[0] < '1' || seatIdBytes[0] > '2' || 
                seatIdBytes[1] < 'A' || seatIdBytes[1] > 'F' || 
                seats[seatId].isPurchased) {
                revert("One or more seats are invalid or already purchased. Transaction reverted.");
            }

            seats[seatId] = Ticket(msg.sender, true);

            // Ensure after each purchase the seat is marked as sold
            assert(seats[seatId].isPurchased == true);
        }
    }
}