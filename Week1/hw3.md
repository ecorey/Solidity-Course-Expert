Homework 3
HomeworkEVM1

QUESTION 1
. What are the advantages and disadvantages of the 256
bit word length in the EVM

There are both advantages and disadvantages to having a 256 bit word length in the EVM. The main advantages are security/ cryptographic strength, consistency with the Keccak-256 cryptographic algorithm used by Ethereum, and the ability to use very large numbers.

Some of the disadvantages are the inefficiency that this creates in using smaller values, and it creates more complexity in developing and understanding code which in turn creates a higher probability for potential errors and bugs.

---

QUESTION 2
. What would happen if the implementation of a
precompiled contract varied between Ethereum clients ?

A precompiled contract is a method of optimizing development and gas consumption by using a prewritten contract that performs a common gas intensive task such as cryptographic operations, or elliptic curve arithmetic operations in an efficient manner using assembly level instructions. Currently there are 9 precompiled contracts in solidity.

Ethereum clients are the software implementation of the Ethereum protocol allowing nodes to maintain a shared ledger, validate transactions, and execute smart contracts. Every client has its own implementation of the EVM and the various clients are written in different programming languages such as Go, Rust, Java, and C#. Changes in the Ethereum protocol reflected in the EIPs are updated and maintained in the clients.

Ethereum clients are responsible for implementing all the areas of the Ethereum protocol and in relationship to precompiled contracts if there were to be variations between clients then it would create an issue with consensus in the network and in a worst case situation could possibly even create a situation where there are nodes running different clients that end up on different versions of the blockchain crating an unwanted fork.

---

QUESTION 3
. Using Remix write a simple contract that uses a memory
variable, then using the debugger step through the
function and inspect the memory

    //SPDX-License-Identifier: MIT

    pragma solidity 0.8.19;

    contract memoryVariable {

        // function uses a uint256 variable in memory and returns it.
        // there are no state variables being held in the contract's storage
        function useMemoryNumberVar(uint256 memVar) public pure returns (uint256) {
            uint256 memoryNumberVariable = memVar;
            return memoryNumberVariable;
        }

    }

DEBUGGER:

input for the function was: 11

Memory:
{
"0x0": "0000000000000000000000000000000000000000000000000000000000000000\t????????????????????????????????",
"0x20": "0000000000000000000000000000000000000000000000000000000000000000\t????????????????????????????????",
"0x40": "0000000000000000000000000000000000000000000000000000000000000080\t????????????????????????????????"
}

---
