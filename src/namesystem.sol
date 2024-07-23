pragma solidity ^0.8.13;

import {PNameSystem} from "src/pnamesystem.sol";

contract NameSystem is PNameSystem {

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// CONSTANTS                                                                                      //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// STORAGE                                                                                        //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// CONSTRUCTOR, FALLBACKS                                                                         //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	constructor(string memory _thenamespace) PNameSystem(msg.sender, _thenamespace) {
		// nothing here
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

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// PERMISSIONED FUNCTIONS                                                                         //
	////////////////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////////////////////
	// INTERNAL FUNCTIONS                                                                             //
	////////////////////////////////////////////////////////////////////////////////////////////////////
}
