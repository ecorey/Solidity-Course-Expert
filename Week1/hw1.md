Homework 1
Blockchain
Discuss in your teams

QUESTION 1
. Why is client diversity important for Ethereum?

Client diversity in Ethereum refers to the fact that the network doesn't rely on a single client implementation of the Ethereum protocol. Instead, it embraces multiple implementations, such as Geth, Erigon, Nethermind, and Besu.

Having client diversity bolsters resilience, decentralization, choice, and security for the network. In the event of a bug in one client, the network can transition to another unaffected client, ensuring continuity and stability.

Following the recent "merge" in Ethereum's progression, client diversity has taken on even greater significance. If a bug affects 2/3 or more of the stake, it could lead to the finalization of an incorrect state root. If half or more of the client implementations are compromised, a dominant chain could emerge, which might later be reverted. And, if 1/3 of the clients are affected, no new transactions would be finalized.

As a result of client diversity, if a bug arises in one implementation, other clients are able to employ another implementation to ensure the bug does not gain traction and affect the network.

QUESTION 2
. Where is the full Ethereum state held ?

The full Ethereum state is stored in each Ethereum full node. Now that the Merge has taken place, a full node on Ethereum comprises both a consensus layer and an execution layer. The consensus layer secures the network using staking, while the execution layer processes transactions and maintains contract states.

The world state for Ethereum is linked to the Ethereum Virtual Machine (EVM) environment. This world state encompasses all existing simple and contract accounts. It ensures the integrity of its sequential states by validating each new state using a Merkle tree constructed from all block transactions, which helps secure the blockchain.

QUESTION 3
. What is a replay attack ? , which 2 pieces of information
can prevent it ?

In traditional networking a replay attack is a form of a man in the middle attack where an attacker is able to sit in between traffic and capture and alter packets that are being sent between hosts. A relay attack is where the attacker intercepts and transmits packets but does not alter them.

In the case of the Ethereum network a replay attack is the ability of an attacker to take a transaction on one blockchain and 'replay' is t on another blockchain.
In the case of Ethereum this was seen in the ETH and ETC hard fork as the two resulting chains shared similar transaction format and history it became possible to take a signed transaction that was broadcast in one chain and 'replay' it on the other chain.
The 2 pieces of information that can prevent a replay attack are the Chain ID and a Transaction nonce which both give a unique identifier to both the chain and a transaction on a chain that can only be used once.

There is also a signature replay attack that is possible on unsecured contracts. This is a case in which a signature can be used multiple times on a function where it was only intended to be used once. This may happen in a poorly written multisig contract where one user shares a signature with another user to call a function that is intended to be called only once. Using a nonce is also a way to prevent against signature replay attacks.

QUESTION 4
. In a contract, how do we know who called a view
function ?

It can be possible to know the caller of a view function via the msg.sender, but in the case of an off-chain call this can be spoofed.
