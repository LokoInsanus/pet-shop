import 'package:pet_shop/models/cliente.dart';

abstract class ClienteDao {
  List<Cliente> listarTodos();
  Cliente? selecionarPorId(int id);
  bool inserir(Cliente cliente);
  bool alterar(Cliente cliente);
  bool excluir(Cliente cliente);
  void getDatabase();
  void postDatabase(List<Cliente> dados);
}