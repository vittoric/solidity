//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract licencias{
    //Programa de recompensas

    //variable de estado
    int puntosTotales;
    int puntosEntrada;
//Private -- solo puede ser llamasa desde el mismo contrato
    function asignarPuntos(int _p1)private{
        puntosEntrada = _p1;

    }
    //interanl - puede ser llamadas desde el mismo y los que derivan de ella
    function SumarPuntos(int _p1) internal{
        asignarPuntos(_p1);
        puntosTotales = puntosTotales + puntosEntrada;
    }
       // public -- puede llamare desde otro contrato y genera un getter
       function verPuntos() public returns(int){
            this.verOwner();
            SumarPuntos(10);
            return puntosTotales;

            emit VerPuntos();
       }

       //external - se llama explicitamente y desde otrso contratos
       //variables globales
    address public sender;
       function verOwner() external{
           sender = msg.sender;
       }

    uint public blockNumber;
    uint public txPrice = tx.gasprice;
       function verVarGlobales() external{
           blockNumber = block.number;
       }


    //Eventos- manera en la que el blockchen se comunica 

    event VerPuntos();

    //Mutabilidad de funciiones -  cambioan o no el estado de la EVM
    //View- consultan pero no modifican el estado
    //Pure - No consultann ni modifican el estado

    
}

//Herencia
contract EjempoProg is licencias{
    
    address owner;
    function fun(int _p1) public{
        SumarPuntos(_p1);
        verPuntos();
    }

    constructor(){
        owner = msg.sender;
    }

 
}