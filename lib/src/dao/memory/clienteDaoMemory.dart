import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/src/dao/clienteDao.dart';
import 'package:pet_shop/src/models/cliente.dart';

class ClienteDaoMemory implements ClienteDao {
  static final ClienteDaoMemory _instance = ClienteDaoMemory._();
  ClienteDaoMemory._();
  static ClienteDaoMemory get instance => _instance;
  factory ClienteDaoMemory() => _instance;

  late final DatabaseReference clientesReference = FirebaseDatabase.instance.ref().child('clientes');
  late StreamSubscription<DatabaseEvent> clientesSubscription;

  List<Cliente> dados = [
    Cliente(
      id: 1,
      nome: 'Marcelo',
      email: 'marcelo@marcelo.com',
      rua: 'Rua do Marcelo',
      bairro: 'Bairro do Marcelo',
      numeroCasa: '123',
      numeroTelefone: '(28) 99999-9999',
      cpf: '123.456.789-10'
    )
  ];

  @override
  bool alterar(Cliente cliente) {
    int ind = dados.indexOf(cliente);
    if (ind >= 0) {
      dados[ind] = cliente;
      return true;
    }
    return false;
  }

  @override
  bool excluir(Cliente cliente) {
    int ind = dados.indexOf(cliente);
    if (ind >= 0) {
      dados.removeAt(ind);
      return true;
    }
    return false;
  }

  @override
  bool inserir(Cliente cliente) {
    dados.add(cliente);
    cliente.id = dados.length;
    return true;
  }

  @override
  List<Cliente> listarTodos() {
    return dados;
  }

  @override
  Cliente? selecionarPorId(int id) {
    for (int i = 0; i < dados.length; i++) {
      if (dados[i].id == id) return dados[i];
    }
    return null;
  }
  
  @override
  void getCliente() async {
    try {
      final clienteSnapshot = await clientesReference.get();
      Map cliente;
      dados = [];
      for (var i = 1; i < (clienteSnapshot.value as List<dynamic>).length; i++) {
        cliente = (clienteSnapshot.value as List<dynamic>)[i];
        dados.add(
          Cliente(
            id: i,
            nome: cliente['nome'],
            email: cliente['email'],
            rua: cliente['rua'],
            bairro: cliente['bairro'],
            numeroCasa: cliente['numeroCasa'],
            numeroTelefone: cliente['numeroTelefone'],
            cpf: cliente['cpf']
          )
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void postCliente() async {
    Map<String, dynamic> mapDados = {};
    for (var cliente in dados) {
      mapDados[cliente.id.toString()] = {
        'nome': cliente.nome,
        'email': cliente.email,
        'rua': cliente.rua,
        'bairro': cliente.bairro,
        'numeroCasa': cliente.numeroCasa,
        'numeroTelefone': cliente.numeroTelefone,
        'cpf': cliente.cpf,
      };
    }
    await clientesReference.set(mapDados);
  }
}
