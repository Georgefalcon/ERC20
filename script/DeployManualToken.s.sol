// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.22;

import {Script} from "forge-std/Script.sol";
import {ManualToken} from "../src/ManualToken.sol";

contract DeployManualToken is Script {
    ManualToken public manualToken;

    function run() external returns (ManualToken) {
        vm.startBroadcast();
        manualToken = new ManualToken();
        vm.stopBroadcast();
        return manualToken;
    }
}
