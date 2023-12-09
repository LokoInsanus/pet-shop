import 'package:firebase_core/firebase_core.dart';
import 'package:pet_shop/src/dao/clienteDao.dart';
import 'package:pet_shop/src/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/src/dao/memory/petDaoMemory.dart';
import 'package:pet_shop/src/dao/petDao.dart';
import 'package:pet_shop/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/src/views/pages/editarCliente.dart';
import 'package:pet_shop/src/views/pages/editarPet.dart';
import 'package:pet_shop/src/views/pages/home.dart';
import 'package:pet_shop/src/views/pages/listarClientes.dart';
import 'package:pet_shop/src/views/pages/listarPets.dart';
import 'package:pet_shop/src/views/pages/login.dart';
import 'package:pet_shop/src/views/pages/registroCliente.dart';
import 'package:pet_shop/src/views/pages/registroPet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ClienteDao clienteDao = ClienteDaoMemory();
  clienteDao.getCliente();

  PetDao petDao = PetDaoMemory();
  petDao.getPet();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shop',
      initialRoute: '/login',
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/registroCliente': (context) => const RegistroCliente(),
        '/registroPet': (context) => const RegistroPet(),
        '/listarClientes': (context) => ListarClientes(),
        '/listarPets': (context) => const ListarPets(),
        '/editarCliente': (context) => const EditarCliente(),
        '/editarPet':(context) => const EditarPet()
      },
    );
  }
}
