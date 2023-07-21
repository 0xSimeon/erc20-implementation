// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {FanToken} from "../src/FanToken.sol";
import {Script, console} from "forge-std/Script.sol";

contract DeployFanToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (FanToken) {
        vm.startBroadcast();
        FanToken fanToken = new FanToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return fanToken; 
    }
}
