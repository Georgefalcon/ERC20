// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.22;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";

contract TestOurToken is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;
    uint256 public constant STARTING_BALANCE = 100 ether;
    address public george = makeAddr("george");
    address public falcon = makeAddr("falcon");
    uint256 public initialAllowance = 10 ether;
    uint256 public transferAmount = 5 ether;

    function setUp() external {
        deployer = new DeployOurToken();
        ourToken = deployer.run();
        vm.prank(msg.sender);
        ourToken.transfer(george, STARTING_BALANCE);
    }

    function testgeorgeBalance() public {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(george));
    }

    function testAllowancWorks() public {
        vm.prank(george);

        ourToken.approve(falcon, initialAllowance);
        vm.prank(falcon);
        ourToken.transferFrom(george, falcon, transferAmount);
        assertEq(ourToken.balanceOf(falcon), transferAmount);
        assertEq(ourToken.balanceOf(george), STARTING_BALANCE - transferAmount);
    }
}
