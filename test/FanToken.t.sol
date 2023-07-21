// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployFanToken} from "../script/DeployFanToken.s.sol";
import {FanToken} from "../src/FanToken.sol";

contract FanTokenTest is Test {
    FanToken public fanToken;
    DeployFanToken public deployer;
    uint256 public constant STARTING_BALANCE =  100 ether; 

    address bob = makeAddr("bob");
    address alice = makeAddr("Alice");

    function setUp() public {
        deployer = new DeployFanToken();
        fanToken = deployer.run();

        vm.prank(msg.sender);
        fanToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, fanToken.balanceOf(bob));
    }

    function testAllowances() public { 
        uint256 initialAllowance = 1000;
        uint256 transferAmount = 500;

        // Bob approves Alice to spend tokens on her behalf 
        vm.prank(bob);
        fanToken.approve(alice, initialAllowance);
        vm.prank(alice);
        fanToken.transferFrom(bob, alice, transferAmount);

        assertEq(fanToken.balanceOf(alice), transferAmount);
    }

}
