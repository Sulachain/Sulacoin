// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
/** 
 * Contrato Inteligente Sulacoin (SULA)
 * 
 * Descripción: Este contrato define las funcionalidades y características de Sulacoin (SULA), una criptomoneda diseñada para promover la adopción masiva de la tecnología blockchain en Honduras y más allá. 
 * Los tokens de Sulacoin se emiten y queman dinámicamente según la demanda y están disponibles para su compra.
 * Sulacoin es compatible con los estándares ERC-20 y BEP-20, lo que garantiza su interoperabilidad en múltiples blockchains.
 * 
 * Empresa: Microsula S. de R.L.
 * Sitio web: www.sulachain.com
 * 
 * AVISO LEGAL: La empresa emisora de Sulacoin, Microsula S. de R.L., no se hace responsable por el uso indebido de esta criptomoneda ni por pérdidas financieras resultantes de su uso. Se recomienda a los usuarios realizar una investigación exhaustiva y consultar con profesionales financieros antes de adquirir Sulacoin.
 */

pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.1/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.1/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@5.0.1/access/Ownable.sol";
import "@openzeppelin/contracts@5.0.1/token/ERC20/extensions/ERC20Permit.sol";

/// @custom:security-contact admin@sulachain.com
contract Sulacoin is ERC20, ERC20Burnable, Ownable, ERC20Permit {
    constructor(address initialOwner)
        ERC20("Sulacoin", "SULA")
        Ownable(initialOwner)
        ERC20Permit("Sulacoin")
    {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    function decimals() public view virtual override returns (uint8) {
    return 2;
    }
}