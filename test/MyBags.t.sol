// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/forge-std/src/Test.sol";
import "src/MyBags.sol";
import "lib/solmate/src/tokens/ERC721.sol";

contract MyBagsTest is Test {
    MyBags public token;

    uint256 mainnetFork;

    constructor() {
        mainnetFork = vm.createSelectFork(vm.envString("RPC_URL"));
        token = new MyBags();
    }

    function test_getMyBags() public {
        vm.startPrank(0xCf51040f5861907c6c7aE33B49F8605FcB802117);
        token.getMyBags(MyBags.jpegz.GHOULZ, 2288);
        vm.stopPrank();

        vm.startPrank(0x8d138c01765483cB79d787ce5933F609CbFDabcF);
        token.getMyBags(MyBags.jpegz.LOBZ, 659);
        vm.stopPrank();
    }

    function test_badGetMyBags() public {
        vm.startPrank(0xCf51040f5861907c6c7aE33B49F8605FcB802117);
        vm.expectRevert(MyBags.NotYourBagz.selector);
        token.getMyBags(MyBags.jpegz.GHOULZ, 1);
        vm.stopPrank();

        vm.startPrank(0x8d138c01765483cB79d787ce5933F609CbFDabcF);
        vm.expectRevert(MyBags.NotYourBagz.selector);
        token.getMyBags(MyBags.jpegz.LOBZ, 1);
        vm.stopPrank();

        vm.startPrank(0xCf51040f5861907c6c7aE33B49F8605FcB802117);
        token.getMyBags(MyBags.jpegz.GHOULZ, 2288);
        vm.expectRevert(MyBags.AlreadyHazBagz.selector);
        token.getMyBags(MyBags.jpegz.GHOULZ, 2288);
        vm.stopPrank();

        vm.startPrank(0x8d138c01765483cB79d787ce5933F609CbFDabcF);
        token.getMyBags(MyBags.jpegz.LOBZ, 659);
        vm.expectRevert(MyBags.AlreadyHazBagz.selector);
        token.getMyBags(MyBags.jpegz.LOBZ, 659);
        vm.stopPrank();
    }
}
