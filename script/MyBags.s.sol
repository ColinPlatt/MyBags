// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/forge-std/src/Script.sol";
import "src/MyBags.sol";

contract MyBagsScript is Script {
    MyBags public token;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);
        token = new MyBags();
        vm.stopBroadcast();
    }
}


//forge script script/MyBags.s.sol:MyBagsScript --rpc-url $RPC_URL --verifier etherscan --chain 1 --slow --verify  -vvvv
//forge script script/MyBags.s.sol:MyBagsScript --rpc-url $RPC_URL --broadcast --verifier etherscan --chain 1 --slow --verify  -vvvv