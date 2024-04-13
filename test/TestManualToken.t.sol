// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.22;

import {Test, console} from "forge-std/Test.sol";
import {ManualToken} from "../src/ManualToken.sol";
import {DeployManualToken} from "../script/DeployManualToken.s.sol";

contract TestManualToken is Test {
    ManualToken public manualToken;
    DeployManualToken public deployer;
    uint256 public constant TOTAL_SUPPLY = 100 ether;
    uint256 public constant DECIMAL = 18;
    uint256 public constant STARTING_BALANCE = 10 ether;
    uint256 public constant STARTING_BALANCE_REMAINDER = 7 ether;
    address public USER = makeAddr("user");
    address public USER1 = makeAddr("user1");
    uint256 public constant SENT_AMOUNT = 3 ether;
    uint256 public balance;
    uint256 public balance1;
    string public Transfer;

    // function to set up my test environment
    function setUp() external {
        deployer = new DeployManualToken();
        manualToken = deployer.run();
        deal(address(manualToken), USER, STARTING_BALANCE);
    }

    // OUR TEST!!!!
    function testTotalsupply() external {
        assertEq(manualToken.totalSupply(), TOTAL_SUPPLY);
    }

    function testName() external {
        string memory ActualName = "ManualToken";
        string memory ExpectedName = manualToken.Name();
        assertEq(
            keccak256(abi.encodePacked(ActualName)),
            keccak256(abi.encodePacked(ExpectedName))
        );
    }

    function testDecimal() external {
        assertEq(manualToken.decimal(), DECIMAL);
    }

    function testBalanceOf() external {
        //Arrange
        // vm.prank(USER);
        // hoax(USER, STARTING_BALANCE);
        //Act
        balance = manualToken.balanceOf(USER);
        console.log(balance);

        //Assert
        assertEq(balance, STARTING_BALANCE);
    }

    function testTransfer() external {
        //Arrange
        vm.prank(USER);
        //Act
        manualToken.transfer(USER1, SENT_AMOUNT);
        //Assert
        assertEq(manualToken.balanceOf(USER1), SENT_AMOUNT);
        assertEq(manualToken.balanceOf(USER), STARTING_BALANCE_REMAINDER);
    }
}
