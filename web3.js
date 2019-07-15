//import Web3 from web3;

const Web3=require("web3");
//const web3 = new Web3('ws://localhost:8545');
//console.log(web3);

const web3obj = new Web3(Web3.givenProvider || new Web3.providers.WebsocketProvider('ws://localhost:8545'), null, {});


