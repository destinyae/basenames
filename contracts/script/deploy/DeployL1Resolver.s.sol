// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import "src/L1/L1Resolver.sol";

contract DeployL1Resolver is Script {
    function run() external {

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // address deployerAddresss = vm.addr(deployerPrivateKey);
        vm.startBroadcast(deployerPrivateKey);

        /// L1 Resolver constructor data
        string memory url = "https://subdomain-did-api-dev.cbhq.net:8000/api/v1/domain/resolver/resolveDomain/{sender}/{data}";                                  // 
        address[] memory signers = new address[](1); 
        signers[0] = 0xa412c16ECd2198A6aBce8235651E105684Fb77ed; // DEV signer

        L1Resolver l1 = new L1Resolver(url, signers);
        console.log(address(l1));

        vm.stopBroadcast();
    }
}