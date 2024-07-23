pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {PNameSystem} from "../src/pnamesystem.sol";

contract PNameSystemTest is Test {

	struct Record {
		bytes32 digest;
		address value;
	}

	struct Trial {
		address potentate;
		string thenamespace;
		Record[] setters;
		uint256 expectedLength;
	}

	function test_now() public {

		Trial[] memory tests = new Trial[](3);
		uint testIndex;
		{
			Record[] memory setters = new Record[](0);

			tests[testIndex++] = Trial(0x00000000219ab540356cBB839Cbe05303d7705Fa, "apple", setters, 0);
		}
		{
			Record[] memory setters = new Record[](1);
			setters[0] = Record(keccak256(abi.encodePacked("test")),0xc0ffee254729296a45a3885639AC7E10F9d54979);

			tests[testIndex++] = Trial(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2, "banana", setters, 1);
		}
		{
			Record[] memory setters = new Record[](2);
			setters[0] = Record(keccak256(abi.encodePacked("one")),0xc0ffee254729296a45a3885639AC7E10F9d54979);
			setters[1] = Record(keccak256(abi.encodePacked("two")),0xc0ffee254729296a45a3885639AC7E10F9d54979);

			tests[testIndex++] = Trial(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2, "cherry", setters, 2);
		}

		for (uint testNumber=0; testNumber < tests.length; testNumber++) {

			Trial memory test = tests[testNumber];

			PNameSystem pnamesystem = new PNameSystem(test.potentate, test.thenamespace);
			for (uint i; i<test.setters.length; i++) {
				bytes32 digest = test.setters[i].digest;
				address value = test.setters[i].value;

				pnamesystem.set(digest, value);
			}

			{
				address actual   = pnamesystem.potentate();
				address expected = test.potentate;

				if (expected != actual) {
					console.log("For test #%d, the actual 'potentate' is not what was expected.", testNumber);
					console.log("EXPECTED: %s", expected);
					console.log("ACTUAL:   %s", actual);
					continue;
				}
			}

			{
				string memory actual   = pnamesystem.namespace();
				string memory expected = test.thenamespace;

				if ( keccak256(abi.encodePacked(expected)) != keccak256(abi.encodePacked(actual)) ) {
					console.log("For test #%d, the actual 'namespace' is not what was expected.", testNumber);
					console.log("EXPECTED: %o", expected);
					console.log("ACTUAL:   %o", actual);
					continue;
				}
			}

			{
				uint256 actual   = pnamesystem.length();
				uint256 expected = test.expectedLength;

				if (expected != actual) {
					console.log("For test #%d, the actual 'length' is not what was expected.", testNumber);
					console.log("EXPECTED: %d", expected);
					console.log("ACTUAL:   %d", actual);
					continue;
				}
			}
		}
	}
}
