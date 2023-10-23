import 'package:flutter/material.dart';
import 'package:pet_shop/dao/clienteDao.dart';
import 'package:pet_shop/dao/memory/clienteDaoMemory.dart';
import 'package:pet_shop/models/cliente.dart';
import 'package:pet_shop/views/components/textForm.dart';
import 'package:pet_shop/views/components/buttonForm.dart';

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

  ClienteDao clienteDao = ClienteDaoMemory();

  void salvarDados() {
    final Cliente registro = Cliente(id: 0, nome: '', email: '', rua: '', bairro: '', numeroCasa: '', numeroTelefone: '', cpf: '');

    registro.nome = textNome.textValue;
    registro.email = textEmail.textValue;
    registro.rua = textRua.textValue;
    registro.bairro = textBairro.textValue;
    registro.numeroCasa = textNumero.textValue;
    registro.numeroTelefone = textTelefone.textValue;
    registro.cpf = textCPF.textValue;

    clienteDao.inserir(registro);
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
        textNome,
        const SizedBox(height: 20,),
        textEmail,
        const SizedBox(height: 20,),
        textRua,
        const SizedBox(height: 20,),
        textBairro,
        const SizedBox(height: 20,),
        textNumero,
        const SizedBox(height: 20,),
        textTelefone,
        const SizedBox(height: 20,),
        textCPF,
        const SizedBox(height: 20,),
        ButtonForm('Salvar', function: salvarDados),
      ]),
    );
  }
}
