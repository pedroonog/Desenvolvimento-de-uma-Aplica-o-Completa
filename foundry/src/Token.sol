pragma solidity ^0.8.0;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor(uint256 initSupply) ERC20("Token", "TKN") {
        _mint(msg.sender, initSupply);
    } 

    function mint(address to, uint256 amount) external {
        require(amount < 1 ether );
        _mint(to, amount);
    }
}


