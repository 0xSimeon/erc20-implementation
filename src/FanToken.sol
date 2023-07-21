// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FanToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Fan Token", "FTK") {
        _mint(msg.sender, initialSupply);
    }
}
