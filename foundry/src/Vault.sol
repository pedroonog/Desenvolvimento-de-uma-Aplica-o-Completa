pragma solidity ^0.8.0;
import {Token} from "./Token.sol";

enum VaultStatus { NotFull, Full, OverFilled }

contract Vault {
    Token public token;
    uint capacity;
    VaultStatus public status; 

    constructor(Token _token, uint256 _capacity) {
        token = _token;
        capacity = _capacity;
    }

    function updateStatus() public {
      address vault = address(this);
        uint256 balance = token.balanceOf(vault);
        if (balance < capacity) {
            status = VaultStatus.NotFull;
        } else if (balance == capacity) {
            status = VaultStatus.Full;
        } else {
            status = VaultStatus.OverFilled;
        }
    }

    function isOverFilled() public view returns (bool) {
        return token.balanceOf(address(this)) > capacity;
    }

    function withdraw() external{
        require(isOverFilled(), "Vault is not overfilled");
        uint256 excess = token.balanceOf(address(this)) - capacity;
        token.transfer(msg.sender, excess);
        updateStatus();
    }
} 