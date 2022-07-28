import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypets/model/pet.dart';

class PetRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future savePet(Pet pet) async {
    // Add a new document with a generated ID
    return db.collection("pets").add(pet.toJson()).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}