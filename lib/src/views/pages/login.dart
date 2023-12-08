import 'package:flutter/material.dart';
import 'package:pet_shop/src/views/components/backgroundImage.dart';
import 'package:pet_shop/src/views/components/loginButton.dart';
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
    double contextWidth = MediaQuery.of(context).size.width;
    double contextHeight = MediaQuery.of(context).size.height;
    return Material(
      child: BackgroundImage(
        child: Container(
          margin: EdgeInsets.only(left: contextWidth < 800 ? 0 : 0.2 * contextWidth, right:  contextWidth < 800 ? 0 : 0.2 * contextWidth),
          color: const Color(0xCCCFF4FF),
          child: Column(children: [
            const SizedBox(height: 100,),
            Image.asset('assets/images/petshop.png', width: 0.4 * contextWidth, height: 0.4 * contextHeight),
            const SizedBox(height: 60,),
            TextForm('LOGIN', onChanged: (value) => textUsuario = value, invalid: invalidUsuario, icon: const Icon(Icons.person),),
            const SizedBox(height: 50,),
            TextForm('SENHA', onChanged: (value) => textSenha = value, invalid: invalidSenha, password: true, icon: const Icon(Icons.lock),),
            const SizedBox(height: 50,),
            LoginButton('ENTRAR', function: login,),
          ]),
        ),
      ),
    );
  }
}