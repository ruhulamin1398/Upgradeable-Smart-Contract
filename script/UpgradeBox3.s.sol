// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {BoxV3} from "../src/BoxV3.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol"; 

contract UpgradeBox3 is Script {
    function run() external returns (address) { 

        vm.startBroadcast();
        BoxV3 newBox = new BoxV3();
        vm.stopBroadcast();
        address proxy = upgradeBox( address(newBox));
        return proxy;
    }

    function upgradeBox(  address newBox) public returns (address) {
        vm.startBroadcast();
        BoxV2 proxy = BoxV2(0x54b18cFeB1BEda694C23e58Db963136E1C945932);
        proxy.upgradeTo(address(newBox));
        vm.stopBroadcast();
        return address(proxy);
    }
}