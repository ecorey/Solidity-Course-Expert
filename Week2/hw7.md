Homework 7
Functions

QUESTION 1
The parameter X represents a function.

Complete the function signature so that X is a standard
ERC20 transfer function (other than the visibility)
The query function should revert if the ERC20 function
returns false

    function query(uint _amount, address _receiver, X)
    public {
    ...
    }

---

In this function the x argument can be the address to a ERC20 contract as a sunction itself cannot be passed as an argument. In order to accomplish this you would need to use an interface such as in this contract:

    // SPDX-License-Identifier: MIT

    pragma solidity 0.8.18;

    // ERC-20 Interface
    interface IERC20 {
        function transfer(address recipient, uint256 amount) external returns (bool);
    }

    contract Foo {
        // takes a token contract address as the third argument to use the standard
        // ERC20 transfer
        function query(uint256 _amount, address _receiver, IERC20 token) public {
            bool success = token.transfer(_receiver, _amount);
            require(success, "transfer failed");
        }
    }

---

QUESTION 2
The following function checks function details passed in the
data parameter.

    function checkCall(bytes calldata data) external{
    }

The data parameter is bytes encoded representing the
following:

Function selector
Target address
Amount (uint256)

Complete the function body as follows:

The function should revert if the function is not an ERC20
transfer function.

Otherwise extract the address and amount from the data
variable and emit an event with those details

    event transferOccurred(address,uint256);

---
