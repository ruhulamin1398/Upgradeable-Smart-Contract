// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol"; 

contract UpgradeBox is Script {
    function run() external returns (address) { 

        vm.startBroadcast();
        BoxV2 newBox = new BoxV2();
        vm.stopBroadcast();
        address proxy = upgradeBox( address(newBox));
        return proxy;
    }

    function upgradeBox(  address newBox) public returns (address) {
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(0x54b18cFeB1BEda694C23e58Db963136E1C945932);
        proxy.upgradeTo(address(newBox));
        vm.stopBroadcast();
        return address(proxy);
    }
}