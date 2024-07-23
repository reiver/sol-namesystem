pragma solidity ^0.8.13;

interface INameSystem {
	function get(bytes32 digest) external view returns(address);
	function length() external view returns (uint256);
	function namespace() external view returns(string memory);
	function owner() external view returns(address);
	function set(bytes32 digest, address value) external;
}
