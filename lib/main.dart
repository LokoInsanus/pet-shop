import 'package:flutter/material.dart';
import 'package:pet_shop/views/pages/home.dart';
import 'package:pet_shop/views/pages/listarClientes.dart';
import 'package:pet_shop/views/pages/listarPets.dart';
import 'package:pet_shop/views/pages/registroCliente.dart';
import 'package:pet_shop/views/pages/registroPet.dart';

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
        '/registroCliente': (context) => RegistroCliente(),
        '/registroPet': (context) => RegistroPet(),
        '/listarClientes': (context) => const ListarClientes(),
        '/listarPets': (context) => const ListarPets(),
      },
    );
  }
}
