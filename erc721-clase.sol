// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyToken is ERC721URIStorage {

    uint256 private tokenId;

    constructor() ERC721("MyToken", "MTK") {
        tokenId = 0;
    }

    function mint(address _to, string memory _tokenURI) public {
        tokenId++; //tokenId = tokenId + 1;
        _safeMint(_to, tokenId);
        _setTokenURI(tokenId, _tokenURI);
    }

}

https://metadata.artlab.xyz/0185fa75-ba04-8156-9fbe-bb39dc263392/519

{
    "name": "name",
    "description": "description",
    "image": "https://ipfs.io/ipfs/QmTgqnhFBMkfT9s8PHKcdXBn1f5bG3Q5hmBaR4U6hoTvb1?filename=Chainlink_Elf.png",
    "attributes": [
        {
            "trait_type": "trait",
            "value": 100
        }
    ]
}

/////


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

contract EjemploOwner is Ownable {


    uint public value;
    //Cualquier cuenta puede ejecutarla
    function normalThing() public payable{
        value = value + msg.value;
    }

    //Solo el owner pueda ejecutarla
    function specialThing(address payable _to) public onlyOwner{
        //Transferir los fondos del contrato a la cuenta _to
        _to.transfer(address(this).balance);
    }
}
