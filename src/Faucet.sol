// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Faucet is ERC20 {
  
    uint256 allowedToken = 1000000000000;

    mapping (address => uint) public LockTime;

    constructor() ERC20("Faucet", "FC") {
        _mint(msg.sender, 50000000 * (10 ** 18));
    }

    //request token

    function  request(address requestor, uint256 amount)public {
        require(block.timestamp > LockTime[msg.sender]," you can try tomorrow ");

        // require(allowedToken > amount(this).balance);

        _mint(requestor , amount);

        LockTime[msg.sender] = block.timestamp + 1 days;
    }
}


// deploy Hash : 0xb7d4ab17d3c363cca32cb2af32979c6fe40db7973aa603963f5970013a0c60e0
// address: 0x3352a81A05101cc7F9FCB34d5233B94dd82dd4F5