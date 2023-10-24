import 'package:pet_shop/dao/clienteDao.dart';
import 'package:pet_shop/models/cliente.dart';

class ClienteDaoMemory implements ClienteDao {
  static ClienteDaoMemory _instance = ClienteDaoMemory._();
  ClienteDaoMemory._();
  static ClienteDaoMemory get instance => _instance;
  factory ClienteDaoMemory() => _instance;

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
    for (int i = 0; i < dados.length; i++)
      if (dados[i].id == id) return dados[i];
    return null;
  }
}
