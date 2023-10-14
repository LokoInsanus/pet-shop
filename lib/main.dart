import 'package:flutter/material.dart';

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
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {},
          child: Text(
            'Enviar',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Column(children: [
          Form(
            child: TextFormField(
              decoration: InputDecoration(hintText: 'Oi'),
            ),
          )
        ]),
      ),
    );
  }
}
