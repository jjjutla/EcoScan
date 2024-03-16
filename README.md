# CambridgeHack


## Worflow
#### Sign-Up & Login
-  Once the user opens the app they are faced with two options:
    1. Login: Connect to their existing veworld wallet
       - `@walletconnect/web3modal-swift`: to connect to the veworld wallet using swift
    2. Sign Up: Walletless onboarding using Google login and web3auth as a non-custodial way of storing private keys:
      - `@vechain/connex` to build the raw data for contract interaction and allow a logical fork at the latest step between Web3Auth and connex-signing-service.
      - `thor-devkit` to handle transaction signing.
      - `@vechain/ethers` for custom wallet management with a private key.
      - `@walletconnect/web3modal-swift` and `@web3auth/modal` for the Web3Auth implementation.
      - `@google/GoogleSignIn-iOS`: authenticating google credentials.
 - A Role-Based Access Control contract is used to manage if a user is a consumer or a restaurant and their access within the app.
