import 'package:flutter/material.dart';
import 'package:pet_shop/src/views/components/backgroundImage.dart';
import 'package:pet_shop/src/views/components/buttonForm.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: BackgroundImage(
        child: Column(children: [
          SizedBox(height: 20,),
          ButtonForm('Cadastrar Cliente', route: '/registroCliente',),
          SizedBox(height: 20,),
          ButtonForm('Cadastrar Pet', route: '/registroPet',),
          SizedBox(height: 20,),
          ButtonForm('Listar Clientes', route: '/listarClientes',),
          SizedBox(height: 20,),
          ButtonForm('Listar Pets', route: '/listarPets',),
        ]),
      ),
    );
  }
}
