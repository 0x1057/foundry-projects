// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {
    uint256 myFavoriteNumber; // defaults to 0

    uint256[] listOfFavoriteNumbers; 

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // dynamic array
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    // static array
    // Person[3] public listOfPeople; // [] - empty list

    // Person public zac = Person({favoriteNumber: 44, name: "Zac"});
    // Person public karla = Person({favoriteNumber: 7, name: "Karla"});

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson( string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}