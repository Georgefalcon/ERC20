// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.22;
import {ERC20} from "openzepplin-contracts/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Doggie", "DOG") {
        _mint((msg.sender), initialSupply);
    }
}
