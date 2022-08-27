import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Pet {
  dynamic id;
  final String nome;
  final String especie;
  final String raca;
  final DateTime dtNascimento;
  final String porte;
  final String peso;
  final String sexo;
  final String? url;

  DocumentReference? reference;

  var dateFormat = DateFormat("yyyy-MM-dd");

  Pet(this.nome, this.especie, this.raca, this.dtNascimento, this.porte,
      this.peso, this.sexo,
      {this.url = ""});

  Pet.fromJson(Map<String, dynamic> json)
      : nome = json['nome'],
        especie = json['especie'],
        raca = json['raca'],
        dtNascimento = DateTime.parse(json['dtNascimento']),
        porte = json['porte'],
        peso = json['peso'],
        sexo = json['sexo'],
        url = json['url'];

  Pet.fromMap(Map<String, dynamic> map, {this.reference})
      : nome = map['nome'],
        especie = map['especie'],
        raca = map['raca'],
        dtNascimento = DateTime.parse(map['dtNascimento']),
        porte = map['porte'],
        peso = map['peso'],
        sexo = map['sexo'],
        url = map['url'];
  Pet.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);
  Map<String, dynamic> toJson() => {
        'nome': nome,
        'especie': especie,
        'raca': raca,
        'dtNascimento': dateFormat.format(dtNascimento),
        'porte': porte,
        'peso': peso,
        'sexo': sexo,
        'url': url,
      };
}
