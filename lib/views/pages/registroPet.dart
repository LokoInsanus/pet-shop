import 'package:flutter/material.dart';

class RegistroPet extends StatelessWidget {
const RegistroPet({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Cadastro de Pet'),
        centerTitle: true,
      )
    );
  }
}