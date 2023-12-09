import 'package:flutter/material.dart';
import 'package:pet_shop/src/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/src/models/cliente.dart';

List<DataRow> CreateClienteRows(BuildContext context) {
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
      DataCell(Text(dado.cpf)),
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
            Navigator.of(context).pushReplacementNamed('/editarCliente', arguments: dado);
          }
          else if(value == 'excluir') {
            ClienteDaoMemory().excluir(dado);
            ClienteDaoMemory().postCliente();
            Navigator.of(context).pushReplacementNamed('/listarClientes');
          }
        },
      )),
    ]));
  }
  return rows;
}
