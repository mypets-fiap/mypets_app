import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:mypets/model/pet.dart';
import 'package:mypets/service/pet_service.dart';

part 'cadastro_pet_controller.g.dart';

class CadastroPetController = CadastroPetControllerBase
    with _$CadastroPetController;

abstract class CadastroPetControllerBase with Store {
  final PetService _petService = PetService();

  @observable
  String downloadUrl =
      'https://firebasestorage.googleapis.com/v0/b/mypets-fiap.appspot.com/o/images%2F8690f737-4ca7-420f-be58-d7fc1573a28e1078043974187411617.jpg?alt=media';

  save(Pet pet) {
    _petService.save(pet);
  }

  updateImage(File image) {}
}
