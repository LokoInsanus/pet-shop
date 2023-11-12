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
class RegistroPet extends StatelessWidget {
  RegistroPet({ Key? key }) : super(key: key);

  late TextForm textNome = TextForm('Nome do Pet');
  late DropdownButtonForm textDono = DropdownButtonForm(donos);
  late TextForm textAnimal = TextForm('Animal');
  late TextForm textRaca = TextForm('Raça');
  late TextForm textRGA = TextForm('RGA', rga: true,);

  PetDao petDao = PetDaoMemory();
  List<Cliente> donos = ClienteDaoMemory().listarTodos();

  void salvarDados() {
    final Pet registro = Pet(id: 0, nome: '', idDono: 0, animal: '', raca: '', rga: '');

    // registro.nome = textNome.textValue;
    // registro.idDono = textDono.textValue;
    // registro.animal = textAnimal.textValue;
    // registro.raca = textRaca.textValue;
    // registro.rga = textRGA.textValue;

    print(registro.idDono);
    petDao.inserir(registro);
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
        textNome,
        const SizedBox(height: 20,),
        textDono,
        const SizedBox(height: 20,),
        textAnimal,
        const SizedBox(height: 20,),
        textRaca,
        const SizedBox(height: 20,),
        textRGA,
        const SizedBox(height: 20,),
        ButtonForm('Salvar', function: salvarDados, route: '/',),
      ]),
    );
  }
}