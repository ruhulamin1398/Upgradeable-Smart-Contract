// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {BoxV3} from "../src/BoxV3.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract UpgradeBox3 is Script {
    function run() external returns (address) {
        vm.startBroadcast();
        BoxV3 newBox = new BoxV3();
        vm.stopBroadcast();
        address proxy = upgradeBox(address(newBox));
        return proxy;
    }

    function upgradeBox(address newBox) public returns (address) {
        address proxyContractAddress = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);
        vm.startBroadcast();
        BoxV2 proxy = BoxV2(proxyContractAddress);
        proxy.upgradeTo(address(newBox));
        vm.stopBroadcast();
        return address(proxy);
    }
}
