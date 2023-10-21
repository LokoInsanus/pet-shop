import 'package:flutter/material.dart';
import 'package:pet_shop/dao/clienteDao.dart';
import 'package:pet_shop/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/views/components/textForm.dart';
import 'package:pet_shop/views/components/buttonForm.dart';

import '../../models/cliente.dart';

// ignore: must_be_immutable
class RegistroCliente extends StatelessWidget {
  RegistroCliente({Key? key}) : super(key: key);

  late TextForm textNome = TextForm('Nome do Cliente');
  late TextForm textEmail = TextForm('Email do Cliente');
  late TextForm textRua = TextForm('Rua do Cliente');
  late TextForm textBairro = TextForm('Bairro do Cliente');
  late TextForm textNumero = TextForm('Número da Casa');
  late TextForm textTelefone = TextForm('Número de Telefone', telefone: true);
  late TextForm textCPF = TextForm('CPF do Cliente', cpf: true);

  late Cliente _registro;
  ClienteDao clienteDao = ClienteDaoMemory();

  void salvarDados() {
    _registro.nome = textNome.textValue;
    _registro.email = textEmail.textValue;
    _registro.rua = textRua.textValue;
    _registro.bairro = textBairro.textValue;
    _registro.numeroCasa = textNumero.textValue;
    _registro.numeroTelefone = textTelefone.textValue;
    _registro.cpf = textCPF.textValue;

    clienteDao.inserir(_registro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Shop - Cadastro de Cliente'),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        textNome,
        const SizedBox(
          height: 20,
        ),
        textEmail,
        const SizedBox(
          height: 20,
        ),
        textRua,
        const SizedBox(
          height: 20,
        ),
        textBairro,
        const SizedBox(
          height: 20,
        ),
        textNumero,
        const SizedBox(
          height: 20,
        ),
        textTelefone,
        const SizedBox(
          height: 20,
        ),
        textCPF,
        const SizedBox(
          height: 20,
        ),
        ButtonForm('Salvar', function: salvarDados)
      ]),
    );
  }
}
