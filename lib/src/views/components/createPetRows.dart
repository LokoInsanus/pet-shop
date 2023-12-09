import 'package:flutter/material.dart';
import 'package:pet_shop/src/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/src/dao/memory/petDaoMemory.dart';
import 'package:pet_shop/src/models/cliente.dart';
import 'package:pet_shop/src/models/pet.dart';

List<DataRow> CreatePetRows(BuildContext context) {
  List<DataRow> rows = [];
  List<Pet> dados = PetDaoMemory().listarTodos();
  Cliente dono;

  for (var dado in dados) {
    dono = ClienteDaoMemory().selecionarPorId(dado.idDono) as Cliente;
    rows.add(DataRow(cells: [
      DataCell(Text(dado.id.toString())),
      DataCell(Text(dado.nome)),
      DataCell(Text(dono.nome)),
      DataCell(Text(dado.animal)),
      DataCell(Text(dado.raca)),
      DataCell(Text(dado.rga)),
      DataCell(PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
              value: 'editar',
              child: Text('Editar'),
            ),
            const PopupMenuItem<String>(
              value: 'excluir',
              child: Text('Excluir'),
            ),
        ],
        onSelected: (value) {
          if(value == 'editar') {
            Navigator.of(context).pushReplacementNamed('/editarPet', arguments: dado);
          }
          else if(value == 'excluir') {
            PetDaoMemory().excluir(dado);
            PetDaoMemory().postPet();
            Navigator.of(context).pushReplacementNamed('/listarPets');
          }
        },
      ))
    ]));
  }
  return rows;
}
