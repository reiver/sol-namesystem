pragma solidity ^0.8.13;

interface INameSystem {
	function get(bytes32 _digest) external view returns(address);
	function length() external view returns (uint256);
	function potentate() external view returns(address);
	function set(bytes32 _digest, address _value) external;
}
