// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract RailwaysTicketCheckingSystem {
    address public owner;
    uint256 public ticketCount;
    mapping(uint256 => bool) public tickets;
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function mintTicket() public onlyOwner returns (uint256) {
        ticketCount++;
        tickets[ticketCount] = true;
        return ticketCount;
    }
    error invalidticket(uint ticketid, uint ticketcount);

    function checkTicket(uint256 ticketId) public view returns (bool) {
        if(ticketId < 0 && ticketId > ticketCount){
            revert invalidticket({ticketid: ticketId,ticketcount: ticketCount});
        }
        return tickets[ticketId];
    }

    function invalidateTicket(uint256 ticketId) public onlyOwner {
        if(ticketId < 0 && ticketId > ticketCount){
            revert invalidticket({ticketid: ticketId,ticketcount: ticketCount});
        }
        assert(tickets[ticketId] == true);
        
        tickets[ticketId] = false;
    }
}

