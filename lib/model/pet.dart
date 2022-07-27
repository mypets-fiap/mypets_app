import 'package:cloud_firestore/cloud_firestore.dart';

class Pet {
  final String nome;
  final String especie;
  final String raca;
  final DateTime dtNascimento;
  final String porte;
  final String sexo;

  DocumentReference? reference;

  Pet(this.nome, this.especie, this.raca, this.dtNascimento, this.porte, this.sexo);

  Pet.fromMap(Map<String, dynamic> map, {this.reference})
      : nome = map['nome'],
        especie = map['especie'],
        raca = map['raca'],
        dtNascimento = map['dtNascimento'],
        porte = map['porte'],
        sexo = map['sexo'];
  Pet.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
      reference: snapshot.reference);
  Map<String, dynamic> toJson() => {
    'nome': nome,
    'especie': especie,
    'raca': raca,
    'dtNascimento': dtNascimento,
    'porte': porte,
    'sexo': sexo,
  };
}