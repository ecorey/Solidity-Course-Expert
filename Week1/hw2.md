Homework 2
Solidity
QUESTION 1
. Write a function that will delete items (one at a time)
from a dynamic array without leaving gaps in the array.
You should assume that the items to be deleted are
chosen at random, and try to do this in a gas efficient
manner.
For example imagine your array has 12 items and you
need to delete the items at indexes 8, 2 and 7.
The final array will then have items {0,1,3,4,5,6,9,10,11}

---

// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract DeleteFromArray {

    uint256[] public nums;

    // initiates array with 8 integers
    constructor() {
        nums = [2, 3, 5, 7, 9, 11, 13, 15];
    }

    // function takes 3 indexes, deletes them and returns the array with no gaps.
    function deleteItems(uint256 index1, uint256 index2, uint256 index3) public returns (uint256[] memory) {
            require(index1 < nums.length && index2 < nums.length && index3 < nums.length, "Index out of bounds");

            // delete indexes by settign values to their default, in this case 0
            nums[index1] = 0;
            nums[index2] = 0;
            nums[index3] = 0;

            // create a new empty array minus the spots that where deleted
            uint256[] memory newNums = new uint256[](nums.length - 3);

            // using a for loop copy the values of the nums array, minus those equal to 0, into the newNums array
            uint256 j = 0;
            for (uint256 i = 0; i < nums.length; i++) {
                if (nums[i] != 0) {
                    newNums[j++] = nums[i];
                }
            }

            // copy the newly created newNums array back into the dynamic nums array
            nums = newNums;

            // return the original array minus the indexes that were deleted
            return nums;




    }

}
