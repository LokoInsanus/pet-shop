import 'package:flutter/material.dart';
import 'package:pet_shop/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/dao/memory/petDaoMemory.dart';
import 'package:pet_shop/dao/petDao.dart';
import 'package:pet_shop/models/cliente.dart';
import 'package:pet_shop/models/pet.dart';
import 'package:pet_shop/views/components/buttonForm.dart';
import 'package:pet_shop/views/components/dropdownButtonForm.dart';
import 'package:pet_shop/views/components/textForm.dart';

// ignore: must_be_immutable
class RegistroPet extends StatefulWidget {
  const RegistroPet({ Key? key }) : super(key: key);

  @override
  State<RegistroPet> createState() => _RegistroPetState();
}

class _RegistroPetState extends State<RegistroPet> {
  late bool invalidNome = false;
  late bool invalidAnimal = false;
  late bool invalidRaca = false;
  late bool invalidRGA = false;

  late String textNome = "";
  late DropdownButtonForm textDono = DropdownButtonForm(donos);
  late String textAnimal = "";
  late String textRaca = "";
  late String textRGA = "";

  PetDao petDao = PetDaoMemory();
  List<Cliente> donos = ClienteDaoMemory().listarTodos();

  void salvarDados() {
    final Pet registro = Pet(id: 0, nome: '', idDono: 0, animal: '', raca: '', rga: '');

    registro.nome = textNome;
    try {
      registro.idDono = textDono.textValue;
    } catch (e) {
      registro.idDono = 1;
    }
    registro.animal = textAnimal;
    registro.raca = textRaca;
    registro.rga = textRGA;

    setState(() {
      invalidNome = registro.nome.isEmpty;
      invalidAnimal = registro.animal.isEmpty;
      invalidRaca = registro.raca.isEmpty;
      invalidRGA = registro.rga.length != 9;
    });

    if(!invalidNome && !invalidAnimal && !invalidRaca && !invalidRGA) {
      petDao.inserir(registro);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Cadastro de Pet'),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(height: 20,),
        TextForm('Nome do Pet', onChanged: (value) => textNome = value, invalid: invalidNome,),
        const SizedBox(height: 20,),
        TextForm('Animal', onChanged: (value) => textAnimal = value, invalid: invalidAnimal,),
        const SizedBox(height: 20,),
        textDono,
        const SizedBox(height: 20,),
        TextForm('Raça', onChanged: (value) => textRaca = value, invalid: invalidRaca,),
        const SizedBox(height: 20,),
        TextForm('RGA', rga: true, onChanged: (value) => textRGA = value, invalid: invalidRGA,),
        const SizedBox(height: 20,),
        ButtonForm('Salvar', function: salvarDados),
      ]),
    );
  }
}