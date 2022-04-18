// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// Utility for incrementing numbers
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    // Setting the counter
    using Counters for Counters.Counter;
    Counters.Counter private tokenCount;
    address contractAddress;

    constructor(address marketplaceAddress) ERC721("Opensky NFT", "OPS") {
        contractAddress = marketplaceAddress;
    }

    // We pass as an argument the uri of the nft AKA the content of the nft (Digital art , music , audio real estate,
    //voting rights, or collectibles)
    function mint(string memory _tokenURI) external returns (uint256) {
        tokenCount.increment();
        uint256 newItemId = tokenCount.current();

        // mint the nft
        _safeMint(msg.sender, newItemId);
        // Matching the content of the token to the token
        _setTokenURI(newItemId, _tokenURI);
        // Authorize marketplace to transfer sold items from your address to the buyer's address.
        // We Trust or approve the marketplace to sell my NFTs
        setApprovalForAll(contractAddress, true);

        // return it to the frontend so we can sell it
        return newItemId;
    }
}
