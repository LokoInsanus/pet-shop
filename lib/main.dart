import 'package:flutter/material.dart';
import 'package:pet_shop/views/textForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shop',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pet Shop'),
        ),
        body: Column(children: [
          const SizedBox(height: 20,),
          textForm(name: 'Nome do Cliente'),
          const SizedBox(height: 20,),
          textForm(name: 'Email do Cliente',),
          const SizedBox(height: 20,),
          textForm(name: 'Rua do Cliente',),
          const SizedBox(height: 20,),
          textForm(name: 'Bairro do Cliente',),
          const SizedBox(height: 20,),
          textForm(name: 'Número da casa do Cliente',),
          const SizedBox(height: 20,),
          textForm(name: 'CPF do Cliente', cpf: true),
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
      ),
    );
  }
}
