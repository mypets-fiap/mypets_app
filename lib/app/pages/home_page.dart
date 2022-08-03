
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

import '../../model/event_pet.dart';
import '../components/geral/pet_circle.dart';
import '../components/geral/reminders_table.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: header(),
          ),
          pets(),
          const Padding(
            padding: EdgeInsets.only(left: 17, right: 17, top: 50),
            child: RemindersTable(),
          )
        ],
      ),
    );
  }
}

Widget header() {
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
      Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text("Seus pets", style: AppTextStyle.section),
          ),
        ],
      ),
    ],
  );
}

Widget pets() {
  List<String> pets = [];
  pets.add("Rodolfo");
  pets.add("Sheilo");
  pets.add("Corintiano");
  pets.add("Piggy");
  pets.add("Pidgey");
  pets.add("Pikachu");
  pets.add("Squirtle");
  pets.add("Pidgey");

  return SizedBox(
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
                children: const [
                  Icon(Icons.add),
                  Text(
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
  );
}