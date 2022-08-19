import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mypets/model/pet.dart';

class PetRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future savePet(Pet pet) async {
    // Add a new document with a generated ID
    return db.collection("pets").add(pet.toJson()).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

   Future getPet() async {
    return await db.collection("pets").doc("ujVbwCTnkAl43QQnswMB").get().then((querySnapshot) {
      print(querySnapshot.data());
    });
  }
}