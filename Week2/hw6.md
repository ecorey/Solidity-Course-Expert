Homework 6
Assembly 2

QUESTION 1
. Create a Solidity contract with one function
The solidity function should return the amount of ETH
that was passed to it, and the function body should be
written in assembly

    // SPDX-License-Identifier: MIT

    pragma solidity 0.8.18;

    contract ReturnValue{


        function returnEth() public payable returns (uint256 value) {
            // callvalue() is the assembly function to access msg.value
            assembly {
                value := callvalue()
            }
        }


    }

---

QUESTION 2
. Do you know what this code is doing ?

    :: The mstore opcode uses the offset of the msize and saves the push9 to memory
    // Place 9 byte item on stack #68
    push9 0x601e8060093d393df3
    // Get the size of active memory in bytes #59
    msize
    // Save word to memory, takes 2 stack input (offset, value) #52
    mstore                                   # mem = 000...000
    601e8060093d393df3

                                             # = 000...000 spawned

    constructor payload

    # copy the runtime bytecode after the constructor code

    in mem
    // Size of code running in current environment, input(destOffset, offset, size)#38
    codesize                                 # cs
    // Size of output data from the previous call from current environment output(size) # 3D
    returndatasize                           # 0 cs
    // Get the size of active memory in bytes #59
    msize                                    # 0x20 0 cs
    // Code running in current environment to memory, input(destOffset, offset, size) #39
    codecopy                                 # mem = 000...000
    601e8060093d393df3 RUNTIME_BYTECODE

    # --- stack ---

    // Place 1 byte item on stack #60
    push1 9                                  # 9
    // Size of code running in current environment, input(destOffset, offset, size)#38
    codesize                                 # cs 9
    // Addition operation, input(a, b) output(a+b) #1
    add                                      # cs+9 = CS = total codesize

    in memory

    // Place 1 byte item on stack #60
    push1 23                                 # 23 CS
    // Size of output data from the previous call from current environment output(size) # 3D
    returndatasize                           # 0 23 CS
    // Duplicate 3rd stack item, input(a, b, c) output(c,a,b,c) #82
    dup3                                     # CS 0 23 CS
    // Duplicate 3rd stack item, input(a, b, c) output(c,a,b,c) #82
    dup3                                     # 23 CS 0 23 CS
    // Deposited value by instruction/transaction responsible for exec., output(value) #34
    callvalue                                # v 23 CS 0 23 CS
    // Create account with associated code, input(value, offset, size) output(address) #F0
    create                                   # addr1 0 23 CS
    // Remove item from stack input(y) #50
    pop                                      # 0 23 CS
    // Create account with associated code, input(value, offset, size) output(address) #F0
    create                                   # addr2
    // 	Halt execution and register account for later deletion, 1 stack input(address) #FF
    selfdestruct

See gist
The runtime bytecode for this contract is

    0x68601e8060093d393df35952383d59396009380160173d828234
    f050f0ff

---

QUESTION 3
Explain what the following code is doing in the Yul
ERC20 contract

    function allowanceStorageOffset(account,
    spender) -> offset {
        offset :=
    accountToStorageOffset(account)
        mstore(0, offset)
        mstore(0x20, spender)
        offset := keccak256(0, 0x40)
    }

In this section of code the function allowanceStorageOffset is taking two arguments, the account and spender and will return the value offset.

    function allowanceStorageOffset(account, spender) -> offset

In the next section the offset is assigned a value by calling the function accountToStorageOffset with the account argument passed in above. This function is not defined here but may be possibly related to offsetting a position in memory.

    offset := accountToStorageOffset(account)

The mstore stores the offset value to memory at position 0.

    mstore(0, offset)

The second mstore here saves the spender value to position 0x20.

    mstore(0x20, spender)

Finally in this line the offset is assigned a hash value starting at position 0 and the 0x40 is the size of the data to be hashed.

    offset := keccak256(0, 0x40)

Overall this function will compute an offset for a storage slot based on the account and spender values, which can then be used to store or retrieve an allowance value.
