import 'package:mypets/model/pet.dart';

abstract class PetRepository {
  savePet(Pet pet);
  update(Pet pet);
  Future<Pet> getPet(String id);
  Future<List<Pet>> getAllPets();
}
