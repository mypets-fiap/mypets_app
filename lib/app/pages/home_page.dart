import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mypets/app/pages/controller/home_controller.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';
import 'package:mypets/model/pet.dart';

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
          _cabecalho(),
          _pets(context),
          _tituloAgenda(),
          const RemindersTable(),
          _paddingServicoTitle(),
          ServicesList(),
          const SizedBox(height: 30)
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

  Widget _cabecalho() {
    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 15, left: 10),
              child: Text("Olá, Caio", style: AppTextStyle.headerHome),
            ),
          ],
        ),
      ],
    );
  }

  Widget _paddingServicoTitle() {
    return const Padding(
      padding: EdgeInsets.only(top: 20, bottom: 15),
      child: Text("Serviços", style: AppTextStyle.section),
    );
  }

  Widget _pets(BuildContext context) {
    HomeController controller = HomeController();

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
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 75,
                  width: MediaQuery.of(context).size.width - 15,
                  child: Observer(
                    builder: (context) {
                      return FutureBuilder<List<Pet>>(
                          future: controller.list,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return _newPet(context, controller);
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else {
                              List<Pet>? pets = snapshot.data;
                              return ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: pets!.length + 1,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index == pets.length) {
                                    return _newPet(context, controller);
                                  } else {
                                    return PetCircle(name: pets[index].nome);
                                  }
                                },
                              );
                            }
                          });
                    },
                  ),
                ))
          ],
        )
      ],
    );
  }
}

_newPet(BuildContext context, HomeController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 7),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, "/cadastroPet").then(
              (value) => controller.refreshList(),
            );
          },
        ),
        const Text(
          "Novo pet",
          style: AppTextStyle.petName,
        )
      ],
    ),
  );
}
