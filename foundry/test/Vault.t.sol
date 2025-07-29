pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Token.sol"; 
import {Vault, VaultStatus} from "../src/Vault.sol";

contract VaultTest is Test {
    Token public token;
    Vault public vault;

    uint256 capacity = 100; // Vault capacity of 100 tokens

    function setUp() public {
        token = new Token(1000); // Initial supply of 1000 tokens
        vault = new Vault(token, capacity); // Vault capacity
    }

    function testInitializeNotFull() public view{
        assertEq(token.balanceOf(address(vault)), 0);
        assertTrue(vault.status() == VaultStatus.NotFull, "Vault should be NotFull initially");
    }

    function testFull() public {
      token.transfer(address(vault), capacity);
      vault.updateStatus();
        assertEq(token.balanceOf(address(vault)), capacity, "Vault should have full capacity");
        assertTrue(vault.status() == VaultStatus.Full, "Vault status should be Full");
    }
/*
    function testDepositAndUpdateStatus() public {
        token.mint(address(vault), 300 ether);
        vault.updateStatus();
        assertEq(uint(vault.status()), uint(VaultStatus.NotFull));

        token.mint(address(vault), 200 ether);
        vault.updateStatus();
        assertEq(uint(vault.status()), uint(VaultStatus.Full));
    }

    function testOverFilledStatus() public {
        token.mint(address(vault), 600 ether);
        vault.updateStatus();
        assertEq(uint(vault.status()), uint(VaultStatus.OverFilled));
    }

    function testWithdrawExcess() public {
        token.mint(address(vault), 600 ether);
        vault.updateStatus();
        
        uint256 initialBalance = token.balanceOf(address(this));
        vault.withdraw();
        
        assertEq(token.balanceOf(address(this)), initialBalance + 100 ether);
        assertEq(uint(vault.status()), uint(VaultStatus.OverFilled));
    }*/
}