import 'package:flutter/material.dart';
import 'package:mypets/app/components/button/app_button.dart';
import 'package:mypets/app/components/form/app_form_text_field.dart';
import 'package:mypets/app/pages/util/app_color.dart';
import 'package:mypets/app/pages/util/app_text_style.dart';

class CadastroPetPage extends StatelessWidget {
  CadastroPetPage({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();

  final _controllerNome = TextEditingController();
  final _controllerEspecie = TextEditingController();
  final _controllerRaca = TextEditingController();
  final _controllerDataNascimento = TextEditingController();
  final _controllerPorte = TextEditingController();
  final _controllerPeso = TextEditingController();
  final _controllerSexo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_sharp),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CircleAvatar(
                radius: 53,
                backgroundColor: AppColor.secundaryColor,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColor.background,
                  child: Icon(
                    Icons.camera_alt,
                    size: 50,
                  ),
                ),
              ),
              Text(
                "Quem é seu\n novo pet?",
                style: AppTextStyle.headerHome,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  AppFormTextField(label: "Nome", controller: _controllerNome),
                  const SizedBox(height: 15),
                  AppFormTextField(
                      label: "Espécie", controller: _controllerEspecie),
                  const SizedBox(height: 15),
                  AppFormTextField(label: "Raça", controller: _controllerRaca),
                  const SizedBox(height: 15),
                  AppFormTextField(
                      label: "Data de nascimento",
                      controller: _controllerDataNascimento),
                  const SizedBox(height: 15),
                  AppFormTextField(
                      label: "Porte", controller: _controllerPorte),
                  const SizedBox(height: 15),
                  AppFormTextField(label: "Peso", controller: _controllerPeso),
                  const SizedBox(height: 15),
                  AppFormTextField(label: "Sexo", controller: _controllerSexo),
                  const SizedBox(height: 20),
                  AppButton(
                    label: "Cadastrar",
                    onPressed: () {
                      if (_form.currentState!.validate()) {}
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
