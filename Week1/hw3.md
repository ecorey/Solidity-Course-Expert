Homework 3
HomeworkEVM1

QUESTION 1
. What are the advantages and disadvantages of the 256
bit word length in the EVM

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

---
