import 'package:flutter/material.dart';
import 'package:mypets/app/components/button/app_button.dart';
import 'package:mypets/app/components/form/app_form_dropdown.dart';
import 'package:mypets/app/components/form/app_form_radio_button.dart';
import 'package:mypets/app/components/form/app_form_text_field.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class CadastroPetPage extends StatelessWidget {
  const CadastroPetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            _photoAndTitle(),
            const SizedBox(height: 15),
            _petForm(),
          ],
        ),
      ),
    );
  }
}

Widget _header(BuildContext context) {
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

Widget _photoAndTitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: const [
      CircleAvatar(
        radius: 53,
        backgroundColor: AppColor.secundaryColor,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: AppColor.background,
          child: Icon(
            Icons.add_a_photo_rounded,
            size: 50,
          ),
        ),
      ),
      Text(
        "Quem é seu\n novo pet?",
        style: AppTextStyle.headerHome,
      ),
    ],
  );
}

Widget _petForm() {
  final form = GlobalKey<FormState>();

  final controllerNome = TextEditingController();
  final controllerEspecie = TextEditingController();
  final controllerRaca = TextEditingController();
  final controllerDataNascimento = TextEditingController();
  final controllerPorte = TextEditingController();
  final controllerPeso = TextEditingController();
  final controllerSexo = TextEditingController();
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
    child: Form(
      key: form,
      child: Column(
        children: [
          AppFormTextField(label: "Nome", controller: controllerNome),
          AppFormDropdown(
            label: "Espécie",
            items: const ["Cachorro", "Gato"],
            controller: controllerEspecie,
          ),
          AppFormTextField(label: "Raça", controller: controllerRaca),
          AppFormTextField(
            label: "Data de nascimento",
            controller: controllerDataNascimento,
          ),
          AppFormTextField(label: "Porte", controller: controllerPorte),
          AppFormTextField(label: "Peso", controller: controllerPeso),
          AppFormRadioListTile(
            controller: controllerSexo,
            label: "Sexo",
            listItem: const ["Macho", "Fêmea"],
          ),
          const SizedBox(height: 15),
          AppButton(
            label: "Cadastrar",
            onPressed: () {
              if (form.currentState!.validate()) {}
            },
          ),
        ],
      ),
    ),
  );
}
