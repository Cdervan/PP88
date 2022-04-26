// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract PP88 is ERC721URIStorage {
    uint256 cap = 88;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    event NewEpicNFTMinted(address sender, uint256 tokenId);

    constructor() ERC721("Sand Planet", "PP88") {
        console.log("beep boop bop... I wanna die");
    }

    function makePP88() public {
        uint256 newItemId = _tokenIds.current();
        require(newItemId < cap, "No more PPs... Sorry");
        uint256 itemIdNext = newItemId + 1;
        string memory pngMatcher = Strings.toString(itemIdNext);

        string memory finalTokenUri = string(
            abi.encodePacked(
                "ipfs://QmNgggUtRa2h6mxW6fhVjvrM6vCQDqYgM3vQEF2CZesWJV/",
                pngMatcher,
                ".json"
            )
        );

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, finalTokenUri);

        _tokenIds.increment();

        console.log("id:", newItemId, "final token uri", finalTokenUri);

        emit NewEpicNFTMinted(msg.sender, newItemId);
    }
}
