// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
//import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC721URIStorage {

    uint256 private tokenId;
    constructor() ERC721("MyToken", "MTK") {
        tokenId = 0;
    }

    function mint(address _to, string memory _tokenURI) public {
        tokenId++;
        _safeMint(_to, tokenId);
        _setTokenURI(tokenId, _tokenURI);
    }
}
