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
