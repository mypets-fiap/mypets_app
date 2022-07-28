import 'package:flutter/material.dart';
import 'package:mypets/app/components/geral/pet_circle.dart';

import 'package:mypets/app/pages/util/app_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: cabecalho(),
          ),
          pets(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
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
      ),
    ],
  );
}
