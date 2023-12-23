// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

contract Fc{
    uint256 public allowedTokens = 1000000000;
    address public Owner;

    mapping(address => uint) public LockTime;

    modifier onlyOwner() {
        require(Owner== msg.sender,"you are not an Owner");
        _;
    }

    constructor()payable{
      Owner = msg.sender;
    }

    function setOwner(address NewOwner)external onlyOwner{
        Owner = NewOwner;
    }

    function setAmount(uint256 newAllowed)public onlyOwner{
        allowedTokens = newAllowed;
    }

    function requestToken (address payable requestor, uint256 Amount)public{
        require(block.timestamp == LockTime[msg.sender],"you have to take break");

        require(allowedTokens > Amount ,"not enough money in the contract");

        requestor.transfer(Amount);

        LockTime[msg.sender] == block.timestamp +1 days;
    }
}