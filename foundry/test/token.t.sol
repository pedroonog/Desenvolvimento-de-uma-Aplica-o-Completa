pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Token.sol";

contract TokenTest is Test {
    Token public token;

    function setUp() public {
        token = new Token(100);
    }

    function testConstructorMint() public view {
        assertEq(token.balanceOf(address(this)), 100);       
    }

    function testMint(uint256 amount) public {
        vm.assume(amount < 1 ether);
        token.mint(msg.sender, amount);
        assertEq(token.balanceOf(msg.sender), amount);
    }
    function test_RevertWhenMintAboveLimit(uint256 amount) public {
    vm.assume(amount > 1 ether); // só testa valores acima de 1 ether
    vm.expectRevert(); // espera que ocorra um revert
    token.mint(msg.sender, amount);
    } 
    /*
    function testInitialSupply() public {
        assertEq(token.totalSupply(), 100);
    }*/
} 