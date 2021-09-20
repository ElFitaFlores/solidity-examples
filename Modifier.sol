pragma solidity ^0.5.13;

import "./Owned.sol";

contract Modifier is Owned {
    mapping(address => uint256) public tokenBalance;

    uint256 tokenPrice = 1 ether;

    constructor() public {
        tokenBalance[owner] = 100;
    }

    function createNewToken() public onlyOwner {
        tokenBalance[owner]++;
    }

    function burnToken() public onlyOwner {
        tokenBalance[owner]--;
    }

    function purchaseToken() public payable {
        require(
            (tokenBalance[owner] * tokenPrice) / msg.value > 0,
            "Not enough tokens."
        );
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _to, uint256 _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens;");
        assert(tokenBalance[_to + _amount >= tokenBalance[_to]]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[owner] -= _amount;
        tokenBalance[_to] += _amount;
    }
}
