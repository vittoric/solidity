// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ToriCoin is ERC20 {
    constructor() ERC20("ToriCoin", "TCR") {}
}
