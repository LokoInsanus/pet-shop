import 'package:flutter/material.dart';
import 'package:pet_shop/src/views/components/backgroundImage.dart';
import 'package:pet_shop/src/views/components/defaultButton.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;
    double contextHeight = MediaQuery.of(context).size.height;
    return Material(
      child: BackgroundImage(
        child: Container(
          margin: EdgeInsets.only(left: contextWidth < 800 ? 0 : 0.2 * contextWidth, right:  contextWidth < 800 ? 0 : 0.2 * contextWidth),
          decoration: const BoxDecoration(
            color: Color(0xCCCFF4FF)
          ),
          child: Container(
            margin: EdgeInsets.only(top: 0.1 * contextHeight, bottom: 0.1 * contextHeight, left: 0.1 * contextWidth, right: 0.1 * contextWidth),
            decoration: BoxDecoration(
              color: const Color(0xB2000088),
              borderRadius: BorderRadius.circular(80)
            ),
            child: Column(children: [
              SizedBox(height: 0.15 * contextHeight),
              const DefaultButton('Cadastrar Cliente', route: '/registroCliente',),
              const SizedBox(height: 50,),
              const DefaultButton('Cadastrar Pet', route: '/registroPet',),
              const SizedBox(height: 50,),
              const DefaultButton('Listar Clientes', route: '/listarClientes',),
              const SizedBox(height: 50,),
              const DefaultButton('Listar Pets', route: '/listarPets',),
            ]),
          ),
        ),
      ),
    );
  }
}
