Homework 8
Gas optimisation team game

QUESTION 1
Clone this repo

    https://github.com/ExtropyIO/GasOptimisationFoundry

Your task is to edit and optimise the Gas.sol contract.
You cannot edit the tests.
All the tests must pass.
You can change the functionality of the contract as long as the tests pass.
Try to get the gas usage as low as possible.

To run tests & gas report with verbatim trace

Run:

    forge test --gas-report -vvvv

To run tests & gas report
Run:

    forge test --gas-report

To run a specific test
RUN:

    forge test --match-test {TESTNAME} -vvvv

EG:

    forge test --match-test test_onlyOwner -vvvv

---

For the answer see the HW8_Foundry Repository found at:

[HW8](https://github.com/ecorey/HW8_Foundry)

Class Diagram:

<!-- ![Class Diagram](https://github.com/ecorey/Solidity-Course-Expert/blob/main/Week2/classDiagram.svg) -->

<img src="https://github.com/ecorey/Solidity-Course-Expert/blob/main/Week2/classDiagram.svg" alt="Alt text" width="1200" height="1200">

GasContract Storage:

![GasContract Storage](https://github.com/ecorey/Solidity-Course-Expert/blob/main/Week2/GasContract.svg)

GasContractOptimized Storage:

![GasContractOptimized Storage](https://github.com/ecorey/Solidity-Course-Expert/blob/main/Week2/GasContractOptimized.svg)
