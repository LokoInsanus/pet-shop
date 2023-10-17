import 'package:flutter/material.dart';
import 'package:pet_shop/views/components/buildForm.dart';

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
          'Número da casa do Cliente', 
          'CPF do Cliente'
          ], 
          heights: 20, 
          cpfField: 'CPF do Cliente'
        ),
        const SizedBox(height: 20,),
        SizedBox(
          height: 50,
          width: 500,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ), 
            child: const Text(
              'Salvar',
                style: TextStyle(
                  fontSize: 25
                ),
            ),
          ),
        )
      ]),
    );
  }
}