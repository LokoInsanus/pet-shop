import 'package:flutter/material.dart';
import 'package:pet_shop/dao/clienteDao.dart';
import 'package:pet_shop/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/models/cliente.dart';
import 'package:pet_shop/views/components/textForm.dart';
import 'package:pet_shop/views/components/buttonForm.dart';

// ignore: must_be_immutable
class RegistroCliente extends StatefulWidget {
  const RegistroCliente({Key? key}) : super(key: key);

  @override
  State<RegistroCliente> createState() => _RegistroClienteState();
}

class _RegistroClienteState extends State<RegistroCliente> {
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
    final Cliente registro = Cliente(id: 0, nome: '', email: '', rua: '', bairro: '', numeroCasa: '', numeroTelefone: '', cpf: '');

    registro.nome = textNome;
    registro.email = textEmail;
    registro.rua = textRua;
    registro.bairro = textBairro;
    registro.numeroCasa = textNumero;
    registro.numeroTelefone = textTelefone;
    registro.cpf = textCPF;

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
      clienteDao.inserir(registro);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Cadastro de Cliente'),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(height: 20,),
        TextForm('Nome do Cliente', onChanged: (value) => textNome = value, invalid: invalidNome,),
        const SizedBox(height: 20,),
        TextForm('Email do Cliente', onChanged: (value) => textEmail = value, invalid: invalidEmail,),
        const SizedBox(height: 20,),
        TextForm('Rua do Cliente', onChanged: (value) => textRua = value, invalid: invalidRua,),
        const SizedBox(height: 20,),
        TextForm('Bairro do Cliente', onChanged: (value) => textBairro = value, invalid: invalidBairro,),
        const SizedBox(height: 20,),
        TextForm('Número da Casa', onChanged: (value) => textNumero = value, invalid: invalidNumero,),
        const SizedBox(height: 20,),
        TextForm('Número de Telefone', telefone: true, onChanged: (value) => textTelefone = value, invalid: invalidTelefone,),
        const SizedBox(height: 20,),
        TextForm('CPF do Cliente', cpf: true, onChanged: (value) => textCPF = value, invalid: invalidCPF,),
        const SizedBox(height: 20,),
        ButtonForm('Salvar', function: salvarDados),
      ]),
    );
  }
}
