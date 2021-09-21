pragma solidity ^0.5.13;

contract FunctionsExample {
    mapping(address => uint256) public balanceReceived;
    address payable owner;

    constructor() public {
        owner = msg.sender;
    }

    function destroySmartContract() {
        require(msg.sender == owner, "You are not the owner.");
        selfdestruct(owner);
    }

    function getOwner() public view return(address) {
        return owner;
    }

    function convertToEther(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;
    }

    function receiveMoney() public payable {
        assert(
            balanceReceived[msg.sender] + uint64(msg.value) >=
                balanceReceived[msg.sender]
        );
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        require(
            _amount <= balanceReceived[msg.sender],
            "You don't have enough Ether."
        );
        assert(
            balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount
        );
        _to.transfer(_amount);
    }

    function() external payable {
        receiveMoney();
    }
}
