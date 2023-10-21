import 'package:flutter/material.dart';
import 'package:pet_shop/views/components/createTable.dart';

class ListarClientes extends StatelessWidget {
const ListarClientes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Listagem de Cliente'),
        centerTitle: true,
      ),
      body: CreateTable()
    );
  }
}