import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypets/model/pet.dart';

class PetRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future savePet(Pet pet) async {
    return db.collection("pets").add(pet.toJson()).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future update(Pet pet) async {
    return db.collection("pets").doc(pet.id).set(pet.toJson());
  }

  Future<Pet> getPet(String id) async {
    return await db.collection("pets").doc(id).get().then((querySnapshot) {
      return Pet.fromMap(querySnapshot.data()!);
    });
  }

  Future<List<Pet>> getAllPets() async {
     var result = await db.collection("pets").get();
     return result.docs.map((e) => Pet.fromSnapshot(e)).toList();
  }
}