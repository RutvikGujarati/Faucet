// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Faucet} from "../src/Faucet.sol";
import {FaucetScript} from "../script/Faucet.s.sol";

contract FaucetTest is Test {
    Faucet public Fauceting;
    FaucetScript public script;

// function setup()public{
//     deployer = new FaucetScript();   
    
// }

// function test_Request(address a1, uint256 amount)public{
//      Fauceting.request(a1 , amount);
// }

function test_ERC20() public view {
    string memory expectName = "Faucet";
    string memory actualName = Fauceting.name();

    assert(
        keccak256(abi.encodePacked(expectName)) == keccak256(abi.encodePacked(actualName))
    );
}

}
