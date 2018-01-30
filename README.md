# Building a Blockchain

Makers Academy practice final project. For our task we chose a technical challenge, and decided to build a blockchain from scratch.

## Approach
Team members had under-developed and overlapping understandings of what constitutes a blockchain. As such, in order to guide the project implementation - and in particular to reach a consensus as to what would be our MVP - the process began with a day of research.

The team concluded that the following constituted an MVP for a blockchain:
- the ability to add a new block to a chain
- the ability to keep a record of transactions within the chain
- the ability to mine blocks to create proof of work

Additional further steps that implement features on top of this MVP include introducing more than one node onto the chain, and thus distributing the ledger. This project was completed in 4.5 days and did not have time for this feature implementation.

## Tech Stack
The final blockchain is written in Ruby and development is test driven with RSpec.
The web interface combines html with erb, as well as elements of bootstrap and JQuery.
The server is implemented with the Sinatra framework.

## How it works
Responsibility for the BLOCK, BLOCKCHAIN, and TRANSACTION implementation is divided into three classes.

### BLOCK
- Blocks are each instances of the class Block, and are intialised with the required information, including the hash from the previous block, timestamp, index and hashes.
- This class is also responsible for producing a new hash, and mining blocks.

### BLOCKCHAIN
- The Blockchain class is responsible for adding blocks to the chain, adding new transactions to the transaction list, as well as adding the initial genesis block (without which the chain cannot be started).

### TRANSACTION
- The Transaction class is initiated with sender, recipient, and amount information, that can then be returned in the form of a hash and added to the transaction list by the the Blockchain class.

### APP
The App acts as a controller allowing blocks to be mined from a web interface.
