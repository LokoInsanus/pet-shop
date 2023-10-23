import 'package:flutter/material.dart';
import 'package:pet_shop/views/components/createClienteRows.dart';

class ListarClientes extends StatelessWidget {
const ListarClientes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Listagem de Cliente'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Nome')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Rua')),
                DataColumn(label: Text('Bairro')),
                DataColumn(label: Text('Número')),
                DataColumn(label: Text('Telefone')),
                DataColumn(label: Text('CPF')),
              ],
              rows: CreateClienteRows(),
            ),
          ),
        ]
      )
    );
  }
}