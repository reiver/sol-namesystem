pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {NameSystem} from "../src/namesystem.sol";

contract NameSystemScript is Script {
    NameSystem public namesystem;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        namesystem = new NameSystem();

        vm.stopBroadcast();
    }
}
