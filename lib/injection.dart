import 'package:get_it/get_it.dart';
import 'package:mypets/database/firebase/pet_repositoty_firebase_impl.dart';
import 'package:mypets/database/pet_repository.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<PetRepository>(PetRepositoryFirebaseImpl());
}
