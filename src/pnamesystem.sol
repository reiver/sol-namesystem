pragma solidity ^0.8.13;

import {INameSystem} from "src/inamesystem.sol";

contract PNameSystem is INameSystem {

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// CONSTANTS                                                                                      //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// STORAGE                                                                                        //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	address private thepotentate;

	string private thenamespace;

	mapping(bytes32=>address) addresses;
	uint256 numAddresses;

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR, FALLBACKS                                                                         //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	constructor(address _thepotentate, string memory _thenamespace) {
		thepotentate = _thepotentate;
		thenamespace = _thenamespace;
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// MODIFIERS                                                                                      //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// PUBLIC FUNCTIONS                                                                               //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// EXTERNAL VIEWS                                                                                 //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	function get(bytes32 _digest) external view returns (address) {
		return _get(_digest);
	}

	function length() external view returns (uint256) {
		return _length();
	}

	function namespace() external view returns(string memory) {
		return _namespace();
	}

	function potentate() external view returns(address) {
		return _potentate();
	}

	function set(bytes32 _digest, address _addr) external {
		return _set(_digest, _addr);
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// PERMISSIONED FUNCTIONS                                                                         //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// INTERNAL FUNCTIONS                                                                             //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	function _get(bytes32 digest) internal view returns (address) {
		return addresses[digest];
	}

	function _length() internal view returns (uint256) {
		return numAddresses;
	}

	function _namespace() internal view returns(string memory) {
		return thenamespace;
	}

	function _numAddresses(address prevaddr, address curraddr) internal {
		bool prevzero = (0x0000000000000000000000000000000000000000 == prevaddr);
		bool currzero = (0x0000000000000000000000000000000000000000 == curraddr);

		if          ( prevzero &&  currzero) { // 0x0000000000000000000000000000000000000000 == prevaddr && 0x0000000000000000000000000000000000000000 == curraddr
			// nothing here
		} else if   ( prevzero && !currzero) { // 0x0000000000000000000000000000000000000000 == prevaddr && 0x0000000000000000000000000000000000000000 != curraddr
			++numAddresses;
		} else if   (!prevzero &&  currzero) { // 0x0000000000000000000000000000000000000000 != prevaddr && 0x0000000000000000000000000000000000000000 == curraddr
			--numAddresses;
		} else { // (!prevzero && !currzero)   // 0x0000000000000000000000000000000000000000 != prevaddr && 0x0000000000000000000000000000000000000000 != curraddr
			// nothing here
		}
	}

	function _potentate() internal view returns(address) {
		return thepotentate;
	}

	function _set(bytes32 _digest, address _addr) internal {
		address prevaddr = addresses[_digest];

		addresses[_digest] = _addr;

		_numAddresses(prevaddr, _addr);
	}
}
