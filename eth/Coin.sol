pragma solidity ^0.5.8;
contract Coin {
    // 关键字“public”让这些变量可以从外部读取
    address public minter;
    //function minter() returns (address) { return minter; }

    //创建一个公共状态变量
    mapping (address => uint) public balances;
    //function balances(address _account) public view returns (uint) {
    //return balances[_account];}

    // 轻客户端可以通过事件针对变化作出高效的反应
    event Sent(address from, address to, uint amount);

    // 这是构造函数，只有当合约创建时运行
    constructor () public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        if (msg.sender != minter) return;
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}