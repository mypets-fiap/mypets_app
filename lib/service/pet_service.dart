import 'package:get_it/get_it.dart';
import 'package:mypets/database/pet_repository.dart';
import 'package:mypets/model/pet.dart';

class PetService {
  final petRepository = GetIt.I.get<PetRepository>();

  save(Pet pet) async {
    await petRepository.savePet(pet);
  }

  Future<List<Pet>> getAll() {
    return petRepository.getAllPets();
  }

  // Pet get(String reference) {
  //   return ;
  // }
}
