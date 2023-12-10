import 'package:flutter/material.dart';
import 'package:pet_shop/src/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/src/dao/memory/petDaoMemory.dart';
import 'package:pet_shop/src/dao/petDao.dart';
import 'package:pet_shop/src/models/cliente.dart';
import 'package:pet_shop/src/models/pet.dart';
import 'package:pet_shop/src/views/components/back.dart';
import 'package:pet_shop/src/views/components/backgroundImage.dart';
import 'package:pet_shop/src/views/components/defaultButton.dart';
import 'package:pet_shop/src/views/components/dropdownButtonForm.dart';
import 'package:pet_shop/src/views/components/textForm.dart';

// ignore: must_be_immutable
class EditarPet extends StatefulWidget {
  const EditarPet({ Key? key }) : super(key: key);

  @override
  State<EditarPet> createState() => _RegistroPetState();
}

class _RegistroPetState extends State<EditarPet> {
  late bool invalidNome = false;
  late bool invalidAnimal = false;
  late bool invalidRaca = false;
  late bool invalidRGA = false;

  late String textNome = "";
  late DropdownButtonForm textDono = DropdownButtonForm(donos, placeholder: '',);
  late String textAnimal = "";
  late String textRaca = "";
  late String textRGA = "";

  PetDao petDao = PetDaoMemory();
  List<Cliente> donos = ClienteDaoMemory().listarTodos();

  void salvarDados() {
    Pet pet = ModalRoute.of(context)!.settings.arguments as Pet;
    Pet registro = pet;

    registro.nome = textNome == '' ? pet.nome : textNome;
    try {
      registro.idDono = textDono.textValue == '' ? pet.idDono : textDono.textValue;
    } catch (e) {
      registro.idDono = 1;
    }
    registro.animal = textAnimal == '' ? pet.animal : textAnimal;
    registro.raca = textRaca == '' ? pet.raca : textRaca;
    registro.rga = textRGA == '' ? pet.rga : textRGA;

    setState(() {
      registro = pet;
      invalidNome = registro.nome.isEmpty;
      invalidAnimal = registro.animal.isEmpty;
      invalidRaca = registro.raca.isEmpty;
      invalidRGA = registro.rga.length != 9;
    });

    if(!invalidNome && !invalidAnimal && !invalidRaca && !invalidRGA) {
      petDao.alterar(registro);
      Navigator.of(context).pop();
      petDao.postPet();
    }
  }

  @override
  Widget build(BuildContext context){
    double contextWidth = MediaQuery.of(context).size.width;
    double contextHeight = MediaQuery.of(context).size.height;
    Pet pet = ModalRoute.of(context)!.settings.arguments as Pet;
    return Material(
      child: BackgroundImage(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: contextWidth < 800 ? 0 : 0.2 * contextWidth, right:  contextWidth < 800 ? 0 : 0.2 * contextWidth),
              decoration: const BoxDecoration(
                color: Color(0xCCCFF4FF),
              ),
              child: ListView(children: [
                SizedBox(height: 0.15 * contextHeight),
                TextForm('Nome do Pet', onChanged: (value) => textNome = value, invalid: invalidNome, placeholder: pet.nome,),
                const SizedBox(height: 40,),
                TextForm('Animal', onChanged: (value) => textAnimal = value, invalid: invalidAnimal, placeholder: pet.animal,),
                const SizedBox(height: 40,),
                textDono,
                const SizedBox(height: 40,),
                TextForm('Raça', onChanged: (value) => textRaca = value, invalid: invalidRaca, placeholder: pet.raca,),
                const SizedBox(height: 40,),
                TextForm('RGA', rga: true, onChanged: (value) => textRGA = value, invalid: invalidRGA, placeholder: pet.rga,),
                const SizedBox(height: 40,),
                DefaultButton('SALVAR', function: salvarDados),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.025 * contextHeight, left: 0.22 * contextWidth),
              child: const Back()
            ),            
          ],
        ),
      ),
    );
  }
}