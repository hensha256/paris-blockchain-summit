pragma solidity 0.5.0;

import "./FootballOracle";

contract FootballBet {

    address proposer;
    address opponent;

    FootballOracle footballOracle;
    string team;

    bool opponentHasPaid = false;

    constructor(address _opponent, string _team, FootballOracle _oracle)
        public
        payable
    {
        require(msg.value == 1 ether, "Must pay 1 eth to set up bet");
        proposer = msg.sender;
        opponent = _opponent;
        team = _team;
        footballOracle = _oracle;
    }

    function opponentEntryFee()
        public
        payable
    {
        require(msg.sender == opponent, "Only opponent can call this function");
        require(msg.value == 1 ether, "Opponent must pay 1 ether to enter");

        opponentHasPaid = true;
    }

    function settleBet()
        public
    {
        if (footballOracle.hasWon(team) || !opponentHasPaid) {
            proposer.transfer(2 ether);
        } else {
            opponent.transfer(2 ether);
        }
    }
}
