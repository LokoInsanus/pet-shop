import 'package:pet_shop/dao/petDao.dart';
import 'package:pet_shop/models/pet.dart';

class PetDaoMemory implements PetDao {
  static PetDaoMemory _instance = PetDaoMemory._();
  PetDaoMemory._();
  static PetDaoMemory get instance => _instance;
  factory PetDaoMemory() => _instance;

  List<Pet> dados = [
    Pet(
      id: 1,
      nome: 'Ursa',
      idDono: 1,
      animal: 'Cachorro',
      raca: 'Rottweiler',
      rga: '1.234.567'
    ),
    Pet(
      id: 2,
      nome: 'Freddy',
      idDono: 1,
      animal: 'Cachorro',
      raca: 'Caramelo',
      rga: '7.654.321'
    )
  ];

  @override
  bool alterar(Pet pet) {
    int ind = dados.indexOf(pet);
    if (ind >= 0) {
      dados[ind] = pet;
      return true;
    }
    return false;
  }

  @override
  bool excluir(Pet pet) {
    int ind = dados.indexOf(pet);
    if (ind >= 0) {
      dados.removeAt(ind);
      return true;
    }
    return false;
  }

  @override
  bool inserir(Pet pet) {
    dados.add(pet);
    pet.id = dados.length;
    return true;
  }

  @override
  List<Pet> listarTodos() {
    return dados;
  }

  @override
  Pet? selecionarPorId(int id) {
    for (int i = 0; i < dados.length; i++)
      if (dados[i].id == id) return dados[i];
    return null;
  }
}
