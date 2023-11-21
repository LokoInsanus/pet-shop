import 'package:flutter/material.dart';
import 'package:pet_shop/src/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/src/models/cliente.dart';

List<DataRow> CreateClienteRows() {
  List<DataRow> rows = [];
  List<Cliente> dados = ClienteDaoMemory().listarTodos();

  for (var dado in dados) {
    rows.add(DataRow(cells: [
      DataCell(Text(dado.id.toString())),
      DataCell(Text(dado.nome)),
      DataCell(Text(dado.email)),
      DataCell(Text(dado.rua)),
      DataCell(Text(dado.bairro)),
      DataCell(Text(dado.numeroCasa)),
      DataCell(Text(dado.numeroTelefone)),
      DataCell(Text(dado.cpf))
    ]));
  }
  return rows;
}
