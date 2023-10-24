import 'package:flutter/material.dart';
import 'package:pet_shop/views/components/createPetRows.dart';

class ListarPets extends StatelessWidget {
const ListarPets({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Listagem de Pet'),
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
                DataColumn(label: Text('Dono')),
                DataColumn(label: Text('Animal')),
                DataColumn(label: Text('Raça')),
                DataColumn(label: Text('RGA')),
              ],
              rows: CreatePetRows(),
            ),
          ),
        ]
      )
    );
  }
}