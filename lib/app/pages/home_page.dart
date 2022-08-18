
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

import '../../model/event_pet.dart';
import '../components/geral/pet_circle.dart';
import '../components/geral/reminders_table.dart';
import '../components/geral/services_list.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          cabecalho(),
          _pets(),
          _tituloAgenda(),
          RemindersTable(),
          _paddingServicoTitle(),
          ServicesList()
          const SizedBox(height: 30)
        ],
      ),
    );
  }
  
  Widget _tituloAgenda(){
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10, left: 20),
              child: Text(
                  "Agenda",
                  style: AppTextStyle.section,
                  textAlign:TextAlign.left
              ),
            )
          ],
        )
      ],
    );
  }

Widget cabecalho() {
  return Column(
    children: [
      Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 35),
            child: Text("Olá, Caio", style: AppTextStyle.headerHome),
          ),
        ],
      ),
    ],
  );
}

  Widget _paddingServicoTitle(){
    return Padding(
      padding: EdgeInsets.only(top:20, bottom: 15),
      child: Text("Serviços", style: AppTextStyle.section),
    );
  }

  Widget _pets() {
    List<String> pets = [];
    pets.add("Rodolfo");
    pets.add("Sheilo");
    pets.add("Corintiano");
    pets.add("Piggy");
    pets.add("Pidgey");
    pets.add("Pikachu");
    pets.add("Squirtle");
    pets.add("Pidgey");

  return Column(
    children: [
      Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 15, left: 17),
            child: Text("Seus pets", style: AppTextStyle.section),
          ),
        ],
      ),
      SizedBox(
        height: 75,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pets.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == pets.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          Navigator.pushNamed(context, "/cadastroPet");
                        },
                      ),
                      const Text(
                        "Novo pet",
                        style: AppTextStyle.petName,
                      )
                    ],
                  ),
                );
              } else {
                return PetCircle(name: pets[index]);
              }
            }),
      ),
    ],
  );
}
