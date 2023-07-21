// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ManualToken {
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    mapping(address => uint256) private s_balances;

    /// @notice manualy creating a token by implementing the ERC-20 standard.
    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    ///@notice This is optional.
    function symbol() public pure returns (string memory) {
        return "MT";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);

        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);

        emit Transfer(msg.sender, _to, _amount);
    }
}
