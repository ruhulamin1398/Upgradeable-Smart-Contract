## Upgradeable Smart contract 
### What are Upgradeable Smart Contracts?

Upgradeable smart contracts allow developers to modify and improve deployed contracts without changing their addresses or losing their state. Traditional smart contracts are immutable once deployed, which means any bugs or improvements require deploying a new contract. Upgradeable contracts address this limitation by introducing a proxy pattern.

### Why Use Upgradeable Smart Contracts?

`Bug Fixes:` Quickly address vulnerabilities discovered after deployment.

`Feature Additions:` Introduce new functionalities without redeploying from scratch.

`Cost Efficiency: `Avoid migrating contract data and interacting with a new address.

`Flexibility: `Adapt to changing business requirements or blockchain upgrades.

### How Do Upgradeable Smart Contracts Work?

Upgradeable smart contracts commonly follow the Proxy Pattern, where the logic and storage of the contract are separated:

`Proxy Contract:` Acts as the interface for users and stores contract state.

`Implementation Contract:` Contains the actual business logic.

`Admin Contract:` Manages upgrades and ensures only authorized parties can perform updates.

In the context of this repository, we are using UUPS `(Universal Upgradeable Proxy Standard)` provided by OpenZeppelin. UUPS is efficient and reduces gas costs compared to older patterns like Transparent Proxy.

### UUPS Proxy Pattern Overview

1. The Proxy Contract delegates all calls to the Implementation Contract.

1. The _authorizeUpgrade function ensures that only authorized accounts (e.g., the owner) can perform upgrades.

1. The initialize function acts as a constructor replacement to set initial state variables.

### Key Concepts in this Repository

`BoxV1:` Initial version of the smart contract.

`BoxV2 & BoxV3:` Subsequent upgrades with modified version functions.

`Upgradability Mechanism:` Managed using OpenZeppelin's UUPSUpgradeable and OwnableUpgradeable contracts.


## Implementation
 

### Box version 1 contract 

1. In smart contract v1   install `@openzeppelin/contracts-upgradeable` and import and inherit `UUPSUpgradeable`. 
```javascript 
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol"
```
2. add `_disableInitializers()` to disable constructor. and add `initialize()` to `initialize()` contract. 
```javascript 
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }
    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
        _disableInitializers();
    }
```
3. overrde `_authorizeUpgrade` function to only owner can upgrade contract.
```javascript 
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
```



<Details>
<summary>Click here to view BoxV1.sol full code  </summary>

```javascript
// BoxV1.sol


// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract BoxV1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal value;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}

```
</Details>

### Box version 2 contract 

Replace  `version` function with below code in `BoxV2.sol`

```javascript
//BoxV2.sol

    function version() external pure returns (uint256) {
        return 2;
    }
```

### Upgradeable Box contract 

Replace  `version` function with below code in `BoxV3.sol`

```javascript
//BoxV3.sol

    function version() external pure returns (uint256) {
        return 3;
    }
```

## Usage

### Clone 
```shell
$ git clone https://github.com/ruhulamin1398/Upgradeable-Smart-Contract.git
```

### Install
```
  make install
``

### Set Env
```ENVironment Variables
PRIVATE_KEY=<PRIVATE KEY>
RPC_URL=<TEST NET RPC URL>
ETHERSCAN_API_KEY=<ETHERSCAN API>
AMOY_RPC_URL=https://rpc-amoy.polygon.technology
POLYGONSCAN_API_KEY=<POLYGON API>

```

### Depoly contract `Proxy` and `v1` at POLYGON AMOY

```shell
$ make deploy-amoy
```

<Details>

  <summary> Output</summary>
  
```

##### amoy
✅  [Success] Hash: 0xc3e36906b885fd09ce9e22d5d38a6b7fb6b739fabc48b7530a9ac8a09263ca79
Block: 16162468
Paid: 0.002762458832510325 ETH (74295 gas * 37.182298035 gwei)


##### amoy
✅  [Success] Hash: 0x52fa913ca475d7c447ead92072126edfed3dd9057ebe2f7e6d08fea01602e07f
Contract Address: 0x68C1EE4A59bD870CB1E259617386a021C014a52d
Block: 16162468
Paid: 0.02998663099007466 ETH (806476 gas * 37.182298035 gwei)


##### amoy
✅  [Success] Hash: 0x63fc271d703b1dbd1e58377770b4bd4971f9eb64d1518f892aa2fe1ef5620d40
Contract Address: 0x6167715ab3Eeeab2E0e2d3255C2BBda05983f8c6
Block: 16162468
Paid: 0.004955545135210695 ETH (133277 gas * 37.182298035 gwei)

✅ Sequence #1 on amoy | Total Paid: 0.03770463495779568 ETH (1014048 gas * avg 37.182298035 gwei)

```

</Details>

### Upgrade to v2

```shell
$ make upgrade-v2-amoy
```

### Upgrade to v3

```shell
$ make upgrade-v3-amoy
```
 