
//initiate web3 instance

//
import Web3 from web3;
const web3 = new Web3('ws://localhost:8545');


//const Web3=require("web3");
//const web3 = new Web3(Web3.givenProvider || new Web3.providers.WebsocketProvider('ws://localhost:8545'), null, {});


web3.version;
