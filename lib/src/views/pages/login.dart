import 'package:flutter/material.dart';
import 'package:pet_shop/src/views/components/buttonForm.dart';
import 'package:pet_shop/src/views/components/textForm.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  late String textUsuario = "";
  late String textSenha = "";

  late bool invalidUsuario = false;
  late bool invalidSenha = false;

  void login() async {
    setState(() {
      invalidUsuario = textUsuario.isEmpty;
      invalidSenha = textSenha.isEmpty;
    });
    if (!invalidUsuario && !invalidSenha) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: textUsuario,
          password: textSenha
        );
        if(userCredential.user != null) {
          Navigator.of(context).pushNamed('/');
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
            print(e.code);
            if(e.code == 'invalid-email') {
              invalidUsuario = true;
            }
            if(e.code == 'invalid-login-credentials' || e.code == 'too-many-requests') {
              invalidSenha = true;
            }
          });
      }
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