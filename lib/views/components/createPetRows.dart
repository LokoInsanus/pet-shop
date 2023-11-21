import 'package:flutter/material.dart';
import 'package:pet_shop/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/dao/memory/petDaoMemory.dart';
import 'package:pet_shop/models/cliente.dart';
import 'package:pet_shop/models/pet.dart';

List<DataRow> CreatePetRows() {
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
    ]));
  }
  return rows;
}
