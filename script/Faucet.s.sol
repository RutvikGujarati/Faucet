// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Faucet} from "../src/Faucet.sol";

contract FaucetScript is Script {


    function run() public {

        vm.startBroadcast();
    
         new Faucet();
         vm.stopBroadcast();    
    }
}
