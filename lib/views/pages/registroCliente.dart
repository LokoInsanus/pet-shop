import 'package:flutter/material.dart';
import 'package:pet_shop/views/components/buildForm.dart';
import 'package:pet_shop/views/components/buttonForm.dart';

class RegistroCliente extends StatelessWidget {
  const RegistroCliente({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Cadastro de Cliente'),
        centerTitle: true,
      ),
      body: Column(children: [
        BuildForm(
          const [
          'Nome do Cliente',
          'Email do Cliente',
          'Rua do Cliente',
          'Bairro do Cliente',
          'Número da Casa',
          'Número de Telefone',
          'CPF do Cliente'
          ], 
          heights: 20,
          cpfField: 'CPF do Cliente',
          numero: 'Número de Telefone',
        ),
        const SizedBox(height: 20,),
        const ButtonForm('Salvar' )
      ]),
    );
  }
}