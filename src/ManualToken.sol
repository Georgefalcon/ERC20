// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.22;

contract ManualToken {
    string public name = "ManualToken";
    mapping(address => uint256) private s_balances;

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function Name() public view returns (string memory) {
        return name;
    }

    function decimal() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _amount) public {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }

    //Getters
    function getTransfer(address _to, uint256 _amount) public {
        return transfer(_to, _amount);
    }
}
