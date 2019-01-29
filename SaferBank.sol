pragma solidity 0.5.0;

contract SaferBank {
    mapping(address => uint256) accountBalance;

    function deposit()
        public
        payable
    {
        accountBalance[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amountToWithdraw)
        public
    {
        require(accountBalance[msg.sender] >= _amountToWithdraw, "Caller doesnt have enough money to withdraw");

        msg.sender.transfer(_amountToWithdraw)();
        accountBalance[msg.sender] -= _amountToWithdraw;
    }
}

