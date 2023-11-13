import 'package:flutter/material.dart';
import 'package:pet_shop/views/components/buttonForm.dart';
import 'package:pet_shop/views/components/textForm.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String textUsuario = "";
  late String textSenha = "";

  late bool invalidUsuario = false;
  late bool invalidSenha = false;

  void login() {
    setState(() {
      invalidUsuario = textUsuario.isEmpty;
      invalidSenha = textSenha.isEmpty;
    });
    if(textUsuario == 'Otario'.toLowerCase() && textSenha == '1234\$#@!') {
      Navigator.of(context).pushNamed('/');
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        const SizedBox(height: 20,),
        TextForm('Usuário', onChanged: (value) => textUsuario = value, invalid: invalidUsuario,),
        const SizedBox(height: 20,),
        TextForm('Senha', onChanged: (value) => textSenha = value, invalid: invalidSenha, password: true,),
        const SizedBox(height: 20,),
        ButtonForm('Login', function: login,),
      ]),
    );
  }
}