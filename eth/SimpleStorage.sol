pragma solidity ^0.5.10;

contract SimpleStorage {
    uint public data;
    event Set(address indexed _from, uint value);
    function set(uint x) public {
        data = x;
        emit Set(msg.sender, x);
    }
}