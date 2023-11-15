import 'package:pet_shop/models/pet.dart';

abstract class PetDao {
  List<Pet> listarTodos();
  Pet? selecionarPorId(int id);
  bool inserir(Pet pet);
  bool alterar(Pet pet);
  bool excluir(Pet pet);
  void getPet();
  void postPet();
}