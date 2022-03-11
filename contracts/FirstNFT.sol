// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

//Import some OpenZeppelin Contracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

//We inherit the contract we imported. Meaning that we'll have access to the inherited contract's methods.
contract FirstNFT is ERC721URIStorage {

    //Magic from OpenZeppelin that helps us keep track of tokenIds
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //We need to pass the name of our NFTs token and its symbol
    constructor() ERC721 ("HarryNFT", "HP"){
        console.log("This is my first NFT contract. Whoa!");
    }

    //A function our user will hit to get their NFT.
    function makeAnNFT() public {
        //Get the current tokenId, this starts at 0.
        uint256 newItemId = _tokenIds.current();

        //Mint the NFT to the sender
        _safeMint(msg.sender, newItemId);

        //Set the NFTs data
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/EL0V");
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        //Increment the counter for when the next NFT is minted
        _tokenIds.increment();
    }

}