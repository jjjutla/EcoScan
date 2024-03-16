// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/utils/SafeERC721.sol";

contract FoodNFTMarketplace is ReentrancyGuard {
    using SafeERC721 for IERC721;

    // Struct to keep track of listed items
    struct Listing {
        uint256 price;
        address seller;
    }

    // Mapping from token ID to their listing
    mapping(uint256 => Listing) public listings;

    IERC721 public immutable nftContract;

    event Listed(uint256 indexed tokenId, uint256 price, address seller);
    event Sale(uint256 indexed tokenId, uint256 price, address seller, address buyer);

    constructor(address _nftContract) {
        require(_nftContract != address(0), "Invalid NFT contract address");
        nftContract = IERC721(_nftContract);
    }

    // Function to list an NFT on the marketplace
    function list(uint256 tokenId, uint256 price) public nonReentrant {
        require(nftContract.ownerOf(tokenId) == msg.sender, "Caller is not the owner");
        require(price > 0, "Price must be greater than zero");

        nftContract.safeTransferFrom(msg.sender, address(this), tokenId);
        listings[tokenId] = Listing(price, msg.sender);

        emit Listed(tokenId, price, msg.sender);
    }

    // Function to buy a listed NFT
    function buy(uint256 tokenId) public payable nonReentrant {
        Listing memory listing = listings[tokenId];
        require(listing.price > 0, "Item not listed");
        require(msg.value >= listing.price, "Insufficient funds");

        delete listings[tokenId];
        nftContract.safeTransferFrom(address(this), msg.sender, tokenId);

        payable(listing.seller).transfer(listing.price);
        emit Sale(tokenId, listing.price, listing.seller, msg.sender);
    }

    // Function to cancel a listing
    function cancel(uint256 tokenId) public nonReentrant {
        Listing memory listing = listings[tokenId];
        require(listing.seller == msg.sender, "Caller is not the seller");

        delete listings[tokenId];
        nftContract.safeTransferFrom(address(this), msg.sender, tokenId);
    }

    // Retrieve listing details
    function getListing(uint256 tokenId) public view returns (Listing memory) {
        return listings[tokenId];
    }
}
