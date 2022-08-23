import 'package:mobx/mobx.dart';
import 'package:mypets/model/pet.dart';
import 'package:mypets/service/pet_service.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final _service = PetService();

  HomeControllerBase() {
    refreshList();
  }

  @observable
  Future<List<Pet>>? list;

  @action
  refreshList() {
    list = _service.getAll();
  }
}
