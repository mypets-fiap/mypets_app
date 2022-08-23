import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypets/database/pet_repository.dart';
import 'package:mypets/model/pet.dart';

class PetRepositoryFirebaseImpl implements PetRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  savePet(Pet pet) async {
    return await db.collection("pets").add(pet.toJson()).then(
        (DocumentReference doc) =>
            print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  @override
  update(Pet pet) async {
    return db.collection("pets").doc(pet.id).set(pet.toJson());
  }

  @override
  Future<Pet> getPet(String id) async {
    return await db.collection("pets").doc(id).get().then((querySnapshot) {
      return Pet.fromMap(querySnapshot.data()!);
    });
  }

  @override
  Future<List<Pet>> getAllPets() async {
    var result = await db.collection("pets").get();
    return result.docs.map((e) => Pet.fromSnapshot(e)).toList();
  }
}
