## Upgradeable Smart contract 

 

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
 
  
