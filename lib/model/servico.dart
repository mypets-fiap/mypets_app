import 'package:cloud_firestore/cloud_firestore.dart';

class Servico {
  final String nome;
  final String imagemPath;

  DocumentReference? reference;

  Servico(this.nome, this.imagemPath);

  Servico.fromMap(Map<String, dynamic> map, {this.reference})
      : nome = map['nome'],
        imagemPath = map['imagemPath'];

  Servico.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
      reference: snapshot.reference);

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'imagemPath': imagemPath
  };
}