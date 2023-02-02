//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

  /*Actividad
    Crea un smart comntract que sea capaz de gestionar una cuenta de ahorro.
    Funciones clave que puede tener tu smart contract:
    -Crear una persona que pueda guardar nombre, edad, saldo
    -Asociar a la persona con su address
    
    -Agregar Saldo
    -Quitar Saldo
    -Ver Saldo
    -Ver datos de la persona
 */
    //Guardar mi adress

    //Agregar saldo

    //Quitar saldo

    //VerSaldo

    //Guardar nombre, edad, saldo

contract SavingsAccount {
    // Crea una estructura para almacenar la información de la persona
    struct Person {
        string name;
        uint age;
        uint balance;
    }

    mapping (address => Person) public people;

    // Función para crear una persona
    function createPerson(string memory _name, uint _age) public {
        people[msg.sender] = Person(_name, _age, 0);
    }

    // Función para agregar saldo a la cuenta de la persona
    function addBalance(uint _amount) public {
        people[msg.sender].balance += _amount;
    }

    // Función para quitar saldo de la cuenta de la persona
    function removeBalance(uint _amount) public {
        people[msg.sender].balance -= _amount;
    }

    // Función para ver el saldo de la cuenta de la persona
    function viewBalance() public view returns (uint) {
        return people[msg.sender].balance;
    }

    // Función para ver los datos de la persona
    function viewPerson() public view returns (string memory, uint, uint) {
        Person memory person = people[msg.sender];
        return (person.name, person.age, person.balance);
    }
}
