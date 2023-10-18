Homework 5
Assembly 1

QUESTION 1
. Look at the example of init code in today's notes:

    608060405234801561001057600080fd5b50601160008190555060b6806100276000396000f3fe

See gist

    // SPDX-License-Identifier: MIT
    pragma solidity 0.8.6;

    contract Deploy1{

        uint256 value1;

        constructor(){
            value1 = 17;
        }

        function read() view public returns (uint256 result){
            return value1;
        }
    }


    "object": "608060405234801561001057600080fd5b50601160008190555060b6806100276000396000f
    3fe6080604052348015600f57600080fd5b506004361060285760003560e01c806357d
    e26a414602d575b600080fd5b60336047565b604051603e9190605d565b60405180910
    390f35b60008054905090565b6057816076565b82525050565b6000602082019050607
    060008301846050565b92915050565b600081905091905056fea264697066735822122
    0872b5d4b9f200afddd5ed3c424f6b3b995bf467e212ec4c313f65365aeadf8e964736
    f6c63430008060033",

    "opcodes": "PUSH1 0x80 PUSH1 0x40 MSTORE
    CALLVALUE DUP1 ISZERO PUSH2 0x10 JUMPI PUSH1 0x0 DUP1 REVERT JUMPDEST
    POP PUSH1 0x11 PUSH1 0x0 DUP2 SWAP1 SSTORE POP PUSH1 0xB6 DUP1 PUSH2
    0x27 PUSH1 0x0 CODECOPY PUSH1 0x0 RETURN INVALID PUSH1 0x80 PUSH1 0x40
    MSTORE CALLVALUE DUP1 ISZERO PUSH1 0xF JUMPI PUSH1 0x0 DUP1 REVERT
    JUMPDEST POP PUSH1 0x4 CALLDATASIZE LT PUSH1 0x28 JUMPI PUSH1 0x0
    CALLDATALOAD PUSH1 0xE0 SHR DUP1 PUSH4 0x57DE26A4 EQ PUSH1 0x2D JUMPI
    JUMPDEST PUSH1 0x0 DUP1 REVERT JUMPDEST PUSH1 0x33 PUSH1 0x47 JUMP
    JUMPDEST PUSH1 0x40 MLOAD PUSH1 0x3E SWAP2 SWAP1 PUSH1 0x5D JUMP
    JUMPDEST PUSH1 0x40 MLOAD DUP1 SWAP2 SUB SWAP1 RETURN JUMPDEST PUSH1
    0x0 DUP1 SLOAD SWAP1 POP SWAP1 JUMP JUMPDEST PUSH1 0x57 DUP2 PUSH1
    0x76 JUMP JUMPDEST DUP3 MSTORE POP POP JUMP JUMPDEST PUSH1 0x0 PUSH1
    0x20 DUP3 ADD SWAP1 POP PUSH1 0x70 PUSH1 0x0 DUP4 ADD DUP5 PUSH1 0x50
    JUMP JUMPDEST SWAP3 SWAP2 POP POP JUMP JUMPDEST PUSH1 0x0 DUP2 SWAP1
    POP SWAP2 SWAP1 POP JUMP INVALID LOG2 PUSH5 0x6970667358 0x22 SLT
    KECCAK256 DUP8 0x2B 0x5D 0x4B SWAP16 KECCAK256 EXP REVERT 0xDD 0x5E
    0xD3 0xC4 0x24 0xF6 0xB3 0xB9 SWAP6 0xBF CHAINID PUSH31
    0x212EC4C313F65365AEADF8E964736F6C634300080600330000000000000000 "

When we do the CODECOPY operation, what are we
overwriting ?
(debugging this in Remix might help here)

In the debugger it is possible to see the list of opcodes as:

    005 CALLVALUE -
    006 DUP1 -
    007 ISZERO -
    008 PUSH2 0010 -
    011 JUMPI -
    012 PUSH1 00 -
    014 DUP1 -
    015 REVERT -
    016 JUMPDEST -
    017 POP -
    018 PUSH1 11 - LINE 9
    020 PUSH1 00 - LINE 9
    022 DUP2 - LINE 9
    023 SWAP1 - LINE 9
    024 SSTORE - LINE 9
    025 POP - LINE 9
    026 PUSH1 b6 - LINE 9
    028 DUP1 - LINE 9
    029 PUSH2 0027 - LINE 9
    032 PUSH1 00 - LINE 9
    034 CODECOPY - LINE 9
    035 PUSH1 00 - LINE 9
    037 RETURN - LINE 9
    038 INVALID -
    039 PUSH1 80 -
    041 PUSH1 40 -
    043 MSTORE -
    044 CALLVALUE -
    045 DUP1 -
    046 ISZERO -
    047 PUSH1 0f -
    049 JUMPI -
    050 PUSH1 00 -
    052 DUP1 -
    053 REVERT -
    054 JUMPDEST -
    055 POP -
    056 PUSH1 04 -
    058 CALLDATASIZE -
    059 LT -
    060 PUSH1 28 -
    062 JUMPI -
    063 PUSH1 00 -
    065 CALLDATALOAD -
    066 PUSH1 e0 -
    068 SHR -
    069 DUP1 -
    070 PUSH4 57de26a4 -
    075 EQ -
    076 PUSH1 2d -
    078 JUMPI -
    079 JUMPDEST -
    080 PUSH1 00 -
    082 DUP1 -
    083 REVERT -
    084 JUMPDEST -
    085 PUSH1 33 -
    087 PUSH1 47 -
    089 JUMP -
    090 JUMPDEST -
    091 PUSH1 40 -
    093 MLOAD -
    094 PUSH1 3e -
    096 SWAP2 -
    097 SWAP1 -
    098 PUSH1 67 -
    100 JUMP -
    101 JUMPDEST -
    102 PUSH1 40 -
    104 MLOAD -
    105 DUP1 -
    106 SWAP2 -
    107 SUB -
    108 SWAP1 -
    109 RETURN -
    110 JUMPDEST -
    111 PUSH1 00 -
    113 DUP1 -
    114 SLOAD -
    115 SWAP1 -
    116 POP -
    117 SWAP1 -
    118 JUMP -
    119 JUMPDEST -
    120 PUSH1 00 -
    122 DUP2 -
    123 SWAP1 -
    124 POP -
    125 SWAP2 -
    126 SWAP1 -
    127 POP -
    128 JUMP -
    129 JUMPDEST -
    130 PUSH1 61 -
    132 DUP2 -
    133 PUSH1 50 -
    135 JUMP -
    136 JUMPDEST -
    137 DUP3 -
    138 MSTORE -

Here we are able to see that the COPYCODE opcode is used to ...

QUESTION 2
. Could the answer to Q1 allow an optimisation ?

QUESTION 3
. Can you trigger a revert in the init code in Remix ?

QUESTION 4
. Write some Yul to
. Add 0x07 to 0x08
. store the result at the next free memory location.
. (optional) write this again in opcodes

QUESTION 5
. Can you think of a situation where the opcode
EXTCODECOPY is used ?

QUESTION 6
. Complete the assembly exercises in this repo
Exercises

If you want to use gitpod, this is the format
https://gitpod.io/#https://github.com/ExtropyIO/ExpertSolidityBootcamp

Assembly_1.sol

    pragma solidity ^0.8.4;

    contract Intro {
        function intro() public pure returns (uint16) {
            uint256 mol = 420;

            // Yul assembly magic happens within assembly{} section
            assembly {
                // stack variables are instantiated with
                // let variable_name := VALßUE
                // instantiate a stack variable that holds the value of mol
                // To return it needs to be stored in memory
                // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
                // to return you need to specify address and the size from the starting point
            }
        }
    }

Assembly_2.sol

    pragma solidity ^0.8.4;

    contract Add {
        function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
            // Intermediate variables can't communicate between  assembly blocks
            // But they can be written to memory in one block
            // and retrieved in another.
            // Fix this code using memory to store the result between the blocks
            // and return the result from the second block
            assembly {
                let result := add(x, y)
            }

            assembly {
                return()
            }
        }
    }

Assembly_3.sol

    pragma solidity ^0.8.4;

    contract SubOverflow {
        // Modify this function so that on overflow it returns the value 0
        // otherwise it should return x - y
        function subtract(uint256 x, uint256 y) public pure returns (uint256) {
            // Write assembly code that handles overflows
            assembly {

            }
        }
    }

Assembly_4.sol

    pragma solidity ^0.8.4;

    contract Scope {
        uint256 public count = 10;

        function increment(uint256 num) public {
            // Modify state of the count variable from within
            // the assembly segment
            assembly {

            }
        }
    }
