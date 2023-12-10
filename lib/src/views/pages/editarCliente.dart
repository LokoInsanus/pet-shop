import 'package:flutter/material.dart';
import 'package:pet_shop/src/dao/clienteDao.dart';
import 'package:pet_shop/src/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/src/models/cliente.dart';
import 'package:pet_shop/src/views/components/back.dart';
import 'package:pet_shop/src/views/components/backgroundImage.dart';
import 'package:pet_shop/src/views/components/textForm.dart';
import 'package:pet_shop/src/views/components/defaultButton.dart';

// ignore: must_be_immutable
class EditarCliente extends StatefulWidget {
  const EditarCliente({Key? key}) : super(key: key);

  @override
  State<EditarCliente> createState() => _RegistroClienteState();
}

class _RegistroClienteState extends State<EditarCliente> {
  late bool invalidNome = false;
  late bool invalidEmail = false;
  late bool invalidRua = false;
  late bool invalidBairro = false;
  late bool invalidNumero = false;
  late bool invalidTelefone = false;
  late bool invalidCPF = false;

  late String textNome = "";
  late String textEmail = "";
  late String textRua = "";
  late String textBairro = "";
  late String textNumero = "";
  late String textTelefone = "";
  late String textCPF = "";

  ClienteDao clienteDao = ClienteDaoMemory();

  void salvarDados() {
    Cliente cliente = ModalRoute.of(context)!.settings.arguments as Cliente;
    Cliente registro = cliente;

    registro.nome = textNome == '' ? cliente.nome : textNome;
    registro.email = textEmail == '' ? cliente.email : textEmail;
    registro.rua = textRua == '' ? cliente.rua : textRua;
    registro.bairro = textBairro == '' ? cliente.bairro : textBairro;
    registro.numeroCasa = textNumero == '' ? cliente.numeroCasa : textNumero;
    registro.numeroTelefone = textTelefone == '' ? cliente.numeroTelefone : textTelefone;
    registro.cpf = textCPF == '' ? cliente.cpf : textCPF;

    setState(() {
      invalidNome = registro.nome.isEmpty;
      invalidEmail = registro.email.isEmpty;
      invalidRua = registro.rua.isEmpty;
      invalidBairro = registro.bairro.isEmpty;
      invalidNumero = registro.numeroCasa.isEmpty;
      invalidTelefone = registro.numeroTelefone.length != 15;
      invalidCPF = registro.cpf.length != 14;
    });

    if(!invalidNome && !invalidEmail && !invalidRua && !invalidBairro && !invalidNumero && !invalidTelefone && !invalidCPF) {
      clienteDao.alterar(registro);
      Navigator.of(context).pushReplacementNamed('/listarClientes');
      clienteDao.postCliente();
    }
  }

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;
    double contextHeight = MediaQuery.of(context).size.height;
    Cliente cliente = ModalRoute.of(context)!.settings.arguments as Cliente;
    
    return Material(
      child: BackgroundImage(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: contextWidth < 800 ? 0 : 0.2 * contextWidth, right:  contextWidth < 800 ? 0 : 0.2 * contextWidth),
              decoration: const BoxDecoration(
                color: Color(0xCCCFF4FF),
              ),
              child: ListView(children: [
                SizedBox(height: 0.15 * contextHeight,),
                TextForm('Nome do Cliente', onChanged: (value) => textNome = value, invalid: invalidNome, placeholder: cliente.nome,),
                const SizedBox(height: 40,),
                TextForm('Email do Cliente', onChanged: (value) => textEmail = value, invalid: invalidEmail, placeholder: cliente.email,),
                const SizedBox(height: 40,),
                TextForm('Rua do Cliente', onChanged: (value) => textRua = value, invalid: invalidRua, placeholder: cliente.rua,),
                const SizedBox(height: 40,),
                TextForm('Bairro do Cliente', onChanged: (value) => textBairro = value, invalid: invalidBairro, placeholder: cliente.bairro,),
                const SizedBox(height: 40,),
                TextForm('Número da Casa', onChanged: (value) => textNumero = value, invalid: invalidNumero, placeholder: cliente.numeroCasa,),
                const SizedBox(height: 40,),
                TextForm('Número de Telefone', telefone: true, onChanged: (value) => textTelefone = value, invalid: invalidTelefone, placeholder: cliente.numeroTelefone,),
                const SizedBox(height: 40,),
                TextForm('CPF do Cliente', cpf: true, onChanged: (value) => textCPF = value, invalid: invalidCPF, placeholder: cliente.cpf,),
                const SizedBox(height: 40,),
                DefaultButton('SALVAR', function: salvarDados),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.025 * contextHeight, left: 0.22 * contextWidth),
              child: const Back()
            ),            
          ],
        ),
      ),
    );
  }
}
