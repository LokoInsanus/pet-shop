import 'package:flutter/material.dart';
import 'package:pet_shop/src/views/components/backgroundImage.dart';
import 'package:pet_shop/src/views/components/defaultButton.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BackgroundImage(
        child: Container(
          margin: const EdgeInsets.only(left: 400, right: 400),
          decoration: const BoxDecoration(
            color: Color(0xCCCFF4FF)
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 100, bottom: 100, left: 200, right: 200),
            decoration: BoxDecoration(
              color: const Color(0xB2000088),
              borderRadius: BorderRadius.circular(80)
            ),
            child: const Column(children: [
              SizedBox(height: 150,),
              DefaultButton('Cadastrar Cliente', route: '/registroCliente',),
              SizedBox(height: 50,),
              DefaultButton('Cadastrar Pet', route: '/registroPet',),
              SizedBox(height: 50,),
              DefaultButton('Listar Clientes', route: '/listarClientes',),
              SizedBox(height: 50,),
              DefaultButton('Listar Pets', route: '/listarPets',),
            ]),
          ),
        ),
      ),
    );
  }
}
