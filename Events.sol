pragma solidity ^0.5.13;

contract Events {
    mapping(address => uint256) public tokenBalance;

    event TokensSent(adress _from, address _to, uint256 _amount);

    constructor() public {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint256 _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens;");
        assert(tokenBalance[_to + _amount >= tokenBalance[_to]]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit TokensSent(msg.sender, _to, _amount);
    }
}
