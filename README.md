# EcoScan

EcoScan is an iOS dApp developed on vechain, designed to promote sustainable grocery shopping and consumption habits via a ‘reduce-to-earn’ model. The app incentivises users to purchase and consume sustainable products by scanning the packaging of the product, where OCR and a machine learning classifier will reward the user with B3TR tokens proportional to the median sustainability score of the purchased product obtained from an Open Source Software (OSS) API. 


# Prototype Wireframes
<div style="text-align: center;">
    <img src="https://github.com/jjjutla/EcoScan/assets/22000925/58495c83-2f5b-4997-967e-5ed75386ff2a" width="20%">
    <img src="https://github.com/jjjutla/EcoScan/assets/22000925/11d43a3b-9aaa-4977-8210-6a267fec71c5" width="20%">
    <img src="https://github.com/jjjutla/EcoScan/assets/22000925/ac973c3b-7c69-49cb-a2b2-e3897c769d92" width="20%">
    <img src="https://github.com/jjjutla/EcoScan/assets/22000925/0eab7a42-26a2-4db7-9a59-c65b55dc9230" width="21.8%">
</div>

# Milestones
### Milestone 1 - Development of Initial Prototypes
- **Frontend:** Incorporate VisionKit and OCR into the app, build API coordinator that uses Web3Auth as a non-custodial way of storing private keys.
- **Backend:** Develop the initial Node.js server environment using Next.js to handle routing and API requests. Develop the logic of the smart contracts for user registration, that handles user registration and basic allocation of B3TR tokens as a welcome incentive and deploy on the testnet. Implement secure user authentication using Web3Auth and Google OAuth, ensuring a non-custodial management of private keys and secure login process. Integrate the core dataset of supermarket food types into the backend, setting up a preliminary ML model (semantic search using sequence transformers) to match scanned product names with this dataset for initial sustainability assessments.
- **Time Requirement:** 45 days (1.5 FTE)
- **Requested Budget: $10,000**

### Milestone 2 - Completion of functioning MVP
- **Frontend:** Fully incorporate backend including necessary API calls for transactions, receipt scanning and verification of sustainable behaviour. Ensure that the whole experience is done end-to-end.
- **Backend:** Improve smart contracts to include complex logic for calculating and disbursing B3TR tokens based on the sustainability score of products. This will involve integrating data from the ML model that assesses product sustainability. Develop functionality of receipt scanning and verification, linking proof of purchase to token rewards in the smart contract. Begin preliminary load testing to identify potential scalability issues.
- **Time Requirement:** 45 days (1.5 FTE)
- **Requested Budget: $10,000**

### Milestone 3 - QA, Security Testing, and Deployment
- **Frontend:** Write XCTests and UI tests for the iOS app to ensure that the app works as intended on various device screens and dimensions, ensure that connections to Google OAuth and Web3Auth are safe and cover deployment costs to the App Store.
- **Backend:** Conduct detailed security audits of the smart contracts and ML models to ensure there are no vulnerabilities in the token disbursement and product matching process. Full stack testing with the front end team and establishing documentation and continuous integration and deployment (CI/CD) pipelines to ensure smooth updates and maintenance post-launch.
Reserve $5,000 B3TR for tokens.
- **Time Requirement:** 45 days (1.5 FTE)
- **Requested Budget: $15,000**

