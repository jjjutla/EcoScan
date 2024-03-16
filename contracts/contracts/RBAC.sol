// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RBAC {
    // Roles
    enum Role { User, Restaurant }

    // Map address to a role
    mapping(address => Role) public roles;

    // Events for registering users and restaurants
    event UserRegistered(address user);
    event RestaurantRegistered(address restaurant);

    // Modifier to check if the sender is a restaurant
    modifier onlyRestaurant() {
        require(roles[msg.sender] == Role.Restaurant, "Not a restaurant");
        _;
    }

    // Function to register a user
    function registerUser(address _userAddress) public {
        roles[_userAddress] = Role.User;
        emit UserRegistered(_userAddress);
    }

    // Function to register a restaurant
    function registerRestaurant(address _restaurantAddress) public {
        roles[_restaurantAddress] = Role.Restaurant;
        emit RestaurantRegistered(_restaurantAddress);
    }

    // Function to check if an address is a user
    function isUser(address _address) public view returns (bool) {
        return roles[_address] == Role.User;
    }

    // Function to check if an address is a restaurant
    function isRestaurant(address _address) public view returns (bool) {
        return roles[_address] == Role.Restaurant;
    }

}

