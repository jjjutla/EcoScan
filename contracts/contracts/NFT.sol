// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract NFT is
    Initializable,
    ERC721Upgradeable,
    ERC721EnumerableUpgradeable,
    ERC721BurnableUpgradeable,
    AccessControlUpgradeable,
    UUPSUpgradeable
{
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant UPGRADER_ROLE = keccak256("UPGRADER_ROLE");

    struct FoodItem {
        string name;
        uint256 price;
        uint256 useByDate;
        string modelHash;
    }

    mapping(uint256 => FoodItem) private _foodItems;

    event FoodItemMinted(uint256 indexed tokenId, string name, uint256 price, uint256 useByDate, string modelHash);
    event FoodItemBurned(uint256 indexed tokenId);

    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __ERC721_init("FoodNFT", "FNFT");
        __ERC721Enumerable_init();
        __ERC721Burnable_init();
        __AccessControl_init();
        __UUPSUpgradeable_init();

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(UPGRADER_ROLE, msg.sender);
    }

    function safeMint(address to, uint256 tokenId, string memory name, uint256 price, uint256 useByDate, string memory modelHash) public onlyRole(MINTER_ROLE) {
        _safeMint(to, tokenId);
        _foodItems[tokenId] = FoodItem(name, price, useByDate, modelHash);
        emit FoodItemMinted(tokenId, name, price, useByDate, modelHash);
    }

    function burn(uint256 tokenId) public override {
        require(hasRole(MINTER_ROLE, msg.sender) || ownerOf(tokenId) == msg.sender, "Only minter or owner can burn");
        delete _foodItems[tokenId];
        _burn(tokenId);
        emit FoodItemBurned(tokenId);
    }

    function getFoodItemDetails(uint256 tokenId) public view returns (FoodItem memory) {
        require(_exists(tokenId), "Food item does not exist");
        return _foodItems[tokenId];
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyRole(UPGRADER_ROLE) {}

    // Override required functions
    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721Upgradeable, ERC721EnumerableUpgradeable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721Upgradeable, ERC721EnumerableUpgradeable, AccessControlUpgradeable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
