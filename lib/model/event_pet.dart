import 'package:cloud_firestore/cloud_firestore.dart';

class EventPet {
  final DateTime data;
  final String compromisso;
  final String pet;

  DocumentReference? reference;

  EventPet(this.data, this.compromisso, this.pet);

  EventPet.fromMap(Map<String, dynamic> map, {this.reference})
      : data = map['data'],
        compromisso = map['compromisso'],
        pet = map['pet'];

  EventPet.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
      reference: snapshot.reference);

  Map<String, dynamic> toJson() => {
    'data': data,
    'compromisso': compromisso,
    'pet': pet
  };
}