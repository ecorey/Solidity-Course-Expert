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

For the answer see the GasOptimized.sol contract in the HW8_Foundry Repository and run the forge test command. There are two test files that are the exact same but one tests the original Gas.sol contract and the other the GasOptimized.sol contract so the gas report for each contract can be compared. The repository is found at:

[HW8 Repository (Foundry)](https://github.com/ecorey/HW8_Foundry)

---

Done So Far to Optimize:

- packing variables and checking for unallocated space with sol2uml storage
- removed checkIfWhiteListed modifier and combined logic into whiteTransfer function
- removed onlyAdminOrOwner modifier, added logic into updatePayment and addToWhitelist functions
- ***

Gas Report:

![Gas Report](https://github.com/ecorey/Solidity-Course-Expert/blob/main/Week2/report.JPG)

---

Class Diagram:

![Class Diagram](https://github.com/ecorey/Solidity-Course-Expert/blob/main/Week2/classDiagram.svg)

---

GasContract Storage:

![GasContract Storage](https://github.com/ecorey/Solidity-Course-Expert/blob/main/Week2/GasContract.svg)

---

GasContractOptimized Storage: (One less storage slot using the GasContractOptimized contract)

![GasContractOptimized Storage](https://github.com/ecorey/Solidity-Course-Expert/blob/main/Week2/GasContractOptimized.svg)
