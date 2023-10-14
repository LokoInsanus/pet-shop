import 'package:flutter/material.dart';
import 'package:pet_shop/view/textForm.dart';

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
          title: Text('Pet Shop'),
        ),
        body: const Column(children: [
          SizedBox(height: 20,),
          textForm(name: 'Nome do Cliente'),
          SizedBox(height: 20,),
          textForm(name: 'Email do Cliente',),
          SizedBox(height: 20,),
          textForm(name: 'Rua do Cliente',),
          SizedBox(height: 20,),
          textForm(name: 'Bairro do Cliente',),
          SizedBox(height: 20,),
          textForm(name: 'Número da casa do Cliente',),
          SizedBox(height: 20,),
          textForm(name: 'CPF do Cliente',),
        ]),
      ),
    );
  }
}
