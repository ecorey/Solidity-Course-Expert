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

    026 PUSH1 b6 - LINE 9
    028 DUP1 - LINE 9
    029 PUSH2 0027 - LINE 9
    032 PUSH1 00 - LINE 9
    034 CODECOPY - LINE 9

Here we are able to see that the COPYCODE opcode is used to copy data from the code to memory. The COPYCODE opcode uses 3 arguments from the stack as memOffset, codeOffset, and length. This represents the strating position in memory where the data will be copied to, the starting position in the code itself where the data will be copied from, and the number of bytes to copy.

In this case theCOPYCODE is overwriting a segment of memory starting at position 0x00 and spanning 0x27 (39 in decimal) bytes.

---

QUESTION 2
. Could the answer to Q1 allow an optimisation ?

In order to optimize the code the removal of redundancies and in reusing memory slots. The COPYCODE allows a memory storage area to be reused and thus allows an optimization.

---

QUESTION 3
. Can you trigger a revert in the init code in Remix ?

The init code is used to inialize the code and is executed when the contract is deployed and the constructor is called. Because the constructor is only called once the init code is also only used once. To create a condition to trigger a revert in the init code you would need to create a condition where the constructor fails or a require statment is not met.

---

QUESTION 4
. Write some Yul to
. Add 0x07 to 0x08
. store the result at the next free memory location.
. (optional) write this again in opcodes

YUL:

    {
        // load the free memory pointer
        let freeMemPointer := mload(0x40)

        // perform addition: 0x07 + 0x08 = 0x0F
        let sum := add(0x07, 0x08)

        // store the result at the next free memory location
        mstore(freeMemPointer, sum)

        // update the free memory pointer to the next 32-byte aligned location
        mstore(0x40, add(freeMemPointer, 0x20))
    }

---

QUESTION 5
. Can you think of a situation where the opcode
EXTCODECOPY is used ?

The EXTCODECOPY is used to copy code from another contract into the memory of the current contract. This could be the case where a contract but not when a contract calls a function of another contract which would be done through CALL, DELEGATECALL, STATICCALL, or CALLCODE.
A contract may use EXTCODECOPY in the case of some proxy contract situations where a proxy retrieved and executed the code of another contract but remained the same.

---

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
                let  molValue := mol

                // To return it needs to be stored in memory
                // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
                mstore(0x80, molValue)

                // to return you need to specify address and the size from the starting point
                return(0x80, 0x20)
            }
        }
    }

---

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
                mstore(0x80, result)
            }

            assembly {
                return(0x80, 0x20)
            }
        }
    }

---

Assembly_3.sol

    pragma solidity ^0.8.4;

    contract SubOverflow {

        // Modify this function so that on overflow it returns the value 0
        // otherwise it should return x - y

        function subtract(uint256 x, uint256 y) public pure returns (uint256) {
            // Write assembly code that handles overflows
            assembly {

                let solution

                if gt(y, x) {
                    solution := 0
                    mstore(0x80, solution)
                }


                if or(gt(x, y), eq(x, y)){
                    solution := sub(x, y)
                    mstore(0x80, solution)
                }

            }

            assembly {

                    return(0x80, 0x20)

                }
        }
    }

---

Assembly_4.sol

    pragma solidity ^0.8.4;

    contract Scope {

        uint256 public count = 10;

        function increment(uint256 num) public {

            // Modify state of the count variable from within
            // the assembly segment

            assembly {

                let pCount := sload(0)
                pCount := add(pCount, num)
                sstore(0, pCount)

            }
        }
    }
