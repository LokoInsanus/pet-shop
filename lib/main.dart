import 'package:flutter/material.dart';
import 'package:pet_shop/views/pages/home.dart';
import 'package:pet_shop/views/pages/registroCliente.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shop',
      routes: {
        '/': (context) => const Home(),
        '/cliente': (context) => const RegistroCliente(),
      },
      
    );
  }
}
