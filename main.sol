// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Project {
    mapping (address => uint) public balance;
    address owner;
    constructor() {
        owner = msg.sender;
    }

    function transfer(uint amount) public payable  {
        require(amount > 10 ,"Amount must be greater than 10");
        balance[owner] +=amount;
        
    }
    error InsufficientBalance(uint balances);

    function withdraw(uint _amount) public payable  {
        if(balance[owner]<_amount){
           revert InsufficientBalance({balances: balance[owner]});
        }
    balance[owner] -= _amount;

    }
    
    function check_balance() public view returns(uint)  {
        assert(owner == msg.sender);
        return balance[owner];
    }

    
    
}
