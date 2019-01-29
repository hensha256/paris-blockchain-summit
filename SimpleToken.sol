pragma solidity 0.5.0;

contract SimpleToken {

    mapping(address => uint) balance;

    constructor(uint _totalSupply)
        public
    {
        balance[msg.sender] = _totalSupply;
    }

    function transfer(address _to, uint _amount) public {
        require(balance[msg.sender] >= _amount, "Sender doesnt have enough tokens");

        balance[msg.sender] -= _amount;
        balance[_to] += _amount;
    }
}
