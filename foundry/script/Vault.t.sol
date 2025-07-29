pragma solidity ^0.8.0;

import 'forge-std/Script.sol';
import {Token} from '../src/Token.sol';
import {Vault} from '../src/Vault.sol';

contract VaultDeploy is Script {
    function run() public {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        // Deploy Token contract with an initial supply of 1000 tokens
        Token token = new Token(1000);

        // Deploy Vault contract with the token and a capacity of 100 tokens
        new Vault (token, 100);

        vm.stopBroadcast();
    }
} 