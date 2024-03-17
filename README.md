# CambridgeHack


## Tech Stack
All code is commented 🚀

## Worflow
#### Sign-Up & Login:
-  Once the user opens the app they are faced with two options:
    1. Login: Connect wallet
          - `@walletconnect/web3modal-swift`: to connect to their existing veworld wallet.
    2. Sign Up: Walletless onboarding using Google login and web3auth as a non-custodial way of storing private keys:
          - `@vechain/connex` to build the raw data for contract interaction and allow a logical fork at the latest step between Web3Auth and connex-signing-service.
          - `thor-devkit` to handle transaction signing.
          - `@vechain/ethers` for custom wallet management with a private key.
          - `@walletconnect/web3modal-swift` and `@web3auth/modal` for the Web3Auth implementation.
          - `@google/GoogleSignIn-iOS`: authenticating google credentials.
 - A Role-Based Access Control contract is used to manage if a user is a consumer or a restaurant and their access within the app.


#### Login as a Restaurant:
- The restaurant captures an image of the real world food item they want to tokenise.
- A photo is sent from the app to our python server (http://176.58.109.155/) and uploads it to an AWS EC2 instance.
- The AWS EC2 instance is running Nvidia's NeRF Instant NGP that is used to generate a 3D model (usdz) from an image.
- The 3D model is hashed and stored on IPFS using Web3Storage.
- The restaurant inputs details about the item (Name, Price, Use-by-Date).
- Face ID is used to generate a signer key and `@vechain/vechain-sdk-core` is used to sign the transaction and deploy an NFT digital twin contract that contains the hash of the model along with the metadata.
- The tokenised food item is then displayed in the marketplace.

#### Login as a Consumer:
- The user can view the marketplace of the restaurants and food items with their digital twin NFT's.
- The user can view the food items in AR on their phone.
- The user can decide to buy an item and the NFT marketplace contract manages tranasactions of tokens between users.
- To make a seamless experaince for new users fee delegation is used to facilitate the sale using Apple Pay.
- Once the users make a purchase they are rewarded with a percentage of tokens using a custom ERC-20 token that can be used for discounts on future purchases or events at the restaurant.
- Users can leave reviews and feedback and are rewarded a small token for community feedback.


## Tokenomics
