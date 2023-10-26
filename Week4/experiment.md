Homework 11
Optimisation 2

---

QUESTION 1
Why are negative numbers more expensive to store than positive numbers ?

In the Ethereum EVM, both negative and positive numbers are stored as a 256-bit word. The difference is that negative numbers are represented in two's complement form, which may account for the more expensive storage.

---

QUESTION 2
Test the following statements in Remix, which is cheaper and why ?
Assume that the denominator can never be zero.

    ``` result = numerator / demoninator; ```



    assembly {
        result := div(numerator, demoninator)
    }

Contract:

```

    // SPDX-License-Identifer: MIT
    pragma solidity 0.8.21;

    contract TestGas{




        function LineOne(uint256 numerator, uint256 demoninator) public pure returns(uint256) {
            uint256 result;
            result = numerator / demoninator;
            return result;
        }


        function LineTwo(uint256 numerator, uint256 demoninator) public pure returns(uint256) {
            uint256 result;
            assembly {
                result := div(numerator, demoninator)
            }
            return result;
        }


    }

```

Gas-Report:

![Gas Report1](https://github.com/ecorey/Solidity-Course-Expert/blob/main/Week3/report1.JPG)

![Gas Report2](https://github.com/ecorey/Solidity-Course-Expert/blob/main/Week3/report2.JPG)

Less gas is used when using the assmebly block in the LineTwo function. In both functions above they only access local variables and both take the same inputs and have the same return value.
