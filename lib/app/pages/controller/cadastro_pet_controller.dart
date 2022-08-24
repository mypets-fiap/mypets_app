import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:mypets/model/pet.dart';
import 'package:mypets/service/pet_service.dart';

part 'cadastro_pet_controller.g.dart';

class CadastroPetController = CadastroPetControllerBase
    with _$CadastroPetController;

abstract class CadastroPetControllerBase with Store {
  final PetService _petService = PetService();

  save(Pet pet) {
    _petService.save(pet);
  }

  updateImage(XFile image) {}
}
