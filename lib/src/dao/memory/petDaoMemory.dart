import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/src/dao/petDao.dart';
import 'package:pet_shop/src/models/pet.dart';

class PetDaoMemory implements PetDao {
  static final PetDaoMemory _instance = PetDaoMemory._();
  PetDaoMemory._();
  static PetDaoMemory get instance => _instance;
  factory PetDaoMemory() => _instance;

  late final DatabaseReference petsReference = FirebaseDatabase.instance.ref().child('pets');
  late StreamSubscription<DatabaseEvent> petsSubscription;

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
    for (int i = 0; i < dados.length; i++) {
      if (dados[i].id == id) return dados[i];
    }
    return null;
  }
  
  @override
  void getPet() async {
    try {
      final clienteSnapshot = await petsReference.get();
      Map<String, dynamic> pet;
      dados = [];
      for (var i = 1; i < (clienteSnapshot.value as List<dynamic>).length; i++) {
        pet = (clienteSnapshot.value as List<dynamic>)[i];
        dados.add(
          Pet(
            id: i,
            nome: pet['nome'],
            idDono: pet['idDono'],
            animal: pet['animal'],
            raca: pet['raca'],
            rga: pet['rga']
          )
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  
  @override
  void postPet() async {
    Map<String, dynamic> mapDados = {};
    for (var pet in dados) {
      mapDados[pet.id.toString()] = {
        'nome': pet.nome,
        'idDono': pet.idDono,
        'animal': pet.animal,
        'raca': pet.raca,
        'rga': pet.rga,
      };
    }
    await petsReference.set(mapDados);
  }
}
