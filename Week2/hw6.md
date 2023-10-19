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

    push9 0x601e8060093d393df3
    msize
    mstore                                   # mem = 000...000
    601e8060093d393df3

                                             # = 000...000 spawned

    constructor payload

    # copy the runtime bytecode after the constructor code

    in mem
    codesize                                 # cs
    returndatasize                           # 0 cs
    msize                                    # 0x20 0 cs
    codecopy                                 # mem = 000...000
    601e8060093d393df3 RUNTIME_BYTECODE

    # --- stack ---

    push1 9                                  # 9
    codesize                                 # cs 9
    add                                      # cs+9 = CS = total codesize
    in memory

    push1 23                                 # 23 CS
    returndatasize                           # 0 23 CS
    dup3                                     # CS 0 23 CS
    dup3                                     # 23 CS 0 23 CS
    callvalue                                # v 23 CS 0 23 CS
    create                                   # addr1 0 23 CS
    pop                                      # 0 23 CS
    create                                   # addr2
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
