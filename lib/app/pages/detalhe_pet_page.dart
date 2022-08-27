import 'package:flutter/material.dart';
import 'package:mypets/app/components/geral/informacoes_pet.dart';
import 'package:mypets/app/components/geral/pet_circle.dart';
import 'package:mypets/app/components/geral/reminders_table.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';
import 'package:mypets/model/pet.dart';

class DetalhesPet extends StatelessWidget {
  const DetalhesPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)?.settings.arguments as Map;
    Pet pet = args['pet'];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _cabecalho(context),
            _fotoNome(pet),
            const SizedBox(height: 15),
            InformacoesPet(pet: pet),
            const SizedBox(height: 15),
            _tituloAgenda(),
            const RemindersTable(),
          ],
        ),
      ),
    );
  }
}

Widget _cabecalho(BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
      )
    ],
  );
}

Widget _fotoNome(Pet pet) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        PetCircle(tamanho: 53, pet: pet),
        const SizedBox(width: 40),
        Text(
          pet.nome.length < 15 ? pet.nome : "${pet.nome.substring(0, 15)}...",
          style: AppTextStyle.headerHome,
        ),
      ],
    ),
  );
}

Widget _tituloAgenda() {
  return Column(
    children: [
      Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 20),
            child: Text("Agenda",
                style: AppTextStyle.section, textAlign: TextAlign.left),
          )
        ],
      )
    ],
  );
}
