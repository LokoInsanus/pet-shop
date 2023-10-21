import 'package:flutter/material.dart';

class ListarPets extends StatelessWidget {
const ListarPets({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Listagem de Pet'),
        centerTitle: true,
      )
    );
  }
}